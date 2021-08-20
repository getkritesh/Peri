# PROTOCOL OVERVIEW

## Integrations Overview <a id="integrations-overview"></a>

Peri Finance provides the following integration guides:

1. Staking
2. Data
3. Delegating
4. Depot: USDC/pUSD
5. Testnets
6. ENS Support

The additional contextual information below is also helpful as a companion reference to the guides provided

#### Address Resolver[¶](https://docs.synthetix.io/integrations/#address-resolver) <a id="address-resolver"></a>

In our Polygon release, we introduced a new feature called the Address Resolver contract.

In short, the Address Resolver allows any referencing contract to have access to a number of key contract - in particular the underlying PeriFinance, FeePool, PynthUSD contracts. 

We have one for each testnet and mainnet up on the addresses page. For guides on how to use the AddressResolver in Solidity, see our Staking section.

#### Example Scenarios: <a id="example-scenarios"></a>

**Transferring pUSD**

You **** want to transfer 5 pUSD to user 

* You can only invoke transfer \(user, 5e18\) on ProxyERC20\(0xA590C98\).
* On success, Transfer will be emitted on ProxyERC20\(0xA590C98\)



