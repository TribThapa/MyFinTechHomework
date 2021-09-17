# Multi-Blockchain Wallet in Python

## Background

Your new startup is focusing on building a portfolio management system that supports not only traditional assets
like gold, silver, stocks, etc, but crypto-assets as well! The problem is, there are so many coins out there! It's
a good thing you understand how HD wallets work, since you'll need to build out a system that can create them.

You're in a race to get to the market. There aren't as many tools available in Python for this sort of thing, yet.
Thankfully, you've found a command line tool, `hd-wallet-derive` that supports not only BIP32, BIP39, and BIP44, but
also supports non-standard derivation paths for the most popular wallets out there today! However, you need to integrate
the script into your backend with your dear old friend, Python.

Once you've integrated this "universal" wallet, you can begin to manage billions of addresses across 300+ coins, giving
you a serious edge against the competition.


## Step 1a: 
Fund a `BTCTEST` address using [this testnet faucet](https://testnet-faucet.mempool.co/)


 <p align="center">
   	<img src="/Week19_13092021/Assignment/Images/1_BTC1.JPG" width="400" height="500">
 </p>

<p>&nbsp;</p>
<p>&nbsp;</p>


## Step 1b: 
Here's another way to send test net BTC using [an alternative testnet faucet](https://tbtc.bitaps.com/)


 <p align="center">
   	<img src="/Week19_13092021/Assignment/Images/2_BTC2.JPG" width="400" height="500">
 </p>


<p>&nbsp;</p>
<p>&nbsp;</p>

## Step 2: 
Confirm transaction using [this webpage](https://www.blockchain.com/explorer?view=btc-testnet)


 <p align="center">
   	<img src="/Week19_13092021/Assignment/Images/3_BTC3.JPG" width="400" height="500">
 </p>

<p>&nbsp;</p>
<p>&nbsp;</p>

## Step 3: 
Create Proof-of-Authority nodes


 <p align="center">
   	<img src="/Week19_13092021/Assignment/Images/4_poanodes.JPG">
 </p>

<p>&nbsp;</p>
<p>&nbsp;</p>

## Step 4: 
Confirm nodes are created in local directory 

 <p align="center">
   	<img src="/Week19_13092021/Assignment/Images/5_POA.JPG" width="500" height="300">
 </p>


<p>&nbsp;</p>
<p>&nbsp;</p>

## Step 5: 
Create [python script](https://github.com/TribThapa/MyFinTechHomework/blob/main/Week19_13092021/Assignment/wallet.py) to connect your blockchain with Python

 <p align="center">
   	<img src="/Week19_13092021/Assignment/Images/6_WalletFunc.JPG" width="500" height="500">
 </p>

<p>&nbsp;</p>
<p>&nbsp;</p>

## Step 6: 
Add one of the `ETH` addresses to the pre-allocated accounts in your `networkname.json`

 <p align="center">
   	<img src="/Week19_13092021/Assignment/Images/7_MatchAddress.JPG">
 </p>


<p>&nbsp;</p>
<p>&nbsp;</p>

## Step 7: 
Delete the `geth` folder in each node, then re-initialize using `geth --datadir nodeX init networkname.json`.

 <p align="center">
   	<img src="/Week19_13092021/Assignment/Images/8_Reinitialised.JPG">
 </p>

<p>&nbsp;</p>
<p>&nbsp;</p>

## Step 8: 
Send a transaction from the pre-funded address within the wallet to another

 <p align="center">
   	<img src="/Week19_13092021/Assignment/Images/9_SendToken.JPG">
 </p>