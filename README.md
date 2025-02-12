# Foundry Template

This is a template project to quickly bootstrap Ethereum application development using Foundry. Foundry is a blazing-fast, modular toolkit for Ethereum development written in Rust.

This template provides a basic setup for using Foundry's tools like **Forge**, **Cast**, **Anvil**, and **Chisel**. Whether you are building, testing, deploying, or interacting with smart contracts, this template will give you a solid foundation.

## Foundry

**Foundry** is a fast, portable, and modular toolkit for Ethereum application development. It includes:

- **Forge**: Ethereum testing framework (like Truffle, Hardhat, and DappTools).
- **Cast**: A Swiss army knife for interacting with EVM smart contracts, sending transactions, and getting chain data.
- **Anvil**: A local Ethereum node, similar to Ganache or Hardhat Network.
- **Chisel**: A fast, utilitarian Solidity REPL.

## Documentation

For detailed documentation, refer to the official Foundry book:
[Foundry Documentation](https://book.getfoundry.sh/)

## Project Setup

To get started with this project, make sure you have **Foundry** installed. If not, follow the instructions in the official documentation to set it up.

### Install Foundry

First, install Foundry by running the following command:

```shell
curl -L https://foundry.paradigm.xyz | bash
```

Then, run the following command to install the necessary tools:

```shell
foundryup
```

## Install Pre-commit

`pre-commit` is a tool to manage and maintain multi-language pre-commit hooks. It ensures that your code is checked before committing to the repository.

Install `pre-commit` using `pipx`:

```shell
pipx install pre-commit
```

After installation, run the following command to set up `pre-commit` in your project:

```shell
pre-commit install
```

## Install Typos

`typos` is a tool for spelling checks in your project. It helps catch common spelling mistakes in your codebase.

Install `typos` with Cargo:

```shell
cargo install typos-cli
```

You can run it using:

```shell
typos
```

## Install Git Cliff

`git-cliff` is a tool that generates changelogs from your commit history. It automatically creates a structured changelog for your project.

To install `git-cliff`, run:

```shell
cargo install git-cliff
```

Generate a changelog using:

```shell
git cliff --output CHANGELOG.md
```

## Usage

Title: Initialize Foundry Project

Description: This set of commands creates a new directory named `my-project`, navigates into that directory, and then initializes a new Foundry project using a custom template from the specified GitHub repository.

```bash
mkdir my-project
cd my-project/
forge init --template https://github.com/qiaopengjun5162/foundry-template
```

### Build the Project

To build the project, run the following command:

```shell
forge build
```

### Run Tests

To run tests, use the following command:

```shell
forge test
```

### Format Code

To format your Solidity code, use:

```shell
forge fmt
```

### Take Gas Snapshots

To take gas snapshots of your transactions, use:

```shell
forge snapshot
```

### Start Anvil (Local Ethereum Node)

To start an Anvil instance, use:

```shell
anvil
```

### Deploy Contracts

To deploy contracts using Foundry, use:

```shell
forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Use Cast for Interactions

`cast` is a tool to interact with Ethereum smart contracts. You can use various subcommands:

```shell
cast <subcommand>
```

For more information about `cast`, run:

```shell
cast --help
```

## Help Commands

For a list of available commands and options:

- `forge --help`
- `anvil --help`
- `cast --help`

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

**Happy Coding!** 🚀
