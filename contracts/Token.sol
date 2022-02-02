// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Token {
  string public name = "My Hardhat Token";
  string public symbol  = "MHT";

  uint256 public totalSupply = 1000000; //Amount of available tokens
  address public ownerAccount; // Store owners accounts

  mapping (address => uint256) balances;

  constructor() {
    balances[msg.sender] = totalSupply;
    ownerAccount = msg.sender;
  }

  function transfer(address to, uint256 amount) external sufficientBalance(amount)
  {
    balances[msg.sender] -= amount;
    balances[to] += amount;
  }

  function  getBalance(address account) external view
    returns (uint256)
  {
    return balances[account];
  }

  modifier sufficientBalance(uint256 amount) {
    require(balances[msg.sender] >= amount, "Not enough tokens in the balance");
    _;
  }

}
