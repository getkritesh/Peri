---
description: >-
  This is a list of the most common user-facing transactions possible in the
  PeriFinance ecosystem, and the events they emit on success.
---

# COMMON TRANSACTIONS

## Staking \(Minting/Issuing\) pUSD

**Called contract:** `ProxyERC20`

**Target \(underlying\) contract:** `PeriFinance`

**Methods:**

* `issuePynths(uint256 amount)`
* `issuePynthsOnBehalf(address user, uint256)`
* `issueMaxPynths()`
* `issueMaxPynthsOnBehalf(address user)`

**Events Emitted:**

On a successful transaction, the following events occur:

1. `Transfer` from `0x0` to `account` for `amount` emitted on `ProxypUSD`
2. `Issued` `amount` to `account` emitted on `ProxypUSD`
3. `IssuanceDebtRatioEntry` emitted on `ProxyFeePool`

### Unstaking \(Burning\) pUSD <a id="unstaking-burning-susd"></a>

More info

Check out our unstaking walkthru for more information

**Called contract:** `ProxyERC20`

**Target \(underlying\) contract:** `PeriFinance`

**Methods:**

* `burnPynths(uint256 amount)`
* `burnPynthsOnBehalf(address user, uint256 amount)`
* `burnPynthsToTarget()`
* `burnPynthsToTargetOnBehalf(address user)`

**Events Emitted:**

On a successful transaction, the following events occur:

1. `Transfer` from `account` to `0x0` for `amount` emitted on `ProxypUSD`
2. `Burned` `amount` from `account` emitted on `ProxypUSD`
3. `IssuanceDebtRatioEntry` emitted on `ProxyFeePool`

### Claiming Fees <a id="claiming-fees"></a>

More info

Check out our claiming walkthru for more information

**Called contract:** `ProxyFeePool`

**Target \(underlying\) contract:** `FeePool`

**Methods:**

* `claimFees()`
* `claimOnBehalf(address user)`

**Events Emitted:**

On a successful transaction, the following events occur:

1. `Transfer` from `FEE_ADDRESS` to `0x0` for `amount` emitted on `ProxypUSD`
2. `Burned` `amount` from `FEE_ADDRESS` emitted on `ProxypUSD`
3. `Transfer` from `0x0` to `account` for `amount` emitted on `ProxypUSD`
4. `Issued` `amount` to `account` emitted on `ProxypUSD`
5. `VestingEntryCreated` emitted on `RewardEscrow`
6. `FeesClaimed` emitted on `ProxyFeePool`

### Trading \(Exchanging\) pynths <a id="trading-exchanging-synths"></a>

More info

Check out our trading walkthru for more information

**Called contract:** `ProxyERC20`

**Target \(underlying\) contract:** `PeriFinance`

**Methods:**

* `exchange(bytes32 src, uint256 fromAmount, bytes32 dest)`
* `exchangeOnBehalf(address user, bytes32 src, uint256 fromAmount, bytes32 dest)`

**Events Emitted:**

On a successful transaction, the following events occur:

#### Fee Reclamation 

If fees are owing on the `src` pynth, these events come first:

1. `Transfer` from `account` to `0x0` for `feesOwing` emitted on `Proxy<pynth>` for the `src` pynth.
2. `Burned` `feesOwing` from `account` emitted on `Proxy<pynth>` for the `src` pynth.
3. `ExchangeReclaim` from `account` for `feesOwing` on `src` synth emitted on `ProxySynthetix`

Else if fees are owed on the `src` pynth, then these events come first:

1. `Transfer` from `0x0` to `account` for `feesOwed` emitted on `Proxy<pynth>` for the `src` pynth.
2. `Issued` `feesOwed` to `account` emitted on `Proxy<synth>` for the `src` synth.
3. `ExchangeRebate` from `account` for `feesOwed` on `src` pynth emitted on `ProxySynthetix`

For every exchange, the following events then occur:

1. `Transfer` from `account` to `0x0` for `fromAmount` emitted on `Proxy<pynth>` for the `src` pynth.
2. `Burned` `fromAmount` from `account` emitted on `Proxy<pynth>` for the `src` pynth.
3. `Transfer` from `0x0` to `account` for `toAmount - fee` emitted on on `Proxy<pynth>` for the `dest` pynth.
4. `Issued` `toAmount - fee` to `account` emitted on `Proxy<pynth>` for the `dest` pynth.
5. `Transfer` from `0x0` to `FEE_ADDRESS` for `fee` emitted on `ProxypUSD`
6. `Issued` `amount` to `FEE_ADDRESS` emitted on `ProxypUSD`
7. `PynthExchange` for `account` emitted on `ProxySynthetix`

