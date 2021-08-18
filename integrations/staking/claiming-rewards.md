# Claiming Rewards

PERI stakers \(aka minters, aka issuers\) get staking rewards each week, in the form of pUSD  trading fees and PERI  inflationary rewards.

### API <a id="api"></a>

#### Contract <a id="contract"></a>

**Destination contract \(address\):** `ProxyFeePool`

**Underlying contract \(ABI\):** `FeePool`

> **Note:** PeriFinance  uses a proxy system. The ABI of the underlying PeriFinance `FeePool` contract you need is `FeePool`. Learn more about how proxies work by visiting the overview page.

#### Methods <a id="methods"></a>

* `claimFees()`
* `claimOnBehalf(address user)`

