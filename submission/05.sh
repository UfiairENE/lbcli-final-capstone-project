# How many satoshis did this transaction pay for fee?: b71fb9ab7707407cc7265591e0c0d47d07afede654f91de1f63c0cb522914bcb

#!/bin/bash

tx="b71fb9ab7707407cc7265591e0c0d47d07afede654f91de1f63c0cb522914bcb"

# Getting the txid of the transaction
input_txid=$(bitcoin-cli -signet -named getrawtransaction $tx true | jq -r '.vin[0].txid')

# Getting the vout index of the input
input_vout=$(bitcoin-cli -signet -named getrawtransaction $tx true | jq -r '.vin[0].vout')

# Getting the total input value
btcin=$(bitcoin-cli -signet -named getrawtransaction $input_txid true | jq -r '.vout['$input_vout'].value')

# Getting the total output value
btcout=$(bitcoin-cli -signet -named getrawtransaction $tx true | jq -r '[.vout[].value] | add')

# Calculating the fee in satoshis
echo $(printf '%.8f-%.8f' $btcin $btcout) | bc | awk '{printf "%d\n", $1 * 100000000}'
