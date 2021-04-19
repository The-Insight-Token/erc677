// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Migrations {
  address public owner;
  uint256 public lastCompletedMigration;

  constructor() {
    owner = msg.sender;
  }

  modifier restricted() {
    require(msg.sender == owner, "Not owner");
    _;
  }

  function setCompleted(uint256 completed) external restricted {
    lastCompletedMigration = completed;
  }

  function upgrade(address newAddress) external restricted {
    Migrations upgraded = Migrations(newAddress);
    upgraded.setCompleted(lastCompletedMigration);
  }
}
