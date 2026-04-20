# what block height was this tx mined ?
# 49990a9c8e60c8cba979ece134124695ffb270a98ba39c9824e42c4dc227c7eb

#!/bin/bash
tx=49990a9c8e60c8cba979ece134124695ffb270a98ba39c9824e42c4dc227c7eb

# Getting the blockhash of the block that contains the transaction
blockhash=$(bitcoin-cli -signet -named getrawtransaction $tx true | jq -r '.blockhash')

# Getting the block height of the block that contains the transaction
bitcoin-cli -signet -named getblock $blockhash | jq -r '.height'