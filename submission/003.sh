# How many new outputs were created by block 123,456?
bitcoin-cli getblock `bitcoin-cli getblockhash 123456` true | jq '.tx | length'
# 13
