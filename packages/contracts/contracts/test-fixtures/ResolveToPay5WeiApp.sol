pragma solidity 0.5.7;
pragma experimental "ABIEncoderV2";

import "../libs/Transfer.sol";
import "../CounterfactualApp.sol";


/// @title ResolveToPay5WeiApp
/// @notice This contract is a test fixture meant to emulate an AppInstance
/// contract. An AppInstance has a resolve() function that returns a
/// `Transfer.Transaction` object when the channel is closed.
contract ResolveToPay5WeiApp is CounterfactualApp {

  function resolve(bytes memory)
    public
    pure
    returns (bytes memory)
  {
    return abi.encode(500);
  }

  function isStateTerminal(bytes memory)
    public
    pure
    returns (bool)
  {
    revert("Not implemented");
  }

  function getTurnTaker(bytes memory, address[] memory)
    public
    pure
    returns (address)
  {
    revert("Not implemented");
  }

  function applyAction(bytes memory, bytes memory)
    public
    pure
    returns (bytes memory)
  {
    revert("Not implemented");
  }
}
