POSITIONAL_ARGS=()

while [[ $# -gt 0 ]]; do
	case $1 in
	-t | --vault_token)
		VAULT_TOKEN="$2"
		shift # past argument
		shift # past value
		;;
    *)
	POSITIONAL_ARGS+=("$1") # save positional arg
		shift                   # past argument
		;;    
	esac
done

VAULT_TOKEN="${VAULT_TOKEN}"

echo "NAME                   = ${VAULT_TOKEN}"

VAULT_TOKEN=${VAULT_TOKEN} docker-compose -p prism -f docker-compose-prism.yml --env-file .env up -d 