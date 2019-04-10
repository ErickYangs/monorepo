import "./Transfer.sol";
pragma experimental "ABIEncoderV2";

import "../Interpreter.sol";

contract TwoPartyLumpAsEth is Interpreter {

  enum Resolution {
    SEND_TO_ADDR_ONE,
    SEND_TO_ADDR_TWO,
    SPLIT_AND_SEND_TO_BOTH_ADDRS
  }

  struct Params {
    address payable[2] playerAddrs;
    uint256 limit;
  }

  function interpret(
    bytes memory resolution, bytes memory params
  ) public {

    Params memory params2 = abi.decode(params, (Params));
    Resolution resolution2 = abi.decode(resolution, (Resolution));

    if (resolution2 == Resolution.SEND_TO_ADDR_ONE) {
        address payable to = params2.playerAddrs[0];
        to.transfer(params2.limit);
        return;
    } else if (resolution2 == Resolution.SEND_TO_ADDR_TWO) {
        address payable to = params2.playerAddrs[1];
        to.transfer(params2.limit);
        return;
    }

    /* SPLIT_AND_SEND_TO_BOTH_ADDRS or default cases */

    address payable to = params2.playerAddrs[0];
    to.transfer(params2.limit / 2);
    to = params2.playerAddrs[1];
    to.transfer(params2.limit - params2.limit / 2);

    return;
  }
}