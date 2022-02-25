// SPDX-License-Identifier: MIT
pragma solidity 0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract TestToken is ERC20("TEST", "TEST") {
    function mint(address to, uint amount) external {
        _mint(to, amount);
    }

    function burn(address to, uint amount) external {
        _burn(to, amount);
    }
}
