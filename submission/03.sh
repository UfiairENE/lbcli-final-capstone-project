# Which tx in block 216,351 spends the coinbase output of block 216,128?

#!/bin/bash
# Getting the blockhash of blocks 216,128 and 216,351
block1=$(bitcoin-cli -signet -named getblockhash 216128)
block2=$(bitcoin-cli -signet -named getblockhash 216351)

# Getting the txid of the coinbase transaction in block 216,128
coinbase_txid=$(bitcoin-cli -signet -named getblock $block1 | jq -r '.tx[0]')

# Finding the txid of the transaction in block 216,351 that spends the coinbase output
bitcoin-cli -signet -named getblock $block2 2 | jq -r '.tx[] | select(.vin[].txid == "'$coinbase_txid'") | .txid'