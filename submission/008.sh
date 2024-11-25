# Which public key signed input 0 in this tx:
#   `e5969add849689854ac7f28e45628b89f7454b83e9699e551ce14b6f90c86163`
tx='e5969add849689854ac7f28e45628b89f7454b83e9699e551ce14b6f90c86163'
txinwtns=$(bitcoin-cli getrawtransaction $tx 1 | jq '.vin | .[0].txinwitness[2]' -r)
bitcoin-cli decodescript $txinwtns | jq '.asm | split(" ") | select(.[] == "OP_IF") | .[1]' -r
# 025d524ac7ec6501d018d322334f142c7c11aa24b9cffec03161eca35a1e32a71f
