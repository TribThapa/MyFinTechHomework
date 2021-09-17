# Import dependencies
import subprocess
import json
from dotenv import load_dotenv

import os 
from dotenv import load_dotenv
from pathlib import Path
from pprint import pprint

from constants import *
from web3 import Web3
from eth_account import Account 

from web3.middleware import geth_poa_middleware
from web3 import Web3, middleware, Account
from web3.gas_strategies.time_based import medium_gas_price_strategy
from web3.middleware import geth_poa_middleware

from bit import PrivateKeyTestnet
from bit.network import NetworkAPI

load_dotenv()


# connect to Web3
w3 = Web3(Web3.HTTPProvider('http://localhost:8545'))

# enable PoA middleware
w3.middleware_onion.inject(geth_poa_middleware, layer=0)
w3.eth.setGasPriceStrategy(medium_gas_price_strategy)

# get mnemonic
mnemonic = os.getenv('mnemonic')

# get coins from constants.py file
coin = BTC

# print results
print(coins)
print()
print(type(mnemonic))



# func for wallet
def derive_wallets(mnemonic, coin, numderive=3):
    command = f"./derive -g --mnemonic='{mnemonic}' --coin='{coin}'  --numderive='{numderive}' --cols=path,address,privkey,pubkey --format=json"
    p = subprocess.Popen(command, stdout=subprocess.PIPE, shell=True)
    (output, err) = p.communicate()
    p_status = p.wait()
    keys = json.loads(output) 
    return print(keys)


    
# func for coins
def coins():
    coin_dict = {}
    
    for i in coins:        
        coin_dict[i] = derive_wallets(mnemonic, i, 3)        
    return coin_dict



# convert the `privkey` string in a child key to an account object that `bit` or `web3.py` can use to transact
def priv_key_to_account(coin, priv_key):
    if coin == ETH:
        private_key = Account.privateKeyToAccount(priv_key)
    elif coin == BTCTEST:
        private_key = PrivateKeyTestnet(priv_key)
    return private_key



# create the raw, unsigned transaction that contains all metadata needed to transact
def create_tx(coin, account, to, amount):
    if coin=='eth':
        value = w3.toWei(amount, "ether")
        gasEstimate = w3.eth.estimateGas({"from": account.address, "to": to, "amount": value})
        return {"from": account.address,
                "to": to,
                "value": value,
                "gas": gasEstimate,
                "gasPrice": w3.eth.generateGasPrice(),
                "nonce": w3.eth.getTransactionCount(account.address),
                "chainID": w3.eth.chain_id}
    
    elif coin=='btc-test':        
        return PrivateKeyTestnet.prepare_transaction(account.address, [(to, amount, BTC)])
    
    
# call `create_tx`, sign the transaction, then send it to the designated network    
def send_tx(coin, account, to, amount):
    if coin == ETH:
        raw_tx = create_tx(coin, account.address, to, amount)
        signed = account.signTransaction(raw_tx)
        return w3.eth.sendRawTransaction(signed.rawTransaction)
    if coin == BTCTEST:
        raw_tx = create_tx(coin, account, to, amount)
        signed = account.sign_transaction(raw_tx)
        return NetworkAPI.broadcast_tx_testnet(signed)    
    
    
coins = {ETH: derive_wallets(mnemonic, coin),
         BTCTEST: derive_wallets(mnemonic, coin)}

pprint(coins)