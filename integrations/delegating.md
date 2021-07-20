# Delegating

Stakers can delegate the following actions to other accounts

* Burning \(unstaking\)
* Claiming
* Issuance \(staking\)
* \(All of the above\)

### Adding Approval API <a id="adding-approval-api"></a>

#### Contract <a id="contract"></a>

**Contract \(address & ABI\):** DelegateApprovals

#### Methods   <a id="methods"></a>

* approveAllDelegatePowers\(address delegate\) 
* approveIssueOnBehalf\(address delegate\)
* approveBurnOnBehalf\(address delegate\)
* approveClaimOnBehalf\(address delegate\) 
* approveExchangeOnBehalf\(address delegate\)

#### Events Emitted <a id="events-emitted"></a>

On a successful transaction, the following events occur:

| **Name**  | **emitted on** | **address authoriser** | **address delegate** | **bytes32 action** |
| :--- | :--- | :--- | :--- | :--- |
|  Approval | DelegateApprovals | msg.sender | delegate | One of ApproveAll, BurnForAddress, ClaimForAddress, IssueForAddress, ExchangeForAddress |

### Withdrawing Approval API <a id="withdrawing-approval-api"></a>

#### Contract <a id="contract_1"></a>

**Contract \(address & ABI\):** DelegateApprovals

#### Methods <a id="methods_1"></a>

* removeAllDelegatePowers\(address delegate\) 
* removeIssueOnBehalf\(address delegate\) 
* removeBurnOnBehalf\(address delegate\) 
* removeClaimOnBehalf\(address delegate\)
* removeExchangeOnBehalf\(address delegate\)

#### Events Emitted <a id="events-emitted_1"></a>

On a successful transaction, the following events occur:

| name | emitted on | address authoriser | address delegate | bytes32 action |  |
| :--- | :--- | :--- | :--- | :--- | :--- |
| WithdrawApproval | DelegateApprovals | msg.sender | delegate | One of ApproveAll, BurnForAddress, ClaimForAddress, IssueForAddress, ExchangeForAddress |  |



