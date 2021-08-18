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

