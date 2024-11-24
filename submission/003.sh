set -x
# How many new outputs were created by block 123,456?
hash=$(bitcoin-cli getblockhash 123456)
block=$(bitcoin-cli getblock $hash)
echo $block | jq -r '.tx[] | length' | wc -l
# 13
