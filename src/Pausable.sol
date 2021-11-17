// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity 0.8.9;

import "./Owned.sol";

abstract contract Pausable is Owned {
    bool public paused;

    constructor() {
        // This contract is abstract, and thus cannot be instantiated directly
        require(owner != address(0), "owner = zero address");
    }

    /**
     * @notice Change the paused state of the contract
     * @dev Only the contract owner may call this.
     */
    function setPaused(bool _paused) external onlyOwner {
        require(_paused != paused, "no change");
        paused = _paused;
        emit PauseChanged(_paused);
    }

    event PauseChanged(bool isPaused);

    modifier notPaused() {
        require(!paused, "paused");
        _;
    }
}
