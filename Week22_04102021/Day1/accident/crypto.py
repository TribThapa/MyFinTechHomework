import requests
import json
import os

from web3.auto import w3

from dotenv import load_dotenv
load_dotenv()

from pathlib import Path

headers = {
    "Content-Type": "application/json",
    "pinata_api_key": os.getenv("PINATA_API_KEY"),
    "pinata_secret_api_key": os.getenv("PINATA_SECRET_API_KEY"),
}


def initContract():
    with open(Path("CryptoFax.json")) as json_file:
        abi = json.load(json_file)
    return w3.eth.contract(address=os.getenv("CRYPTOFAX_ADDRESS"), abi=abi)

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
    # @TODO: Post the JSON object to Pinata according to their API spec
    r = requests.post("https://api.pinata.cloud/KeyOne", data=json, headers=headers)
    ipfs_hash = r.json()["IpfsHash"]
    return f"ipfs://{ipfs_hash}"
