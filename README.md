# Staking Rewards

### Install

```shell
# Install nix
curl -L https://nixos.org/nix/install | sh

# Run this or login again to use Nix
. "$HOME/.nix-profile/etc/profile.d/nix.sh"

# Install dapptools
curl https://dapp.tools/install | sh

# Install solidity
nix-env -f https://github.com/dapphub/dapptools/archive/master.tar.gz -iA solc-static-versions.solc_0_8_9
```

### Development

```shell
# Compile
dapp --use solc:0.8.9 build

# Test
dapp test
```
