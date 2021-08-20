# PERI FINANCE HISTORICAL DATA

## Peri Finance Historical Data

There are a number a ways to access Peri Finance's historical data in future 

* Query PeriFinance event log history and calls using The Graph subgraphs
* Fetch state at some block in the past using an Archive Node
* Query event logs 
* Use a third party service like Google BigQuery or DuneAnalytics

#### The Graph <a id="the-graph"></a>

Peri Finance has indexed protocol data on the Graph, a decentralized network for querying Ethereum data. The Graph allows for the creation of custom data sets, aka "subgraphs", which are easily queryable. Peri Finance currently has One separate subgraphs for retrieving information specific to Peri Finance smart contracts. A subgraph is an entity-based data source which replays all transactions since the genesis block and uses custom code to create queryable entities as each block is processed.

Since dealing with the Graph directly can be time consuming, we've written a custom JavaScript library to help users obtain Peri Finance data and abstract away the complexity of dealing with these subgraphs. It's called Peri Finance-data, and it's an npm module to query historical or subscribe to these events in real time.

Alternatively, each of these subgraphs can be queried using GraphQL.

#### Query event logs directly on the EVM <a id="query-event-logs-directly-on-the-evm"></a>

Instead of using the subgraphs provided, you could directly query the EVM via most free providers \(such as Infura or polygonscan\).

#### Using an Archive Node <a id="using-an-archive-node"></a>

You can also use an Polygon node with full historical state \(an archive node\) to read the blockchain state at some block in the past. Infura and QuikNode both provide access to archive nodes for monthly costs.

