# PERI FINANCE HISTORICAL DATA

## Peri Finance Historical Data

Peri Finance's historical data ca access using number of ways in future 

* Using calls on the Graph subgraphs
* Using an Archive Node to fetch state at some block in the past
* Using Query event logs on the Graph Subgraph 
* Using Third party service like Google BigQuery

#### The Graph  and Subgraph <a id="the-graph"></a>

To Query Network Data from Decentralized Network , Peri Finance has indexed protocol data on the Graph. The Graph allows for the creation of custom data sets called Subgraph , which allowed to be queryable. 

Peri Finance currently has One separate subgraphs for retrieving information specific to Peri Finance smart contracts. A subgraph is an entity-based data source which replays all transactions since the genesis block and uses custom code to create queryable entities as each block is processed.

Alternatively, each of these subgraphs can be queried using GraphQL.

#### Event Logs Query <a id="query-event-logs-directly-on-the-evm"></a>

Instead of using the subgraphs provided, you could directly query the EVM via most free providers \(such as Infura \).

#### Using an Archive Node <a id="using-an-archive-node"></a>

You can also use an Network\(Polygon/Ethereum/BSC\) node with full historical state to read the blockchain state at some block in the past. 

