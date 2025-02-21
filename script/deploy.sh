#!/bin/bash

# effect the env vars
source .env

# get bash arg
while [[ "$#" -gt 0 ]]; do
  case $1 in
    --file) SCRIPT_FILE="$2"; shift ;;
    --account) ACCOUNT="$2"; shift ;;
    *) echo "unknown arg: $1" ; exit 1 ;;
  esac
  shift
done

# make sure the script file was provided
if [[ -z "$SCRIPT_FILE" ]]; then
  echo "Please specify --file <your_script_path>"
  exit 1
fi

if [[ -z "$ACCOUNT" ]]; then
  echo "Please specify --account <your_cast_wallet_account>"
  exit 1
fi

# check if the environment variables were defined previously
if [[ -z "$SEPOLIA_RPC_URL" || -z "$ETHERSCAN_API_KEY" || -z "$CHAIN_ID" ]]; then
  echo "Please ensure .env defines the vars：SEPOLIA_RPC_URL, ETHERSCAN_API_KEY, CHAIN_ID"
  exit 1
fi

if [[ -z "$PRIVATE_KEY" ]]; then
  echo "Can not load the private key from keystore..."
  exit 1
fi

# deploy
forge script "$SCRIPT_FILE" \
  --rpc-url "$SEPOLIA_RPC_URL" \
  --broadcast \
  --verify \
  --etherscan-api-key "$ETHERSCAN_API_KEY" \
  --account $ACCOUNT \
  -vvvv

# 导入钱包私钥到-keystore
# cast wallet import Metamask -i
# cast wallet list
# cat ~/.foundry/keystores/Metamask

# 使用编写好的bash脚本

# --file 参数指定要部署的文件 例如 -file script/DeployMyToken.s.sol:DeployMyToken
# --account 参数指定你用cast wallet import 的 account
# 在部署的过程中会问询你输入创建account时的密码

# bash ./script/deploy.sh --file script/DeployMyToken.s.sol:DeployMyToken --account Metamask
