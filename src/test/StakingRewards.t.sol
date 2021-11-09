// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.6;

import "ds-test/test.sol";

import "../StakingRewards.sol";

contract StakingRewardsTest is DSTest {
    StakingRewards rewards;

    function setUp() public {
        rewards = new StakingRewards();
    }

    function testFail_basic_sanity() public {
        assertTrue(false);
    }

    function test_basic_sanity() public {
        assertTrue(true);
    }
}