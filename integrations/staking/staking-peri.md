# STAKING PERI

## Staking: Open a Position <a href="staking-open-a-position" id="staking-open-a-position"></a>

PERI  stakers can lock their PERI COIN into the Peri Finance protocol Staking Dapp and take on a debt position in the shared pool of the combined USD value of all Pynths . After Successful staking, they  issued pUSD that represents their current debt position in USD.&#x20;

As the prices of underlying pynths fluctuate with oracle updates, the size of the debt pool fluctuates too, It means that staker's debt independent from the amount of pUSD that was issued.

To consider the risk stakers take on by being exposed to a shared debt pool, they are rewarded each week in the form of pUSD trading fees and PERI inflationary rewards .

## Issuance API

### Contract&#x20;

**Destination contract (address)**: ProxyERC20

**Target contract (ABI):** PeriFinance

Note: PeriFinance uses a proxy system. The ABI of the underlying PeriFinance ProxyERC20 contract you need is PeriFinance.

#### Methods

* issuePynths(uint256 amount)&#x20;
* issuePynthsOnBehalf(address user, uint256)&#x20;
* issueMaxPynths()
* issueMaxPynthsOnBehalf(address user)

#### Events Emitted

On a successful transaction, the following events occur:

| name       | emitted on  | `address from` | `address to`             | `uint value`       |
| ---------- | ----------- | -------------- | ------------------------ | ------------------ |
| `Transfer` | `ProxypUSD` | `0x0`          | `msg.sender` (or `user`) | `amount` of `sUSD` |

| name     | emitted on  | `address account`        | `uint value` |
| -------- | ----------- | ------------------------ | ------------ |
| `Issued` | `ProxypUSD` | `msg.sender` (or `user`) | `amount`     |

| name                     | emitted on | `address account`        | `uint debtRatio` | `uint debtEntryIndex` | `uint feePeriodStartingDebtIndex` |
| ------------------------ | ---------- | ------------------------ | ---------------- | --------------------- | --------------------------------- |
| `IssuanceDebtRatioEntry` | `FeePool`  | `msg.sender` (or `user`) | `debtRatio`      | `debtEntryIndex`      | `feePeriodStartingDebtIndex`      |



## UNSTAKING PERI

## Unstaking: Closing a Position <a href="unstaking-closing-a-position" id="unstaking-closing-a-position"></a>

In order to close their position, PERI stakers need to burn enough pUSD to cover their debt position&#x20;

### Burning API <a href="burning-api" id="burning-api"></a>

#### Contract <a href="contract" id="contract"></a>

**Destination contract (address):** `ProxyERC20`

**Target contract (ABI):** `PeriFinance`

> **Note:** `PeriFinance` uses a proxy system. The ABI of the underlying `PeriFinance` `ProxyERC20` contract you need is `PeriFinance`. Learn more about how proxies work by visiting the overview page.

#### Methods <a href="methods" id="methods"></a>

* `burnPynths(uint256 amount)`
* `burnPynthsOnBehalf(address user, uint256 amount)`
* `burnPynthsToTarget()`
* `burnPynthsToTargetOnBehalf(address user)`

#### Events Emitted <a href="events-emitted" id="events-emitted"></a>

On a successful transaction, the following events occur:

| name       | emitted on  | `address from`           | `address to` | `uint value`       |
| ---------- | ----------- | ------------------------ | ------------ | ------------------ |
| `Transfer` | `ProxypUSD` | `msg.sender` (or `user`) | `0x0`        | `amount` of `pUSD` |

| name     | emitted on  | `address account`        | `uint value` |
| -------- | ----------- | ------------------------ | ------------ |
| `Burned` | `ProxypUSD` | `msg.sender` (or `user`) | `amount`     |

| name                     | emitted on | `address account`        | `uint debtRatio` | `uint debtEntryIndex` | `uint feePeriodStartingDebtIndex` |
| ------------------------ | ---------- | ------------------------ | ---------------- | --------------------- | --------------------------------- |
| `IssuanceDebtRatioEntry` | `FeePool`  | `msg.sender` (or `user`) | `debtRatio`      | `debtEntryIndex`      | `feePeriodStartingDebtIndex`      |

## Claiming Rewards

PERI stakers (aka minters, aka issuers) get staking rewards each week, in the form of pUSD  trading fees and PERI  inflationary rewards.

### API <a href="api" id="api"></a>

#### Contract <a href="contract" id="contract"></a>

**Destination contract (address):** `ProxyFeePool`

**Underlying contract (ABI):** `FeePool`

> #### Methods

* `claimFees()`
* `claimOnBehalf(address user)`

#### Events Emitted <a href="events-emitted" id="events-emitted"></a>

On a successful transaction, the following events occur:

| name       | emitted on  | `address from` | `address to` | `uint value`       |
| ---------- | ----------- | -------------- | ------------ | ------------------ |
| `Transfer` | `ProxypUSD` | `FEE_ADDRESS`  | to `0x0`     | `amount` of `pUSD` |

| name     | emitted on  | `address account` | `uint value` |
| -------- | ----------- | ----------------- | ------------ |
| `Burned` | `ProxypUSD` | `FEE_ADDRESS`     | `amount`     |

| name       | emitted on  | `address from` | `address to`             | `uint value`       |
| ---------- | ----------- | -------------- | ------------------------ | ------------------ |
| `Transfer` | `ProxypUSD` | `0x0`          | `msg.sender` (or `user`) | `amount` of `pUSD` |

| name     | emitted on  | `address account`        | `uint value`       |
| -------- | ----------- | ------------------------ | ------------------ |
| `Issued` | `ProxypUSD` | `msg.sender` (or `user`) | `amount` of `pUSD` |

| name                  | emitted on     | `address beneficiary`                                    | `uint time` | `uint value`             |
| --------------------- | -------------- | -------------------------------------------------------- | ----------- | ------------------------ |
| `VestingEntryCreated` | `RewardEscrow` | <p><code>msg.sender</code><br>(or <code>user</code>)</p> | `now`       | `amount` of PERI rewards |

| name          | emitted on     | `address account`        | `uint sUSDAmount` | `uint snxRewards` |
| ------------- | -------------- | ------------------------ | ----------------- | ----------------- |
| `FeesClaimed` | `ProxyFeePool` | `msg.sender` (or `user`) | `pUSDAmount`      | `periRewards`     |
