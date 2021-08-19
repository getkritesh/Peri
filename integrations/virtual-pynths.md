# Virtual Pynths\(vPynths\)

There are two steps to Virtual Pynths

1. Create the virtual synth contract via PeriFinance.exchangeWithVirtual\(\)- this function outputs the new VirtualPynth contract address for the next step
2. Once VirtualPynth.secsLeftInWaitingPeriod is 0\(and it's readyToSettle\), invoke  VirtualPynth.settle\(address\) to burn the virtual pynths and transfer the proportion of underlying pynths to the address.

#### 1. Creation of Virtual Pynth Contract <a id="1-creation-of-virtual-synth-contract"></a>

**Contract**

**Destination contract \(address\):** `ProxyERC20`

**Target contract \(ABI\):** `PeriFinance`

> **Note:** PeriFinance uses a proxy system. The ABI of the underlying PeriFinance `ProxyERC20` contract you need is `PeriFinance`. Learn more about how proxies work by visiting the overview page

**Methods**

* `exchangeWithVirtual(bytes32 src, uint sourceAmount, bytes32 dest, bytes32 trackingCode)`

**Events Emitted**

On a successful transaction, the following events occur:

> If any fees are owing or owed, these events will come first. See trade settlement for information.

Following any reclaims or rebates, the following events then occur:

| name | emitted on | `address from` | `address to` | `uint value` |
| :--- | :--- | :--- | :--- | :--- |
| `Transfer` | `Proxy<src>` | `msg.sender` \(or `user`\) | `0x0` | `fromAmount` |

| name | emitted on | `address account` | `uint value` |
| :--- | :--- | :--- | :--- |


| **`Burned`** | `Proxy<src>` | `msg.sender` \(or `user`\) | `fromAmount` |
| :--- | :--- | :--- | :--- |


| name | emitted on | `address from` | `address to` | `uint value` |
| :--- | :--- | :--- | :--- | :--- |
| `Transfer` | `Proxy<dest>` | `0x0` | `msg.sender` \(or `user`\) | `toAmount - fee` |

| name | emitted on | `address pynth` | `address recipient` | `address virtualPynth` | `bytes32 currencyKey` | `uint amount` |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| `VirtualPynthCreated` | `Exchanger` | `Proxy<dest>` | `msg.sender` \(or `user`\) | the new `VirtualPynth` contract address | the synth key that is being virtualized | the `amount` issued |

| name | emitted on | `address from` | `address to` | `uint value` |
| :--- | :--- | :--- | :--- | :--- |
| `Transfer` | `ProxypUSD` | `0x0` | `FEE_ADDRESS` | `fee` |

| name | emitted on | `address account` | `uint value` |
| :--- | :--- | :--- | :--- |
| `Issued` | `ProxypUSD` | `FEE_ADDRESS` | `fee` |

| name | emitted on | `uint cachedDebt` |
| :--- | :--- | :--- |
| `DebtCacheUpdated` | `DebtCache` | New `cachedDebt` in the system |

| name | emitted on | `address account` | `bytes32 src` | `uint fromAmount` | `bytes32 dest` | `uint toAmount` | `address toAddress` |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| `PynthExchange` | `ProxyPynthetix` | `msg.sender` \(or `user`\) | `src` | `fromAmount` | `dest` | `toAmount - fee` | `msg.sender` \(or `user`\) |

| name | emitted on | `address account` | `bytes32 src` | `uint amount` | `bytes32 dest` | `uint amountReceived` | `uint exchangeFeeRate` | `uint roundIdForSrc` | `uint roundIdForDest` |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| `ExchangeEntryAppended` | `Exchanger` | `msg.sender` \(or `user`\) | `src` | `fromAmount` | `dest` | `toAmount - fee` | the `exchangeFeeRate` paid | the `roundId` for rate of `src` pynth | the `roundId` for rate of `dest` pynth |

#### 2. Settlement <a id="2-settlement"></a>

**Contract**

**VirtualPynth:** This address is unique to each exchange. It is returned as the second part of the tuple returned from `exchangeWithVirtual():(uint amountReceived, address vPynth)`. It is also emitted in the `VirtualPynthCreated` event from the transaction above \(see `address vPynth`\).

**Target contract \(ABI\):** `VirtualSynth`

**Methods**

* `settle(address account)`

Multiple Invocations

Because Virtual Pynths are an ERC20, they can be distributed to any number of other accounts. However, the ERC20 contract itself must be settled once for all holders. This is done on the first invocation of `VirtualPynth.settle(address account)`. Thus more gas is paid for the first invocation that subsequent ones.

**Events Emitted**

On a successful transaction, the following events occur:

 **For the first settlement of the entire `VirtualPynth` contract:**

| name | emitted on | `address account` | `bytes32 src` | `uint amount` | `bytes32 dest` | `uint reclaim` | `uint rebate` | `uint srcRoundIdAtPeriodEnd` | `uint destRoundIdAtPeriodEnd` | `uint exchangeTimestamp` |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| `ExchangeEntrySettled` | `Exchanger` | `msg.sender` \(or `user`\) | `src` | `fromAmount` | `dest` | `reclaimedAmount` if any | `rebateAmount` if any | the `roundId` for rate of `src` pynth at waiting period expiry | the `roundId` for rate of `dest` synth at waiting period expiry | the timestamp of the exchange |



| name | emitted on | `uint totalSupply` | `uint amountAfterSettled` |
| :--- | :--- | :--- | :--- |
| `Settled` | `VirtualPynth` | The totalSupply of the virtual pynth | The amount of the pynth remaining after settlement \(after reclaims removed or rebates added\) |

**Once the Virtual contract is settled, individual `account` holders see the following events**:

| name | emitted on | `address from` | `address to` | `uint value` |
| :--- | :--- | :--- | :--- | :--- |
| `Transfer` | `Proxy<src>` | `VirtualPynth` | `account` | The user is sent their proportionate `amount` of pynths |

| name | emitted on | `address from` | `address to` | `uint value` |
| :--- | :--- | :--- | :--- | :--- |
| `Transfer` | `VirtualPynth` | `account` | `0x0` | The user's vPynths are burned |

