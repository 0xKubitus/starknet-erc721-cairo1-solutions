# ERC721 on StarkNet (in Cairo 1)

Let's learn how to implement ERC721 tokens in Starknet, using Cairo1 thanks to [this workshop](https://github.com/robertkodra/starknet-erc721/blob/cairo1/src)!

## Step-by-step Guide

### Part 1: Creating an ERC721

#### Exercise 1 - Deploying and initilizing your ERC721

1. Create your initial ERC721 contract. You will need the following:
   1. a constructor function that takes the `name` and `symbol` as input and then initializes the contract with those inputs
   2. a `get_name()` to receive the name of the ERC721
   3. a `get_symbol()` to receive the symbol of the ERC721

Hint: You will need to manage the name and symbol of your ERC721 in the Storage of your contract

2. Assign a user slot from the Evaluator contract by calling `assign_user_slot()`
   1. Check the `get_user_slot()` to receive your number
   2. Based on your `user_slot` number, check the `get_info_name()` and `get_info_symbol()` to receive your unique `name` and `symbol`.
   3. use these values to initialize your ERC721
3. Deploy your contract on testnet
   1. make sure you use your given values based on the assigned user slot.
4. Call `submit_exercise()` in the Evaluator to configure the contract you want to be evaluated.
5. Call `ex_01_erc721_init()` to verify your contract and receive points.

### Exercise 2 - Minting a token

Here, we will focus on minting your first NFT.

1. Create the `mint()` function that allows you to mint an NFT.
2. Deploy your contract on testnet
3. Call `submit_exercise()` in the Evaluator to configure the contract you want to be evaluated.
4. Call `ex_02_erc721_mint()` to verify your contract and receive points.

### Exercise 3 - Burning a token

Here, we will focus on creating the burn function.

1. Create the `burn()` function that allows you to burn an NFT.
2. Deploy your contract on testnet
3. Call `submit_exercise()` in the Evaluator to configure the contract you want to be evaluated.
4. Send a token to the Evaluator contract or use the previous exercise to mint a new token.
5. Call `ex_03_erc721_burn()` to verify the `burn()` function within your contract and receive points.

### Exercise 4 - Transfering a token

Here, we will focus on creating the transfer function.

1. Create the `transfer_from()` function that allows you to transfer the NFT.
2. Deploy your contract on testnet
3. Call `submit_exercise()` in the Evaluator to configure the contract you want to be evaluated.
4. Call `ex_04_erc721_transfer()` to verify your contract and receive points.
