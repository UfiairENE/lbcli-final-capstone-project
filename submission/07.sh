# what is the coinbase tx in this block 243,834

#!/bin/bash

# Getting the blockhash of block 243,834
blockhash=$(bitcoin-cli -signet -named getblockhash 243834)

# Getting the txid of the coinbase transaction in block 243,834
bitcoin-cli -signet -named getblock $blockhash | jq -r '.tx[0]'