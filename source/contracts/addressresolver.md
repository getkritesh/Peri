# AddressResolver

## Description

This contract is a type of Service Locator pattern that allows for easier interaction between multiple contracts. Instead of contract A needing references to contracts B and C \(and updating every release\), contract A can refer to an `AddressResolver` and query for B and C at transaction time. Then, during a release, the AddressResolver is updated with the latest B and C contract. Thus this ensures that contract A always has the latest B and C contracts.

**Source:** [contracts/AddressResolver.sol](https://github.com/perifinance/peri-finance/blob/master/contracts/AddressResolver.sol)

## Variables

#### `repository` <a id="repository"></a>

[Source](https://github.com/perifinance/peri-finance/blob/master/contracts/AddressResolver.sol#L13)

The mapping of contract name to address

**Type:** `mapping(bytes32 => address)`

## Constructor

#### `constructor` <a id="constructor_1"></a>

\*\*\*\*[**Source**](https://github.com/perifinance/peri-finance/blob/master/contracts/AddressResolver.sol#L15) ****

**Signature**

`constructor(address _owner)`

**Visibility**

`public`

**State Mutability**

## Views

#### `areAddressesImported` <a id="areaddressesimported"></a>

**Signature**

`areAddressesImported(bytes32[] names, address[] destinations) view returns (bool)`

**Visibility**

`external`

**State Mutability**

`view`

#### `getAddress` <a id="getaddress"></a>

Returns a single address by it's `bytes32` key.Details

#### `getPynth` <a id="getsynth"></a>

Returns Issuer address

**Signature**

`getSynth(bytes32 key) view returns (address)`

**Visibility**

`external`

**State Mutability**

`view`

**Requires**

* require\(..., "Cannot find Issuer address"\)

#### `requireAndGetAddress` <a id="requireandgetaddress"></a>

**Signature**

`requireAndGetAddress(bytes32 name, string reason) view returns (address)`

**Visibility**

`external`

**State Mutability**

`view`

**Requires**

* [require\(..., "string calldata"\)](https://github.com/perifinance/peri-finance/blob/master/contracts/AddressResolver.sol#L55)

## Restricted Functions

#### `importAddresses` <a id="importaddresses"></a>

Import one or more addresses into the system for the given keys. Note: this function will overwrite any previous entries with the same key names, allowing for inline updates.

**Signature**

`importAddresses(bytes32[] names, address[] destinations)`

**Visibility**

`external`

**State Mutability**

**Requires**

* [require\(..., "Input lengths must match"\)](https://github.com/perifinance/peri-finance/blob/master/contracts/AddressResolver.sol#L20)

**Modifiers**

* onlyOwner

## External Functions

#### `rebuildCaches` <a id="rebuildcaches"></a>

**Signature**

`rebuildCaches(contract MixinResolver[] destinations)`

**Visibility**

`external`

**State Mutability**

## Events

#### `AddressImported` <a id="addressimported"></a>

**Signature**: `AddressImported(bytes32 name, address destination)`

