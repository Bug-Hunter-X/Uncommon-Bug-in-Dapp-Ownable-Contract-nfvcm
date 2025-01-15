function transferOwnership(address newOwner) {
  require(newOwner != address(0), "Ownable: new owner is the zero address");
  require(newOwner != address(this), "Ownable: new owner is the contract itself");
  // Check if newOwner is a contract address
  uint256 size;
  assembly {
      size := extcodesize(newOwner)
  }
  require(size > 0, "Ownable: new owner is not a contract");
  emit OwnershipTransferred(_owner, newOwner);
  _owner = newOwner;
}