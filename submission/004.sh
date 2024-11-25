# Using descriptors, compute the taproot address at index 100 derived from this extended public key:
#   `xpub6Cx5tvq6nACSLJdra1A6WjqTo1SgeUZRFqsX5ysEtVBMwhCCRa4kfgFqaT2o1kwL3esB1PsYr3CUdfRZYfLHJunNWUABKftK2NjHUtzDms2`
# Utils  Bitcoin-cli. 
# https://learnmeabitcoin.com/technical/keys/hd-wallets/derivation-paths/
# https://medium.com/@abdoollahikbk/unlocking-flexibility-understanding-output-descriptors-in-bitcoin-f852a7d90a29
pk='xpub6Cx5tvq6nACSLJdra1A6WjqTo1SgeUZRFqsX5ysEtVBMwhCCRa4kfgFqaT2o1kwL3esB1PsYr3CUdfRZYfLHJunNWUABKftK2NjHUtzDms2'
cs=$(bitcoin-cli getdescriptorinfo "tr($pk/100)" | jq '.checksum' -r)
bitcoin-cli deriveaddresses "tr($pk/100)#$cs" | jq '.[0]' --raw-output
# bc1p3yrtpvv6czx63h2sxwmeep8q98h94w4288fc4cvrkqephalydfgszgacf9
