# Create a 1-of-4 P2SH multisig address from the public keys in the four inputs of this tx:
#   `37d966a263350fe747f1c606b159987545844a493dd38d84b070027a895c4517`
tx='37d966a263350fe747f1c606b159987545844a493dd38d84b070027a895c4517'
raw=$(bitcoin-cli getrawtransaction $tx)
k1=$(bitcoin-cli decoderawtransaction $raw | jq '.vin[0].txinwitness[1]' -r)
k2=$(bitcoin-cli decoderawtransaction $raw | jq '.vin[1].txinwitness[1]' -r)
k3=$(bitcoin-cli decoderawtransaction $raw | jq '.vin[2].txinwitness[1]' -r)
k4=$(bitcoin-cli decoderawtransaction $raw | jq '.vin[3].txinwitness[1]' -r)
bitcoin-cli createmultisig 1 '["'"$k1"'","'"$k2"'","'"$k3"'","'"$k4"'"]' | jq -r '.address'
# 3GyWg1CCD3RDpbwCbuk9TTRQptkRfczDz8
