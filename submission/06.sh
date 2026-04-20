# Only one tx in block 243,821 signals opt-in RBF. What is its txid?

#!/bin/bash

# Getting the blockhash of block 243,821
blockhash=$(bitcoin-cli -signet -named getblockhash 243821)

# Getting the txid of the transaction in block 243,821 that signals opt-in RBF
bitcoin-cli -signet -named getblock $blockhash 2 | jq -r '.tx[] | select(.vin[].sequence < 4294967294) | .txid'