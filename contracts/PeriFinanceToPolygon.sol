pragma solidity 0.5.16;

import "./PeriFinance.sol";

contract PeriFinanceToPolygon is PeriFinance {
    address public childChainManager;

    constructor(
        address payable _proxy,
        TokenState _tokenState,
        address _owner,
        uint _totalSupply,
        address _resolver,
        address _childChainManager,
        address _blacklistManager
    ) public PeriFinance(_proxy, _tokenState, _owner, _totalSupply, _resolver, _childChainManager, _blacklistManager) {
        childChainManager = _childChainManager;
    }

    function setChildChainManager(address _childChainManager) external onlyOwner {
        require(_childChainManager != address(0), "Address cannot be zero");

        childChainManager = _childChainManager;
    }

    function deposit(address _user, bytes calldata depositData) external optionalProxy {
        require(messageSender == childChainManager, "Caller is not allowed to deposit");

        uint amount = abi.decode(depositData, (uint256));

        tokenState.setBalanceOf(_user, tokenState.balanceOf(_user).add(amount));

        emitTransfer(address(0), _user, amount);
    }

    function withdraw(uint _amount) external optionalProxy {
        tokenState.setBalanceOf(messageSender, tokenState.balanceOf(messageSender).sub(_amount));

        emitTransfer(messageSender, address(0), _amount);
    }
}
