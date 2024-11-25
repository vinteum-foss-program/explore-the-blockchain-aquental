# Which tx in block 257,343 spends the coinbase output of block 256,128?
bh='257343'
bh_cb='256128'

b1=$(bitcoin-cli getblockhash $bh_cb)
coinbase=$(bitcoin-cli getblock $b1 | jq '.tx[0]' -r)
b2=$(bitcoin-cli getblockhash $bh)
fl=1
i=0
while [ $fl -ne 0 ]; do
    if [[ $(bitcoin-cli getblock $b2 2 | jq ".tx[$i] | .vin") =~ $coinbase ]]; then
        fl=0
    else
        i=$((i + 1))
    fi
done
bitcoin-cli getblock $b2 2 | jq ".tx[$i] | .txid" -r
# c54714cb1373c2e3725261fe201f267280e21350bdf2df505da8483a6a4805fc
