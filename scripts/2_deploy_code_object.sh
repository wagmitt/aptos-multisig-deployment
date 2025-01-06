#!/bin/bash
# Deploy Kofi contract to Aptos testnet

# Exit if any command fails
set -e

echo "🚀 Publishing contract to Aptos testnet..."

# Compile the contract
echo "📝 Compiling Move modules..."
aptos move compile --named-addresses multisig_code=default || {
    echo "❌ Compilation failed"
    exit 1
}

# use `--included-artifacts none to hide code on explorer

# Publish to testnet
echo "📦 Publishing to testnet..."
aptos move deploy-object \
    --address-name multisig_code \
    --profile default \
    --assume-yes | tee /dev/tty | grep -o "0x[a-fA-F0-9]\+" > ./deployment/hello_world_object_address.txt || {
    echo "❌ Publishing failed"
    exit 1
}

echo "✅ Contract successfully published on Aptos testnet!"

# Get the object address
OBJECT_ADDRESS=$(cat ./deployment/hello_world_object_address.txt)

# Print helpful information
echo "🔍 View your contract on Explorer:"
echo "https://explorer.aptoslabs.com/object/$OBJECT_ADDRESS?network=testnet"