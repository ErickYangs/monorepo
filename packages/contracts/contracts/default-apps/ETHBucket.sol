pragma solidity 0.5.7;
pragma experimental "ABIEncoderV2";

import "../libs/Transfer.sol";
import "../libs/ETHInterpreter.sol";
import "../CounterfactualApp.sol";


contract ETHBucket is CounterfactualApp {

  struct AppState {
    ETHTransferInterpreter.ETHTransfer[] transfers;
  }

  function resolve(bytes calldata encodedState)
    external
    pure
    returns (ETHTransferInterpreter.ETHTransfer[] memory)
  {
    AppState memory state = abi.decode(encodedState, (AppState));

    return state.transfers;
  }

}
