NETWORK=mainnet-beta
KEYPAIR_TOKEN_AUTHORITY=./.keypairs/${NETWORK}/UpRocK4EHKUG3RwCJH6LZvhiD5SH6seMuyUEjhwg3Um.json


TOKEN_MINT=uPtSoL2qszk4SuPHNE2zqk1gDtqCq21ZE1yZCqvFTqq
KEYPAIR_TOKEN_MINT=./.keypairs/${NETWORK}/${TOKEN_MINT}.json

env:
	solana config set --url ${NETWORK}
	solana config set --keypair ${KEYPAIR_TOKEN_AUTHORITY}
	cp ${KEYPAIR_TOKEN_AUTHORITY} ~/.config/solana/id.json

create:
	spl-token create-token --decimals 9 ${KEYPAIR_TOKEN_MINT}

metadata-create:
	metaboss create metadata --metadata ./token.json --mint ${TOKEN_MINT}

metadata-update:
	metaboss update uri --account ${TOKEN_MINT} --new-uri=https://raw.githubusercontent.com/uprockcom/upt-sol/main/metadata.json

update-auth:
	spl-token authorize ${TOKEN_MINT} mint GRwm4EXMyVwtftQeTft7DZT3HBRxx439PrKq4oM6BwoZ

