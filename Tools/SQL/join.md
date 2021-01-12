
## Tables we will be using

|martian|
|-------|
|martian_id|
|first_name|
|last_name|
|base_id|
|super_id|

|base|
|-------|
|base_id|
|base_name|
|founded|

|visitor|
|-------|
|visitor_id|
|host_id|
|first_name|
|last_name|

|inventory|
|-------|
|base_id|
|supply_id|
|quantity|

|supply|
|-------|
|supply_id|
|name|
|description|
|quantity|

## SQL Join  
When you have two tables and there is a value that connects them, you can JOIN them together when you need values from both tables

```
SELECT * 
FROM martian /* Left table*/
INNER JOIN base /* Right table, */

ON martian.base_id = base.base_id;
/*  Only connect martin row, 
    with base row if they have the same base id, 
    we use table name to show where each column is from
*/

```


### Types of joins

```
SELECT * 
FROM martian /* Left table*/
______ JOIN base /* Right table, */

ON martian.base_id = base.base_id  
WHERE condition(s)
ORDER BY value;
```

**INNER Join**
* Only returns connected, matching rows
* venn-diagram: left && right

**LEFT Join**
* Returns all connected rows, and unconnected rows from left table (nulls in right)
* venn-diagram: left

**RIGHT Join**
* Returns all connected rows, and unconnected rows from right table (nulls in left)
* venn-diagram: right

**FULL Join**
* Returns connected rows & unconnected rows from both left & right tables
* venn-diagram: left || right

### Specify and column name in SELECT clause

To avoid ambiguity, specify table name, (although, if there is no ambiguity w.e)

```
SELECT martian.martian_id, base.base_id, base.base_name
FROM martian /* Left table*/
INNER JOIN base /* Right table, */
ON martian.base_id = base.base_id;
```
### Create Alias for table name

* Use `AS` keyword
* anywhere in the query you can use the alias 
* use to avoid excessive typing

```
SELECT m.martian_id, b.base_id, b.base_name
FROM martian AS m
INNER JOIN base AS b
ON m.base_id = b.base_id;
```

## More JOIN examples

Display name of each visitor,
Show name of visitor's host

```
SELECT  v.first_name, v.last_name, 
        m.first_name, m.host_name
FROM visitor AS v
LEFT JOIN martian as m 
/* EVERY VISITOR IS INCLUDE EVEN THOSE W.O HOSTS */
ON v.host_id = m.martian_id;
```

Cool so the problem is that we have two columns named `first_name` and two columns named `last_name`

We can clarify this wby giving the **columns alias** too

```
SELECT 
v.first_name AS visitor_fn, v.last_name AS visitor_ln, 
m.first_name AS martian_fn, m.last_name AS martian_ln
FROM visitor AS v
LEFT JOIN martian as m 
ON v.host_id = m.martian_id;
```

## Self join example
Display list of each martian and the person they report to

Super report, the `super_id` is another `martian_id`

```
SELECT  m.first_name AS fn, m.last_name AS ln
        s.first_name AS super_fn, s.last_name AS super_ln*
FROM martian AS m
LEFT JOIN martian as s
/* We want all Martians to be in the report, even those without supers */
ON m.super_id = s.martian_id
ORDER BY m.martian_id
```

### Sub-query example

A query inside of a query is called a sub-query

For a base report

```
SELECT * FROM inventory WHERE base_id = 1;
```

Missing information:
* regarding the Name of supplies
* Items not in storage

We need to join with supply table

```
SELECT *
FROM (SELECT * FROM inventory WHERE base_id = 1) AS i
/* Setting an alias on the results of this sub-query */
RIGHT JOIN supply AS s
ON i.suppl_Id = s.supply_id
ORDER BY s.supply_id;
```

**Cleaning it up (column name)**

```
SELECT s.supply_id, i.quantity, s.name, s.description
FROM (SELECT * FROM inventory WHERE base_id = 1) AS i
RIGHT JOIN supply AS s
ON i.suppl_Id = s.supply_id
ORDER BY s.supply_id;
```


### "No host" query,

We want a list of "visitors" without "hosts" 

* List of visitors without host 
* Martians available to do the job

```
SELECT 
v.first_name AS visitor_fn, v.last_name AS visitor_ln, 
m.first_name AS martian_fn, m.last_name AS martian_ln
FROM visitor AS v
FULL JOIN martian AS m 
/* Full join because we want visitors without a match on the right and martians without a match on the left table */
ON v.host_id = m.martian_id
WHERE m.martian_id IS NULL OR v.visitor_id is NULL
/* We can filter out ppl who are paired up*/
```