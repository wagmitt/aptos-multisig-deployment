# Aptos Multisig Contract Deployment Tutorial

This repository demonstrates how to deploy and upgrade a Move smart contract as a **code object** using a **multisig wallet** on the Aptos blockchain. The example includes a simple "Hello World" contract that can be upgraded through multisig governance.

## Prerequisites

- [Aptos CLI](https://aptos.dev/cli-tools/aptos-cli-tool/install-aptos-cli)
- Bash shell environment
- Git

## Project Structure

```
.
├── sources/             # Move smart contract source files
├── scripts/             # Deployment and setup scripts
├── keys/               # Generated keys and addresses (will be created)
├── deployment/         # Deployment artifacts (will be created)
├── Move.toml           # Move package manifest
└── publication.json    # Package publication info
```

## Setup and Deployment Steps

### 1. Setup Signers

```bash
bash ./scripts/0_setup_signers.sh
```

This script will:

- Create necessary directories
- Generate two owner keys for the multisig
- Initialize Aptos CLI with the generated keys

### 2. Setup Multisig

```bash
bash ./scripts/1_setup_multisig.sh
```

Creates a 2-of-2 multisig account that will own and control the smart contract.

### 3. Deploy Code Object

```bash
bash ./scripts/2_deploy_code_object.sh
```

Deploys the initial version of the Hello World contract.

### 4. Transfer Code Object

```bash
bash ./scripts/3_transfer_code_object.sh
```

Transfers ownership of the deployed contract to the multisig account.

### 5. Upgrade Code Object (Optional)

```bash
bash ./scripts/4_upgrade_code_object.sh
```

Demonstrates how to upgrade the contract through the multisig.

## Smart Contract Details

The example contract (`hello_world.move`) implements a simple message storage system with the following functions:

- `init_module`: Initializes the contract with a default "Hello World!" message
- `set_message`: Updates the stored message (requires multisig approval)
- `get_message`: Retrieves the current message

## Security Considerations

- Keep your private keys secure and never share them
- The multisig setup requires both owners to approve any contract upgrades
- All generated keys will be stored in the `keys/` directory

## Network

This tutorial is configured to work with Aptos testnet by default. To use a different network, modify the network parameter in the setup scripts.

## Troubleshooting

If you encounter any issues:

1. Ensure Aptos CLI is properly installed and in your PATH
2. Check that all scripts have execute permissions (`chmod +x scripts/*.sh`)
3. Verify you have sufficient test tokens for deployment
4. Clear the `keys/` and `deployment/` directories and start fresh if needed

## License

This project is open-source and available under the MIT License.
