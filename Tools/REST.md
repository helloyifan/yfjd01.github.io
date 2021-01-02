## REST paradigm

### REpresentational State Transfer

REST, or REpresentational State Transfer, is an architectural style for providing standards between computer systems on the web

RESTful systems are characterized by how they are stateless and separate the concerns of client and server

### Statelessness
Systems that follow the REST paradigm are stateless, meaning that the server does not need to know anything about what state the client is in and vice versa.

(no concept of previous message)

### Communication between Client and Server

In the REST architecture, clients send requests to retrieve or modify resources, and servers send responses to these requests.

### HTTP Verbs
There are 4 basic HTTP verbs we use in requests to interact with resources in a REST system:

GET — retrieve a specific resource (by id) or a collection of resources
POST — create a new resource
PUT — update a specific resource (by id)
DELETE — remove a specific resource by id


### well whats CRUD then
CRUD is an acronym for:

CREATE procedures generate new records via INSERT statements.
READ procedures reads the data based on input parameters. Similarly, RETRIEVE procedures grab records based on input parameters.
UPDATE procedures modify records without overwriting them.
DELETE procedures delete where specified.

CRUD’s origins are in database records. By definition, CRUD is more of a cycle than an architectural system. On any dynamic website, there are likely multiple CRUD cycles that exist.

REST is a robust API architecture.
CRUD is a cycle for keeping records current and permanent.

CRUD principles are mapped to REST commands to comply with the goals of RESTful architecture