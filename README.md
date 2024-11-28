# DegenToken

A smart contract for a token-based in-game store with minting, burning, and item redemption functionality using ERC-20 tokens.

## Description

The DegenToken contract allows players to earn and use tokens for in-game rewards. It includes minting of new tokens (only the owner can mint), the ability for players to burn tokens they no longer need, and the ability to redeem tokens for items in a shop. The contract also provides players the ability to transfer tokens and check their token balance.

The core features of this contract are:
1. **Minting**: Owner can mint new tokens and distribute them to players.
2. **Transferring Tokens**: Players can transfer tokens to other users.
3. **Redeeming Tokens**: Players can redeem tokens for items in the in-game store.
4. **Burning Tokens**: Players can burn tokens they own.
5. **Balance Checking**: Players can check their token balance at any time.

## Getting Started

### Installing

1. Download the contract files from the repository.
2. Install dependencies if necessary, like OpenZeppelin's ERC-20 library (using npm or yarn in a Node.js environment).

```
npm install @openzeppelin/contracts
```

3. Deploy the contract to your desired network (e.g., Avalanche Fuji Testnet) using Remix, Hardhat, or Truffle.

### Executing Program

1. Open Remix IDE (https://remix.ethereum.org/).
2. Copy and paste the contract code into a new file (e.g., `DegenToken.sol`).
3. Compile the contract in Remix.
4. Deploy the contract to your desired network:
   - Ensure the environment is set to "Injected Provider" for Metamask integration.
   - Deploy the contract.
5. Interact with the contract:
   - **Mint tokens**: Mint tokens to your address (only the contract owner can mint).
   - **Transfer tokens**: Transfer tokens between addresses.
   - **Redeem items**: Redeem items in the shop by burning tokens.
   - **Burn tokens**: Burn tokens that you no longer need.
   - **Check balance**: Call `balanceOf` to check your token balance.

```
# Mint 1000 tokens to your address (only for contract owner)
mint(0xYourAddress, 1000)

# Burn 100 tokens from your address
burn(100)

# Redeem an item from the shop (e.g., gold-sword)
redeem("gold-sword")
```

## Help

If you encounter any issues or errors, make sure to check the following:
- Ensure your wallet has enough ETH or AVAX for gas fees.
- Only the contract owner can mint new tokens.
- Tokens can only be redeemed if you have sufficient balance for the item.

## Authors

Jasmine Camasura

## License

This project is licensed under the MIT License.
