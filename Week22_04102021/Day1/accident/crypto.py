import requests
import json
import os

from web3.auto import w3

from dotenv import load_dotenv
load_dotenv()

from pathlib import Path

headers = {
    "Content-Type": "application/json",
    "pinata_api_key": "44c0f17b183a5dba8b63",
    "pinata_secret_api_key": "55988f6dfa5880ccb8b5e1e3fed2e139a510fc7c2f117bfa33c8076ed9d5333a",
}


# Talks to the json file which contains data from your Smart Contract
def initContract():
    with open(Path("CryptoFax.json")) as json_file:
        abi = json.load(json_file)
    return w3.eth.contract("0x17AA686030d34c13E0f5082F234BFafA7761aC7A", abi=abi)

def convertDataToJSON(time, description):
    data = {
        "pinataOptions": {"cidVersion": 1}, # Needed to return new IPFS urls that have better support for IPFS companion
        "pinataContent": { # This object should contain the JSON you want to pin to IPFS
            "name": "Example Accident Report",
            "description": description,
            "image": "ipfs://bafybeihsecbomd7gbu6qjnvs7jinlxeufujqzuz3ccazmhvkszsjpzzrsu",
            "time": time,
        },
    }
    return json.dumps(data)


def pinJSONtoIPFS(json):
    # Post the JSON object to Pinata according to their API spec
    r = requests.post("https://api.pinata.cloud/KeyOne", data=json, headers=headers)
    ipfs_hash = r.json()["IpfsHash"]
    return f"ipfs://{ipfs_hash}"
