
# ElasticSearch

## Index

* An index is like a 'database' in a relational , it has a mapping which defines multiple types (which is a table)
An index
* The easiest and most familiar layout clones what you would expect from a relational database. You can (very roughly) think of an index like a database.

```
MySQL => Databases => Tables => Columns/Rows
Elasticsearch => Indices => Types => Documents(like Row) with Properties (with columns)
```

## Shard

* Elasticsearch is build to be always available and to scale with your needs.
* It does this by being distributed by nature. You can add services (nodes) to a cluster to increase capacity and ElasticSearch automatically distributes your data and query load across all of the available nodes.
* No need to overhaul your application, Elasticsearch knows how to balance multi-node clusters to provide scale and high availability. The more nodes, the merrier
* How does this work? Under the covers, an ElasticSearch index is really just a logical grouping of one or more physical shards,
* Where each shard is actually a self-contained index. By distributing the documents in an index across multiple shards
* and distributing those shards across multiple nodes,

ElasticSearch can ensure redundancy, which both protects against hardware failure and increases query capacity as nodes are added to a cluster.

As the cluster grows or (shrinks), Elasticsearch automatically migrates shards to re-balance the cluster.

There are two types of shards: primaries and replicas. Each document in an index belows to one primary shard

A replica shard is a copy of a primary shard, Replicas provide redundant copies of your data to protect against hardware failure and increase capacity to serve read requests like searching or retrieving a document.

The number of primary shards in an index is fixed at the time that an index is created, but the number of replica shards can be changed at any time, without interrupting indexing or query operations.

Shards are pieces of your data, if you have two shards and 100 documents, each shard has 50 documents
Each node of your cluster holds this piece accordingly to the "shard_number" configured to the index where the data is stored.

## Node

Any time that you start an instance of Elasticsearch, you are starting a node. A collection of nodes is called a cluster. If you are running a single node of Elasticsearch, then you have a cluster of one node.

Every node in the cluster can handle HTTP and Transport traffic by default. The transport layer is used exclusively for communication between nodes; the HTTP layer is used by REST clients.

All nodes know about all the other nodes in the cluster and can forward client requests to the appropriate node.

By default, a node is all fo the following types: master-eligible, data, ingest and machine learning (if available)

Master-eligible node
    A node that has node.master set to true (default), which makes it eligible to be elected as a master node, which controls the cluster

Data node
    A node that has node.data set to true (Default). Data nodes hold data and perform data related operations such as CRUD, search and aggregations

Ingest node
    A node that has node.ingest set to true (default). Ingest nodes are able to apply an ingest pipeline to an document in order to transform and enrich the documents before indexing. With a heavy ingest load, it makes sense to use dedicated ingest nodes and to mark the master and data nodes as node.ingest: false.

Machine learning node

A node that has xpack.ml.enabled and node.ml set to true, which is the default behavior in the Elasticsearch default distribution. If you want to use machine learning features, there must be at least one machine learning node in your cluster. For more information about machine learning features, see Machine learning in the Elastic Stack.