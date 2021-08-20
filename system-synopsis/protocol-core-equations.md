# PROTOCOL CORE EQUATIONS

Peri Finance Protocol using below equations to handle staking and subject to change 

* Staked Amount \(User\)
* C-Ratio
* Peri locked amount
* Staked Escrow Balance
* APR
  * APR by user

## Staked Amount \(User\) <a id="Staked-Amount-(User)"></a>

_Staked Amount = \( Collateralisation Ratio / Issuance Ratio\)\*⋅Collateral_

## C-Ratio <a id="C-Ratio"></a>

_Collateralisation Ratio\(%\)= \( \(PERI balance+ USDC staked\)/ Debt \) \*100_

## Peri locked amount <a id="Peri-locked-amount"></a>

\(`debt` / `Issuance Ratio`\) - `USDC Staked` = `PERI Locked`

## Staked Escrow Balance <a id="Staked-Escrow-Balance"></a>

If \( `transferable PERI` &gt; 0 \)

`Staked Escrow PERI` = `PERI Locked Amount` - `PERI Balance`

If \( `transferable PERI` = 0\)

`Staked Escrow PERI` = 0

at, `PERI Locked Amount` = \(`debt / issuanceRatio`\) - `USDC Staked Amount`

## APR <a id="APR"></a>

 RW=E⋅RF+E ⋅RI

RW: Weekly Rewards

E: Exchange Rate

RF: fees to distribute\(in single period\)

RI: inflation to distribute\(in single period\)

General staking APR,

 APR\(%\) =  \(RW \*52 / Total Locked Assets\) \*100

All value is considered as USD currency unit. Total locked asset is the total asset amount staked in the system\(It will be the PERI + USDC amount for current case\). 52 is a number of weeks in a year.

## APR by user

 APR\(%\) = APR \* \(Staked per user/ Total Staked\)

