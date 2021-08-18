# Unstaking PERI

## Unstaking: Closing a Position <a id="unstaking-closing-a-position"></a>

In order to close their position, PERI stakers need to burn enough pUSD to cover their debt position \(PeriFinance.debtBalanceof\(user, "pUSD"\)\).

### Burning API <a id="burning-api"></a>

#### Contract <a id="contract"></a>

**Destination contract \(address\):** `ProxyERC20`

**Target contract \(ABI\):** `PeriFinance`

> **Note:** `PeriFinance` uses a proxy system. The ABI of the underlying `PeriFinance` `ProxyERC20` contract you need is `PeriFinance`. Learn more about how proxies work by visiting the overview page.

#### Methods <a id="methods"></a>

* `burnPynths(uint256 amount)`
* `burnPynthsOnBehalf(address user, uint256 amount)`
* `burnPynthsToTarget()`
* `burnPynthsToTargetOnBehalf(address user)`

#### Events Emitted <a id="events-emitted"></a>

On a successful transaction, the following events occur:

| name | emitted on | `address from` | `address to` | `uint value` |
| :--- | :--- | :--- | :--- | :--- |
| [`Transfer`](https://docs.synthetix.io/contracts/source/contracts/ExternStateToken#transfer) | `ProxysUSD` | `msg.sender` \(or `user`\) | `0x0` | `amount` of `sUSD` |

| name | emitted on | `address account` | `uint value` |
| :--- | :--- | :--- | :--- |
| [`Burned`](https://docs.synthetix.io/contracts/source/contracts/Synth#burned) | `ProxysUSD` | `msg.sender` \(or `user`\) | `amount` |

| name | emitted on | `address account` | `uint debtRatio` | `uint debtEntryIndex` | `uint feePeriodStartingDebtIndex` |
| :--- | :--- | :--- | :--- | :--- | :--- |
| [`IssuanceDebtRatioEntry`](https://docs.synthetix.io/contracts/source/contracts/FeePool#issuancedebtratioentry) | `FeePool` | `msg.sender` \(or `user`\) | `debtRatio` | `debtEntryIndex` | `feePeriodStartingDebtIndex` |

