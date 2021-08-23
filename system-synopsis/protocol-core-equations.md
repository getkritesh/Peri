# PROTOCOL CORE EQUATIONS

Peri Finance Protocol using below equations to handle staking and subject to change 

* Staked Amount \(User\)
* C-Ratio
* Peri locked amount
* Staked Escrow Balance
* APR
  * APR by user

##  <a id="Staked-Amount-(User)"></a>

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

## Fit to Claimable



