# PROTOCOL CORE EQUATIONS

Peri Finance Protocol using below equations to handle staking and subject to change&#x20;

* Staked Amount (User)
* C-Ratio
* Peri locked amount
* Available External token stake Amount
* Staked Escrow Balance
* APR
  * APR by user
* Reward Distribution
* Fit to claimable
* LP Price
* Staking Reward(LP) reward calculation algorithm

## Staked Amount

![](<../.gitbook/assets/1 (1).png>)

## Available External Token Stake Amount

![](<../.gitbook/assets/2 (1).png>)

## Staked Escrow Balance <a href="staked-escrow-balance" id="staked-escrow-balance"></a>

If ( `transferable PERI` > 0 )

`Staked Escrow PERI` = `PERI Locked Amount` - `PERI Balance`

If ( `transferable PERI` = 0)

`Staked Escrow PERI` = 0

at, `PERI Locked Amount` = (`debt / issuanceRatio`) - `USDC Staked Amount`

## APR

![](../.gitbook/assets/3.png)

## Reward Distribution <a href="reward-distribution" id="reward-distribution"></a>

![](../.gitbook/assets/4.png)

## LP Price

![](<../.gitbook/assets/5 (1).png>)

## Staking Rewards(LP) reward calculation algorithm <a href="stakingrewards-lp-reward-calculation-algorithm" id="stakingrewards-lp-reward-calculation-algorithm"></a>

![](<../.gitbook/assets/6 (1).png>)

![](<../.gitbook/assets/6 (3).png>)
