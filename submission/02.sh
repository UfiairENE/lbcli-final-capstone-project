# How many new outputs were created by block 243,825?

#!/bin/bash
bitcoin-cli -signet getblockstats 243825 | jq '.outs'
