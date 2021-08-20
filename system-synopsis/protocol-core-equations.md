# PROTOCOL CORE EQUATIONS

Peri Finance using below equations to handle staking 

* Staked Amount \(User\)
* C-Ratio
* Peri locked amount
* Available External token stake Amount
* Staked Escrow Balance
* APR
  * APR by user
* Reward Distribution
* LP Price
* Staking Rewards\(LP\) reward calculation algorithm

## Staked Amount \(User\) <a id="Staked-Amount-(User)"></a>

_Staked Amount = \( Collateralisation Ratio / Issuance Ratio\)\*⋅Collateral_

## C-Ratio <a id="C-Ratio"></a>

_Collateralisation Ratio\(%\)= \( \(PERI balance+ USDC staked\)/ Debt \) \*100_

## Peri locked amount <a id="Peri-locked-amount"></a>

\(`debt` / `Issuance Ratio`\) - `USDC Staked` = `PERI Locked`

## Available External token stake Amount <a id="Available-External-token-stake-Amount"></a>

It derives x which refers available staking amount with given numbers.

at,`1function availableStakingAmount(d, ir, q, s) { 2 return ( (d * q / ir) - s ) / (1 - q); 3}`

## Staked Escrow Balance <a id="Staked-Escrow-Balance"></a>

If \( `transferable PERI` &gt; 0 \)

`Staked Escrow PERI` = `PERI Locked Amount` - `PERI Balance`

If \( `transferable PERI` = 0\)

`Staked Escrow PERI` = 0

at, `PERI Locked Amount` = \(`debt / issuanceRatio`\) - `USDC Staked Amount`

## APR <a id="APR"></a>

Where,

General staking APR,

All value is considered as USD currency unit. Total locked asset is the total asset amount staked in the system\(It will be the PERI + USDC amount for current case\). 52 is a number of weeks in a year.

### APR by user <a id="APR-by-user"></a>

## Reward Distribution <a id="Reward-Distribution"></a>

Assume, all values are same currency unit \(PERI\).

| **Network** | **Total Debt** | **External Staking Reward\(LP, ..\)** | **Minter Reward** |
| :--- | :--- | :--- | :--- |
| A |  |  |  |
| B |  |  |  |
| C |  |  |  |

With following repetitive factors,

the reward amount of each network is,

And the parameter `networkDebtShare` for `inflationalMint()` of each network will be,

at `networkDebtShare` &lt;= 1

## Fit to claimable <a id="Fit-to-claimable"></a>

## LP Price <a id="LP-Price"></a>

And each amount is derived by,

#### RewardRate <a id="RewardRate"></a>

Assume, the reward duration is a week,

Where,

This reward rate is constant in period.

#### Reward per Token <a id="Reward-per-Token"></a>

Reward per token is a reward amount assigned to single staking token at current time.

Whenever any mutative function is called, new reward amount per token is recalculated.

Where,

Whenever user call `stake`, `withdraw`, `getReward`, user’s reward will be calculated by this `rewardPerToken`. After calculation, `rewardPerToken` will be updated to new value.

#### Earned <a id="Earned"></a>

User’s earned amount \(it is calculated and accumulated at every mutative function call\),

Where,

ρusertoken←ρtoken, 

Ruseraccumulated←Ruseraccumulated+E

