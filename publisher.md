# Publisher

This script can `build` \(compile and flatten\), `deploy` and `verify` \(on Etherscan\) the PeriFinance code to a testnet or mainnet.

### 1. Build <a id="1-build"></a>

Will compile bytecode and ABIs for all `.sol` files found in `node_modules` and the `contracts` folder. It will output them in a `compiled` folder in the given build path \(see below\), along with the flattened source files under the folder `flattened`.

```text
# build (flatten and compile all .SOL sources)
node publish build # "--help" for options
```

### 2. Deploy <a id="2-deploy"></a>

Will attempt to deploy \(or reuse\) all of the contracts listed in the given `contract-flags` input file, as well as perform initial connections between the contracts.

:warning: **This step requires the `build` step having been run to compile the sources into ABIs and bytecode.**

> Note: this action will update the deployment files for the associated network in "publish/deployed/". For example, here's the "deployment.json" file for mainnet.

```text
# deploy (take compiled SOL files and deploy)
node publish deploy # "--help" for options
```

#### CLI Options <a id="cli-options"></a>

* `-a, --add-new-pynths` Whether or not any new pynths in the pynths.json file should be deployed if there is no entry in the config file.
* `-b, --build-path [value]` Path for built files to go. \(default of `./build` - relative to the root of this repo\). The folders `compiled` and `flattened` will be made under this path and the respective files will go in there.
* `-c, --contract-deployment-gas-limit <value>` Contract deployment gas limit \(default: 7000000 \(7m\)\)
* `-d, --deployment-path <value>` Path to a folder that has your input configuration file \(`config.json`\), the synths list \(`synths.json`\) and where your `deployment.json` file will be written \(and read from if it currently exists\).  

> Note: the advantage of supplying this folder over just using the network name is that you can have multiple deployments on the same network in different folders

* `-g, --gas-price <value>` Gas price in GWEI \(default: "1"\)
* `-m, --method-call-gas-limit <value>` Method call gas limit \(default: 150000\)
* `-n, --network <value>` The network to run off. One of mainnet, kovan, rinkeby, rospen. \(default: "kovan"\)
* `-o, --oracle <value>` The address of the oracle to use. 
* `-f, --fee-auth <value>` The address of the fee Authority to use for feePool.  --oracle-gas-limit 

#### Examples <a id="examples"></a>

```text
# deploy to rinkeby with 8 gwei gas
node publish deploy -n ropsten -d publish/deployed/ropsten -g 20
node publish deploy -n rinkeby -d publish/deployed/rinkeby -g 20
node publish deploy -n kovan -d publish/deployed/kovan -g 8
node publish deploy -n local -d publish/deployed/local -g 8
```

### 3. Verify <a id="3-verify"></a>

Will attempt to verify the contracts on Etherscan \(by uploading the flattened source files and ABIs\).

:warning: **Note: the `build` step is required for the ABIs and the `deploy` step for the live addresses to use.**

\*\*\*\*

```text
# verify (verify compiled sources by uploading flattened source to Etherscan via their API)
node publish verify # "--help" for options
```

### 4. Nominate New Owner <a id="4-nominate-new-owner"></a>

For all given contracts, will invoke `nominateNewOwner` for the given new owner;

#### node publish nominate \# "--help" for options

### 5. Owner Actions <a id="5-owner-actions"></a>

Helps the owner take ownership of nominated contracts and run any deployment tasks deferred to them.

#### node publish owner \# "--help" for options

### 6. Remove **P**ynths <a id="6-remove-synths"></a>

Will attempt to remove all given synths from the `PeriFinance` contract \(as long as they have `totalSupply` of `0`\) and update the `config.json` and `pynths.json` for the deployment folder.

#### node publish remove-synths \# "--help" for options

### 7. Replace Pynths <a id="7-replace-synths"></a>

Will attempt to replace all given synths with a new given `subclass`. It does this by disconnecting the existing TokenState for the Pynth and attaching it to the new one.

#### node publish replace-synths \# "--help" for options

### 7. Purge Pynths <a id="7-purge-synths"></a>

Will attempt purge the given synth with all token holders it can find. Uses the list of holders from mainnet, and as such won't do anything for other networks.

#### node publish purge-synths \# "--help" for options

### 8. Release <a id="8-release"></a>

Will initiate the  PeriFinance release process, publishing the PeriFinance `npm` module and updating all dependent projects in GitHub and `npm`.

#### node publish release \# "--help" for options

### 9. Staking Rewards <a id="9-staking-rewards"></a>

Will deploy an instance of StakingRewards.sol with the configured stakingToken and rewardsToken in rewards.json. Then `run node publish verify`

#### node publish deploy-staking-rewards \# "--help" for options

#### Branching <a id="branching"></a>

For `PeriFinance` repo, we are using the following branch mapping:

* `alpha` is `KOVAN`
* `beta` is `RINKEBY`
* `rc` is `ROPSTEN`
* `master` is `MAINNET`

PRs should start being merged into `develop` then deployed onto `KOVAN`, then merged into `staging` once deployed for releasing onto `rinkeby` and `ropsten` for staging into a `mainnet` release. These can be done multiple times for each branch, as long as we keep these up to date.

#### Versioning <a id="versioning"></a>

Using semantic versioning \(semver\): `v[MAJOR].[MINOR].[PATCH]-[ADDITIONAL]`

* `MAJOR` stipulates an overhaul of the Solidity contracts
* `MINOR` are any changes to the underlying Solidity contracts
* `PATCH` are for any JavaScript or deployed contract JSON changes
* `ADDITIONAL` are for testnet deployments
* `-alpha` is for `Kovan`
* `-beta` follows alpha, and contains `Rinkeby` .
* `-rc[N]` follows beta, and contrains `Ropsten`. `N` starts at `0` and can be incremented until we are ready to release without the suffix.

|  |
| :--- |


## When adding new pynths <a id="when-adding-new-synths"></a>

1. In the environment folder you are deploying to, add the synth key to the `pynths.json` file. If you want the synth to be purgeable, add `subclass: "PurgeablePynth"` to the object.
2. \[Optional\] Run `build` if you've changed any source files, if not you can skip this step.
3. Run `deploy` as usual but add the `--add-new-pynths` flag
4. Run `verify` as usual.

