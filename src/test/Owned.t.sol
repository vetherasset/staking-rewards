// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity 0.8.9;

import "ds-test/test.sol";
import "../Owned.sol";

contract User {
    Owned owned;

    constructor(address _owned) {
        owned = Owned(_owned);
    }

    function nominateNewOwner(address _owner) public {
        owned.nominateNewOwner(_owner);
    }

    function acceptOwnership() public {
        owned.acceptOwnership();
    }
}

contract OwnedTest is DSTest {
    Owned owned;
    User alice;

    function setUp() public {
        owned = new Owned(address(this));
        alice = new User(address(owned));
    }

    function testFail_nominateOwner_not_owner() public {
        alice.nominateNewOwner(address(alice));
    }

    function test_nominateOwner() public {
        owned.nominateNewOwner(msg.sender);
        assertEq(owned.nominatedOwner(), msg.sender);
    }

    function test_acceptOwnership() public {
        owned.nominateNewOwner(address(alice));
        alice.acceptOwnership();
        assertEq(owned.owner(), address(alice));
        assertEq(owned.nominatedOwner(), address(0));
    }
}