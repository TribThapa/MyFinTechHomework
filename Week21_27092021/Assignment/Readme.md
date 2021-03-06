## Crowd sale with SOLIDITY

## Background

Your company has decided to crowdsale their PupperCoin token in order to help fund the network development.
This network will be used to track dog breeding activity across the globe in a decentralized way, and allow humans to track the genetic trail of their pets. You have already worked with the necessary legal bodies and obtained the green light on creating a crowdsale open to the public. However, you are required to enable refunds if the crowdsale is successful and the goal is met, and you are only allowed to raise a maximum of 300 ether. The crowdsale will run for 24 weeks.

You will need to create an ERC20 token that will be minted through a `Crowdsale` contract that you can leverage from the OpenZeppelin Solidity library.

This crowdsale contract will manage the entire process, allowing users to send ETH and get back PUP (PupperCoin).
This contract will mint the tokens automatically and distribute them to buyers in one transaction.

It will need to inherit `Crowdsale`, `CappedCrowdsale`, `TimedCrowdsale`, `RefundableCrowdsale`, and `MintedCrowdsale`.

You will conduct the crowdsale on the Kovan or Ropsten testnet in order to get a real-world pre-production test in.

<p align="center">
   	<img src="/Week21_27092021/Assignment/Images/CrowdSale2.jpg" width="1000" height="500">
</p>

<p>&nbsp;</p>
<p>&nbsp;</p>

## [PupperCoin in Solidity](PupperCoinCrowdsale.sol) 

Step 1: Bootstrap the contract, provide parameters for all features of crowdsale, and compile.

![Compile](Images/1_Compiled.JPG)

<p>&nbsp;</p>
<p>&nbsp;</p>

Step 2: Check parameters before deploying

![Deploy](Images/2_Deploy.JPG)

<p>&nbsp;</p>
<p>&nbsp;</p>

Step 3: Test deployment

![3Deploy](Images/3_Deploy.JPG)

<p>&nbsp;</p>
<p>&nbsp;</p>

Step 4: Validate deployment via blocks generated in Ganache.

![Blockchain](Images/4_BlockCreation.JPG)

<p>&nbsp;</p>
<p>&nbsp;</p>

Step 5: Ensure detailes in the transaction record match details in the block on Ganache.

![Tx](Images/5_Tx_Ganache.JPG)

<p>&nbsp;</p>
<p>&nbsp;</p>

Step 6: Re-deploy if you're happy with all parameters in the steps above.

![2ndDeploy](Images/6_Deploy.JPG)

<p>&nbsp;</p>
<p>&nbsp;</p>

Step 7: Check deployed contract, and copy token_address for the next step.

![AddTokenAddress](Images/7_TokenAddresses.JPG)

<p>&nbsp;</p>
<p>&nbsp;</p>

Step 8: At token_address to `At Address` tab, and check PupperCoinSale contract options.

![PupperCoin](Images/8_PupperCoin_CrowdSale.JPG)

<p>&nbsp;</p>
<p>&nbsp;</p>

Step 9: Select the Ganache address you want to use to buy tokens.

![Beneficiary](Images/9_Beneficiary.JPG)

<p>&nbsp;</p>
<p>&nbsp;</p>

Step 10: Test the transaction.

![BuyTokens](Images/10_BuyTokens.JPG)