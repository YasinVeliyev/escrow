// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
import "forge-std/console.sol";

contract Escrow {
    address public depositor;
    address public beneficiary;
    address public arbiter;

    event Approved(uint);
    modifier onlyArbiter() {
        require(msg.sender == arbiter, "Only the arbiter can approve");
        _;
    }

    constructor(address _arbiter, address _beneficiary) payable {
        depositor = msg.sender;
        beneficiary = _beneficiary;
        arbiter = _arbiter;
    }

    function approve() external payable onlyArbiter {
        payable(beneficiary).transfer(address(this).balance);
        emit Approved(beneficiary.balance);
    }
}
