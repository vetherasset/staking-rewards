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

# npm
npm i
```

### Development

```shell
# Compile
dapp build

# Test
dapp test
```

### Deploy

```shell
# config .sethrc
cp .sethrc.copy .sethrc

# list accounts
ethsign ls

# import account
ethsign import

# delete imported key
rm $HOME/.ethereum/keystore/my-key

OWNER=
REWARD_DIST=
REWARD=
STAKE=

dapp create src/StakingRewards.sol:StakingRewards $OWNER $REWARD_DIST $REWARD $STAKE

hevm flatten --source-file src/StakingRewards.sol > tmp/flat.sol

# mainnet
OWNER=0xFd9aD7F8B72fC133543Cb7cCC2F11C03b81726f9
REWARD_DIST=0xFd9aD7F8B72fC133543Cb7cCC2F11C03b81726f9
REWARD=0x2602278EE1882889B946eb11DC0E810075650983
STAKE=0x7abD51BbA7f9F6Ae87aC77e1eA1C5783adA56e5c

0x2413e4594aadE7513AB6Dc43209D4C312cC35121

# rinkeby
OWNER=0x95693eB2857B3dcae39E000B0F7a5A40cB0B1Daf
REWARD_DIST=0x95693eB2857B3dcae39E000B0F7a5A40cB0B1Daf
REWARD=0x42e05423368A8F937F4cA6463ff3E1Af581226A1
STAKE=0x13A6094358652F046b0ad2e7B45EC8499cf10207

0xe5464610415E2FbFEe835BEa04C03D57f3B801F3
```
