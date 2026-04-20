# How many new outputs were created by block 243,825?

#!/bin/bash
bitcoin-cli -signet -named getblockstats 243825 '["outputs"]' | jq '.outputs'