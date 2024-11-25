# Only one single output remains unspent from block 123,321. What address was it sent to?
bh='123321'
b1=$(bitcoin-cli getblockhash $bh)
fl=1
i=0
while [ $fl -ne 0 ]; do
    if [[ $(bitcoin-cli getblock $b1 2 | jq ".tx[$i]" -r) =~ "}" ]]; then
        i=$((i + 1))
    else
        fl=0
    fi
done
aux=$(($i - 1))
n=0
while [ $aux -ne 0 ]; do
    txid=$(bitcoin-cli getblock $b1 2 | jq ".tx[$aux] | .txid" -r)
    fl=1
    while [ $fl -ne 0 ]; do
        if [[ $(bitcoin-cli getblock $b1 2 | jq ".tx[$aux] | .vout[$n]" -r) =~ "}" ]]; then
            n=$((n + 1))
        else
            fl=0
        fi
    done
    while [ $n -ne 0 ]; do
        txout=$(bitcoin-cli gettxout $txid $((n - 1)))
        if [[ $txout ]]; then
            echo $txout | jq '.scriptPubKey | .address' -r
            fl=1
            break
        else
            n=$((n - 1))
        fi
    done
    if [[ $fl -eq 1 ]]; then
        aux=0
    else
        aux=$((aux - 1))
    fi
done
# 1FPDNNmgwEnKuF7GQzSqUcVQdzSRhz4pgX
