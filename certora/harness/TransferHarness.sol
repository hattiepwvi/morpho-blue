// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity ^0.8.12;

import "../munged/libraries/SafeTransferLib.sol";
import "../munged/interfaces/IERC20.sol";

interface IERC20Extended is IERC20 {
    function balanceOf(address) external view returns (uint256);
    function allowance(address, address) external view returns (uint256);
    function totalSupply() external view returns (uint256);
}

contract TransferHarness {
    using SafeTransferLib for IERC20;

    function safeTransferFrom(address token, address from, address to, uint256 value) public {
        IERC20(token).safeTransferFrom(from, to, value);
    }

    function safeTransfer(address token, address to, uint256 value) public {
        IERC20(token).safeTransfer(to, value);
    }

    function balanceOf(address token, address user) public view returns (uint256) {
        return IERC20Extended(token).balanceOf(user);
    }

    function allowance(address token, address owner, address spender) public view returns (uint256) {
        return IERC20Extended(token).allowance(owner, spender);
    }

    function totalSupply(address token) public view returns (uint256) {
        return IERC20Extended(token).totalSupply();
    }
}
