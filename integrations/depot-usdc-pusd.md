# Depot: ETH/pUSD

## Depot: Exchanging ETH for pUSD <a id="depot-exchanging-eth-for-susd"></a>

 The Depot is a place to deposit any excess pUSD for others to purchase it with ETH. On testnets it also allows you to exchange testnet ETH for PERI.

### Exchange ETH for pUSD API <a id="exchange-eth-for-susd-api"></a>

#### Contract <a id="contract"></a>

**Destination contract \(address & ABI\):**  Depot

#### Methods <a id="methods"></a>

* exchangeEtherForPynths\(\) 
* \(sending ETH to the contract\)

#### Events Emitted <a id="events-emitted"></a>

On a successful transaction, the following events occur:

For each deposit paid through, the following two events are emitted:

| name | emitted on | address fromAddress | address toAddress | uint fromETHAmount | uint toAmount | uint depositIndex |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
|   ClearedDeposit | Depot | msg.sender | The current depositor in the queue | The amount of ETH the toAddress has been paid | The amont of pUSD the msg.sender will received | The depositIndex that was accessed in this exchange |

| name | emitted on | address from | address tos | uint  value |
| :--- | :--- | :--- | :--- | :--- |
| Transfer | ProxypUSD  | Depot | msg.sender | an amount of pUSD |

Following all deposits paid though, emits the following event:

| name | emitted on | string fromCurrency | uint fromAmount | string toCurrency | uint toAmount |
| :--- | :--- | :--- | :--- | :--- | :--- |
| Exchange | Depot | ETH | fromAmount of ETH sent by msg.sender | pUSD | toAmount of pUSD the sender was sent |
|  |  |  |  |  |  |

