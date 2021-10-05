import sys
from crypto import convertDataToJSON, pinJSONtoIPFS, initContract, w3

from pprint import pprint

# Initialize cryptofax contract object using initContract
cryptofax = initContract()

def createAccidentReport():
    # Input from the user various details to upload, like "time" and "description" and the "token_id" to match against
    time = input("Date of the accident: ")
    description = input("Description of the accident: ")
    # Convert the user input to a number using int()
    token_id = int(input("Token ID: ")) 

    # convert the data collected to JSON, then return the token_id and the IPFS URI that pinJSONtoIPFS returns
    json_data = convertDataToJSON(time, description)
    report_uri = pinJSONtoIPFS(json_data)

    return token_id, report_uri


def reportAccident(token_id, report_uri):
    # Create a reportAccident transaction using cryptofax contract and return the tx receipt (make sure to set a 'from' account)
    tx_hash = cryptofax.functions.reportAccident(token_id, report_uri).transact(
        {"from": w3.eth.accounts[0]})
    
    receipt = w3.eth.waitForTransactionReceipt(tx_hash)
    return receipt


def getAccidentReports(token_id):
    # Create an Accident filter, filtering against token_id, and return all entries
    accident_filter = cryptofax.events.Accident.createFilter(fromBlock="0x0",
                                                             argument_filters={"token_id": token_id})
    return accident_filter.get_all_entries()
                                                             

# sys.argv is the list of arguments passed from the command line
# sys.argv[0] is always the name of the script
# sys.argv[1] is the first argument, and so on
# For example:
#        sys.argv[0]        sys.argv[1]    sys.argv[2]
# python accident.py        report
# python accident.py        get            1
def main():
    if sys.argv[1] == "report":
        # Collect token_id, report_uri from createAccidentReport
        token_id, report_uri = createAccidentReport()        
                     
        receipt = reportAccident(token_id, report_uri) 
             
        # Call reportAccident and pretty print the results
        pprint(receipt)
        print("Report IPFS Hash:", report_uri)

    if sys.argv[1] == "get":
        token_id = int(sys.argv[2]) # fetches token_id from next argument and converts the string input to number

        car = cryptofax.functions.cars(token_id).call()
        reports = getAccidentReports(token_id)

        pprint(reports)
        print("VIN", car[0], "has been in", car[1], "accidents.")


main()
