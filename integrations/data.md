# PERI FINANCE HISTORICAL DATA

## Peri Finance Historical Data

There are a number a ways to access Peri Finance's historical data in future 

* Query PeriFinance event log history and calls using The Graph subgraphs
* Fetch state at some block in the past using an Archive Node
* Query event logs 
* Use a third party service like Google BigQuery or DuneAnalytics

#### The Graph <a id="the-graph"></a>

Peri Finance has indexed protocol data on the Graph, a decentralized network for querying network data. The Graph allows for the creation of custom data sets, aka "subgraphs", which are easily queryable. 

Peri Finance currently has One separate subgraphs for retrieving information specific to Peri Finance smart contracts. A subgraph is an entity-based data source which replays all transactions since the genesis block and uses custom code to create queryable entities as each block is processed.



Alternatively, each of these subgraphs can be queried using GraphQL.

#### Event Logs Query <a id="query-event-logs-directly-on-the-evm"></a>

Instead of using the subgraphs provided, you could directly query the EVM via most free providers \(such as Infura \).

#### Using an Archive Node <a id="using-an-archive-node"></a>

You can also use an Network\(Polygon/Ethereum\) node with full historical state to read the blockchain state at some block in the past. 

