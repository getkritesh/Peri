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

\`\`

#### Events Emitted <a id="events-emitted"></a>

On a successful transaction, the following events occur:

| name | emitted on | `address from` | `address to` | `uint value` |
| :--- | :--- | :--- | :--- | :--- |
| `Transfer` | `ProxypUSD` | `FEE_ADDRESS` | to `0x0` | `amount` of `pUSD` |

| name | emitted on | `address account` | `uint value` |
| :--- | :--- | :--- | :--- |
| `Burned` | `ProxypUSD` | `FEE_ADDRESS` | `amount` |

| name | emitted on | `address from` | `address to` | `uint value` |
| :--- | :--- | :--- | :--- | :--- |
| `Transfer` | `ProxypUSD` | `0x0` | `msg.sender` \(or `user`\) | `amount` of `sUSD` |

| name | emitted on | `address account` | `uint value` |
| :--- | :--- | :--- | :--- |
| `Issued` | `ProxysUSD` | `msg.sender` \(or `user`\) | `amount` of `sUSD` |

| name | emitted on | `address beneficiary` | `uint time` | `uint value` |
| :--- | :--- | :--- | :--- | :--- |
| `VestingEntryCreated` | `RewardEscrow` | `msg.sender` \(or `user`\) | `now` | `amount` of `SNX` rewards |

| name | emitted on | `address account` | `uint sUSDAmount` | `uint snxRewards` |
| :--- | :--- | :--- | :--- | :--- |
| `FeesClaimed` | `ProxyFeePool` | `msg.sender` \(or `user`\) | `sUSDAmount` | `snxRewards` |

