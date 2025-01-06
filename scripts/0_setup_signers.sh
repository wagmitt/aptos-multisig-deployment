#!/bin/bash
# Setup signers

# Exit if any command fails
set -e

# Make missing directories
mkdir -p ./deployment
mkdir -p ./keys

# Create 2 owners
aptos key generate --vanity-prefix "abc" --vanity-multisig --output-file ./keys/owner_1 
aptos key generate --output-file ./keys/owner_2 --vanity-prefix 222

# Initialize aptos with first private key
aptos init --profile default --private-key-file ./keys/owner_1 --network testnet
aptos init --profile owner_2 --private-key-file ./keys/owner_2 --network testnet