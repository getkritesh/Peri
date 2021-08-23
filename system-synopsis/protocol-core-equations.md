# PROTOCOL CORE EQUATIONS

Peri Finance Protocol using below equations to handle staking and subject to change 

* Staked Amount \(User\)
* C-Ratio
* Peri locked amount
* Available External token stake Amount
* Staked Escrow Balance
* APR
  * APR by user
* Reward Distribution
* Fit to claimable
* LP Price
* Staking Reward\(LP\) reward calculation algorithm

## Staked Amount

![](../.gitbook/assets/1%20%281%29.png)

## Available External Token Stake Amount

![](../.gitbook/assets/2%20%281%29.png)

## Staked Escrow Balance <a id="Staked-Escrow-Balance"></a>

If \( `transferable PERI` &gt; 0 \)

`Staked Escrow PERI` = `PERI Locked Amount` - `PERI Balance`

If \( `transferable PERI` = 0\)

`Staked Escrow PERI` = 0

at, `PERI Locked Amount` = \(`debt / issuanceRatio`\) - `USDC Staked Amount`

## APR

![](../.gitbook/assets/3%20%281%29.png)

## Reward Distribution <a id="Reward-Distribution"></a>

![](../.gitbook/assets/4.png)

## LP Price

![](../.gitbook/assets/5%20%281%29.png)

## Staking Rewards\(LP\) reward calculation algorithm <a id="StakingRewards(LP)-reward-calculation-algorithm"></a>

![](../.gitbook/assets/6%20%282%29.png)

![](../.gitbook/assets/6%20%281%29.png)

