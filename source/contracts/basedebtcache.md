# BaseDebtCache

### Description <a id="description"></a>

**Source:** [contracts/BaseDebtCache.sol](https://github.com/perifinance/peri-finance/blob/master/contracts/BaseDebtCache.sol)

### Constructor <a id="constructor"></a>

#### `constructor` <a id="constructor_1"></a>

[Source](https://github.com/perifinance/peri-finance/blob/master/contracts/BaseDebtCache.sol#L47)

**Signature**

`constructor(address _owner, address _resolver)`

**Visibility**

`public`

**State Mutability**

### Views <a id="views"></a>

#### `cacheInfo` <a id="cacheinfo"></a>

[Source](https://github.com/perifinance/peri-finance/blob/master/contracts/BaseDebtCache.sol#L215)

**Signature**

`cacheInfo() view returns (uint256 debt, uint256 timestamp, bool isInvalid, bool isStale)`

**Visibility**

`external`

**State Mutability**

`view`

#### `cacheInvalid` <a id="cacheinvalid"></a>

[Source](https://github.com/perifinance/peri-finance/blob/master/contracts/BaseDebtCache.sol#L108)

**Signature**

`cacheInvalid() view returns (bool)`

**Visibility**

`external`

**State Mutability**

`view`

#### `cacheStale` <a id="cachestale"></a>

[Source](https://github.com/perifinance/peri-finance/blob/master/contracts/BaseDebtCache.sol#L119)

**Signature**

`cacheStale() view returns (bool)`

**Visibility**

`external`

**State Mutability**

`view`

#### `cacheTimestamp` <a id="cachetimestamp"></a>

[Source](https://github.com/perifinance/peri-finance/blob/master/contracts/BaseDebtCache.sol#L104)

**Signature**

`cacheTimestamp() view returns (uint256)`

**Visibility**

`external`

**State Mutability**

`view`

#### `cachedDebt` <a id="cacheddebt"></a>

[Source](https://github.com/perifinance/peri-finance/blob/master/contracts/BaseDebtCache.sol#L96)

**Signature**

`cachedDebt() view returns (uint256)`

**Visibility**

`external`

**State Mutability**

`view`

#### `cachedPynthDebt` <a id="cachedsynthdebt"></a>

[Source](https://github.com/perifinance/peri-finance/blob/master/contracts/BaseDebtCache.sol#L100)

**Signature**

`cachedPynthDebt(bytes32 currencyKey) view returns (uint256)`

**Visibility**

`external`

**State Mutability**

`view`

#### `cachedPynthDebts` <a id="cachedsynthdebts"></a>

[Source](https://github.com/perifinance/peri-finance/blob/master/contracts/BaseDebtCache.sol#L189)

**Signature**

`cachedPynthDebts(bytes32[] currencyKeys) view returns (uint256[] snxIssuedDebts)`

**Visibility**

`external`

**State Mutability**

`view`

#### `currentDebt` <a id="currentdebt"></a>

[Source](https://github.com/perifinance/peri-finance/blob/master/contracts/BaseDebtCache.sol#L211)

**Signature**

`currentDebt() view returns (uint256 debt, bool anyRateIsInvalid)`

**Visibility**

`external`

**State Mutability**

`view`

#### `currentPynthDebts` <a id="currentsynthdebts"></a>

[Source](https://github.com/perifinance/peri-finance/blob/master/contracts/BaseDebtCache.sol#L163)

**Signature**

`currentPynthDebts(bytes32[] currencyKeys) view returns (uint256[] debtValues, uint256 excludedDebt, bool anyRateIsInvalid)`

**Visibility**

`external`

**State Mutability**

`view`

#### `debtSnapshotStaleTime` <a id="debtsnapshotstaletime"></a>

[Source](https://github.com/perifinance/peri-finance/blob/master/contracts/BaseDebtCache.sol#L92)

**Signature**

`debtSnapshotStaleTime() view returns (uint256)`

**Visibility**

`external`

**State Mutability**

`view`

#### `resolverAddressesRequired` <a id="resolveraddressesrequired"></a>

[Source](https://github.com/perifinance/peri-finance/blob/master/contracts/BaseDebtCache.sol#L51)

**Signature**

`resolverAddressesRequired() view returns (bytes32[] addresses)`

**Visibility**

`public`

**State Mutability**

`view`

[Source](https://github.com/perifinance/peri-finance/blob/master/contracts/BaseDebtCache.sol#L51)

## Internal Functions

#### `_cacheStale` <a id="_cachestale"></a>

[Source](https://github.com/perifinance/peri-finance/blob/master/contracts/BaseDebtCache.sol#L119)

**Signature**

`_cacheStale(uint256 timestamp) view returns (bool)`

**Visibility**

`internal`

**State Mutability**

`view`

#### `_cachedPynthDebts` <a id="_cachedsynthdebts"></a>

[Source](https://github.com/Synthetixio/synthetix/tree/v2.47.0-ovm/contracts/BaseDebtCache.sol#L176)

**Signature**

`_cachedPynthDebts(bytes32[] currencyKeys) view returns (uint256[])`

**Visibility**

`internal`

**State Mutability**

`view`

#### `_currentDebt` <a id="_currentdebt"></a>

[Source](https://github.com/Synthetixio/synthetix/tree/v2.47.0-ovm/contracts/BaseDebtCache.sol#L220)Details

**Signature**

`_currentDebt() view returns (uint256 debt, bool anyRateIsInvalid)`

**Visibility**

`internal`

**State Mutability**

`view`

#### `_currentSynthDebts` <a id="_currentsynthdebts"></a>

[Source](https://github.com/Synthetixio/synthetix/tree/v2.47.0-ovm/contracts/BaseDebtCache.sol#L149)Details

**Signature**

`_currentSynthDebts(bytes32[] currencyKeys) view returns (uint256[] snxIssuedDebts, uint256 _excludedDebt, bool anyRateIsInvalid)`

**Visibility**

`internal`

**State Mutability**

`view`

#### `_issuedSynthValues` <a id="_issuedsynthvalues"></a>

[Source](https://github.com/Synthetixio/synthetix/tree/v2.47.0-ovm/contracts/BaseDebtCache.sol#L130)Details

**Signature**

`_issuedSynthValues(bytes32[] currencyKeys, uint256[] rates) view returns (uint256[] values)`

**Visibility**

`internal`

**State Mutability**

`view`

#### `_onlyIssuer` <a id="_onlyissuer"></a>

[Source](https://github.com/Synthetixio/synthetix/tree/v2.47.0-ovm/contracts/BaseDebtCache.sol#L286)Details

**Signature**

`_onlyIssuer() view`

**Visibility**

`internal`

**State Mutability**

`view`

**Requires**

* [require\(..., "Sender is not Issuer"\)](https://github.com/Synthetixio/synthetix/tree/v2.47.0-ovm/contracts/BaseDebtCache.sol#L287)

#### `_onlyIssuerOrExchanger` <a id="_onlyissuerorexchanger"></a>

[Source](https://github.com/Synthetixio/synthetix/tree/v2.47.0-ovm/contracts/BaseDebtCache.sol#L295)Details

**Signature**

`_onlyIssuerOrExchanger() view`

**Visibility**

`internal`

**State Mutability**

`view`

**Requires**

* [require\(..., "Sender is not Issuer or Exchanger"\)](https://github.com/Synthetixio/synthetix/tree/v2.47.0-ovm/contracts/BaseDebtCache.sol#L296)

#### `_requireSystemActiveIfNotOwner` <a id="_requiresystemactiveifnotowner"></a>

[Source](https://github.com/Synthetixio/synthetix/tree/v2.47.0-ovm/contracts/BaseDebtCache.sol#L275)Details

**Signature**

`_requireSystemActiveIfNotOwner() view`

**Visibility**

`internal`

**State Mutability**

`view`

#### `_totalNonSnxBackedDebt` <a id="_totalnonsnxbackeddebt"></a>

[Source](https://github.com/Synthetixio/synthetix/tree/v2.47.0-ovm/contracts/BaseDebtCache.sol#L194)Details

**Signature**

`_totalNonSnxBackedDebt() view returns (uint256 excludedDebt, bool isInvalid)`

**Visibility**

`internal`

**State Mutability**

`view`

#### `collateralManager` <a id="collateralmanager"></a>

[Source](https://github.com/Synthetixio/synthetix/tree/v2.47.0-ovm/contracts/BaseDebtCache.sol#L91)Details

**Signature**

`collateralManager() view returns (contract ICollateralManager)`

**Visibility**

`internal`

**State Mutability**

`view`

#### `etherCollateral` <a id="ethercollateral"></a>

[Source](https://github.com/Synthetixio/synthetix/tree/v2.47.0-ovm/contracts/BaseDebtCache.sol#L83)Details

**Signature**

`etherCollateral() view returns (contract IEtherCollateral)`

**Visibility**

`internal`

**State Mutability**

`view`

#### `etherCollateralsUSD` <a id="ethercollateralsusd"></a>

[Source](https://github.com/Synthetixio/synthetix/tree/v2.47.0-ovm/contracts/BaseDebtCache.sol#L87)Details

**Signature**

`etherCollateralsUSD() view returns (contract IEtherCollateralsUSD)`

**Visibility**

`internal`

**State Mutability**

`view`

#### `etherWrapper` <a id="etherwrapper"></a>

[Source](https://github.com/Synthetixio/synthetix/tree/v2.47.0-ovm/contracts/BaseDebtCache.sol#L95)Details

**Signature**

`etherWrapper() view returns (contract IEtherWrapper)`

**Visibility**

`internal`

**State Mutability**

`view`

#### `exchangeRates` <a id="exchangerates"></a>

[Source](https://github.com/Synthetixio/synthetix/tree/v2.47.0-ovm/contracts/BaseDebtCache.sol#L75)Details

**Signature**

`exchangeRates() view returns (contract IExchangeRates)`

**Visibility**

`internal`

**State Mutability**

`view`

#### `exchanger` <a id="exchanger"></a>

[Source](https://github.com/Synthetixio/synthetix/tree/v2.47.0-ovm/contracts/BaseDebtCache.sol#L71)Details

**Signature**

`exchanger() view returns (contract IExchanger)`

**Visibility**

`internal`

**State Mutability**

`view`

#### `issuer` <a id="issuer"></a>

[Source](https://github.com/Synthetixio/synthetix/tree/v2.47.0-ovm/contracts/BaseDebtCache.sol#L67)Details

**Signature**

`issuer() view returns (contract IIssuer)`

**Visibility**

`internal`

**State Mutability**

`view`

#### `systemStatus` <a id="systemstatus"></a>

[Source](https://github.com/Synthetixio/synthetix/tree/v2.47.0-ovm/contracts/BaseDebtCache.sol#L79)Details

**Signature**

`systemStatus() view returns (contract ISystemStatus)`

**Visibility**

`internal`

**State Mutability**

`view`

### External Functions <a id="external-functions"></a>

#### `purgeCachedSynthDebt` <a id="purgecachedsynthdebt"></a>

[Source](https://github.com/Synthetixio/synthetix/tree/v2.47.0-ovm/contracts/BaseDebtCache.sol#L269)Details

**Signature**

`purgeCachedSynthDebt(bytes32 currencyKey)`

**Visibility**

`external`

**State Mutability**

#### `takeDebtSnapshot` <a id="takedebtsnapshot"></a>

[Source](https://github.com/Synthetixio/synthetix/tree/v2.47.0-ovm/contracts/BaseDebtCache.sol#L271)Details

**Signature**

`takeDebtSnapshot()`

**Visibility**

`external`

**State Mutability**

#### `updateCachedSynthDebtWithRate` <a id="updatecachedsynthdebtwithrate"></a>

[Source](https://github.com/Synthetixio/synthetix/tree/v2.47.0-ovm/contracts/BaseDebtCache.sol#L263)Details

**Signature**

`updateCachedSynthDebtWithRate(bytes32 currencyKey, uint256 currencyRate)`

**Visibility**

`external`

**State Mutability**

#### `updateCachedSynthDebts` <a id="updatecachedsynthdebts"></a>

[Source](https://github.com/Synthetixio/synthetix/tree/v2.47.0-ovm/contracts/BaseDebtCache.sol#L261)Details

**Signature**

`updateCachedSynthDebts(bytes32[] currencyKeys)`

**Visibility**

`external`

**State Mutability**

#### `updateCachedSynthDebtsWithRates` <a id="updatecachedsynthdebtswithrates"></a>

[Source](https://github.com/Synthetixio/synthetix/tree/v2.47.0-ovm/contracts/BaseDebtCache.sol#L265)Details

**Signature**

`updateCachedSynthDebtsWithRates(bytes32[] currencyKeys, uint256[] currencyRates)`

**Visibility**

`external`

**State Mutability**

#### `updateDebtCacheValidity` <a id="updatedebtcachevalidity"></a>

[Source](https://github.com/Synthetixio/synthetix/tree/v2.47.0-ovm/contracts/BaseDebtCache.sol#L267)Details

**Signature**

`updateDebtCacheValidity(bool currentlyInvalid)`

**Visibility**

`external`

**State Mutability**

### Modifiers <a id="modifiers"></a>

#### `onlyIssuer` <a id="onlyissuer"></a>

[Source](https://github.com/Synthetixio/synthetix/tree/v2.47.0-ovm/contracts/BaseDebtCache.sol#L290)

#### `onlyIssuerOrExchanger` <a id="onlyissuerorexchanger"></a>

[Source](https://github.com/Synthetixio/synthetix/tree/v2.47.0-ovm/contracts/BaseDebtCache.sol#L299)

#### `requireSystemActiveIfNotOwner` <a id="requiresystemactiveifnotowner"></a>

[Source](https://github.com/Synthetixio/synthetix/tree/v2.47.0-ovm/contracts/BaseDebtCache.sol#L281)

