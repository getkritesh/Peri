# STAKING PERI

## Staking: Open a Position <a id="staking-open-a-position"></a>

PERI  stakers can lock their PERI COIN into the Peri Finance protocol Staking Dapp and take on a debt position in the shared pool of the combined USD value of all Pynths . After Successful staking, they  issued pUSD that represents their current debt position in USD. 

As the prices of underlying pynths fluctuate with oracle updates, the size of the debt pool fluctuates too, It means that staker's debt independent from the amount of pUSD that was issued.

To consider the risk stakers take on by being exposed to a shared debt pool, they are rewarded each week in the form of pUSD trading fees and PERI inflationary rewards .

## Issuance API

### Contract 

**Destination contract \(address\)**: ProxyERC20

**Target contract \(ABI\):** PeriFinance

Note: PeriFinance uses a proxy system. The ABI of the underlying PeriFinance ProxyERC20 contract you need is PeriFinance.

#### Methods

* issuePynths\(uint256 amount\) 
* issuePynthsOnBehalf\(address user, uint256\) 
* issueMaxPynths\(\)
* issueMaxPynthsOnBehalf\(address user\)

#### Events Emitted

On a successful transaction, the following events occur:

| name | emitted on | `address from` | `address to` | `uint value` |
| :--- | :--- | :--- | :--- | :--- |
| `Transfer` | `ProxypUSD` | `0x0` | `msg.sender` \(or `user`\) | `amount` of `sUSD` |

| name | emitted on | `address account` | `uint value` |
| :--- | :--- | :--- | :--- |
| `Issued` | `ProxypUSD` | `msg.sender` \(or `user`\) | `amount` |

| name | emitted on | `address account` | `uint debtRatio` | `uint debtEntryIndex` | `uint feePeriodStartingDebtIndex` |
| :--- | :--- | :--- | :--- | :--- | :--- |
| `IssuanceDebtRatioEntry` | `FeePool` | `msg.sender` \(or `user`\) | `debtRatio` | `debtEntryIndex` | `feePeriodStartingDebtIndex` |



## UNSTAKING PERI

## Unstaking: Closing a Position <a id="unstaking-closing-a-position"></a>

In order to close their position, PERI stakers need to burn enough pUSD to cover their debt position 

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

## Claiming Rewards

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
| `Transfer` | `ProxypUSD` | `0x0` | `msg.sender` \(or `user`\) | `amount` of `pUSD` |

| name | emitted on | `address account` | `uint value` |
| :--- | :--- | :--- | :--- |
| `Issued` | `ProxysUSD` | `msg.sender` \(or `user`\) | `amount` of `pUSD` |

| name | emitted on | `address beneficiary` | `uint time` | `uint value` |
| :--- | :--- | :--- | :--- | :--- |
| `VestingEntryCreated` | `RewardEscrow` | `msg.sender` \(or `user`\) | `now` | `amount` of PERI rewards |

| name | emitted on | `address account` | `uint sUSDAmount` | `uint snxRewards` |
| :--- | :--- | :--- | :--- | :--- |
| `FeesClaimed` | `ProxyFeePool` | `msg.sender` \(or `user`\) | `pUSDAmount` | `periRewards` |

