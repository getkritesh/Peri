# Staking

## Staking: Open a Position <a id="staking-open-a-position"></a>

PERI stakers \(aka minting, aka issuing\) lock their PERI into the Peri Finance protocol and take on a debt position \(that is, a percentage\) in the shared pool of the combined USD value of all pynths. Upon staking, they are issued pUSD that represents their current debt position in USD. However, as prices of underlying Pynths fluctuate with oracle updates, the size of the debt pool fluctuates, meaning that the staker's debt decouples from the amount of pUSD that was issued.

To account for the risk stakers take on by being exposed to a shared debt pool, they are rewarded each week in the form of pUSD trading fees and PERI inflationary rewards.

### Issuance API <a id="issuance-api"></a>

#### Contract <a id="contract"></a>

**Destination contract \(address\):** ProxyERC20

 **Target contract \(ABI\):** Perifinance

#### Methods <a id="methods"></a>

* issuePynths\(uint256 amount\) 
* issuePynthsOnBehalf\(address user, uint256\) 
* issueMaxPynths\(\) 
* issueMaxPynthsOnBehalf\(address user\)

#### Events Emitted[¶](https://docs.synthetix.io/integrations/staking/#events-emitted) <a id="events-emitted"></a>

On a successful transaction, the following events occur:

| name | emitted on | address from | address to | uint value |
| :--- | :--- | :--- | :--- | :--- |
| Transfer  | ProxypUSD | 0x0 | msg.sender \(or user\) | amount of pUSD |

| name | emitted on | address account | uint value |
| :--- | :--- | :--- | :--- |
| Issued | ProxysUSD   | msg.sender | \(or user\) amount |

| name | emitted on | address account | uint debtRatio | uint debtEntryIndex | uint feePeriodStartingDebtIndex |
| :--- | :--- | :--- | :--- | :--- | :--- |
| IssuanceDebtRatioEntry | FeePool | msg.sender \(or user\) | debtRatio | debtEntryIndex | feePeriodStartingDebtIndex |

