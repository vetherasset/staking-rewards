// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity 0.8.9;

import "ds-test/test.sol";
import "../Pausable.sol";

contract TestPausable is Pausable {
    constructor(address _owner) Owned(_owner) {}
}

contract User {
    TestPausable pausable;

    constructor(address _pausable) {
        pausable = TestPausable(_pausable);
    }

    function setPaused(bool _paused) public {
        pausable.setPaused(_paused);
    }
}

contract PausableTest is DSTest {
    TestPausable pausable;
    User alice;

    function setUp() public {
        pausable = new TestPausable(address(this));
        alice = new User(address(pausable));
    }

    function testFail_setPaused_not_owner() public {
        alice.setPaused(true);
    }

    function test_setPaused() public {
        pausable.setPaused(true);
        assertTrue(pausable.paused());
        assertEq(pausable.lastPauseTime(), block.timestamp);

        pausable.setPaused(true);
        assertTrue(pausable.paused());

        pausable.setPaused(false);
        assertTrue(!pausable.paused());
    }
}