#!/bin/bash
SCRIPT_DIR=`cd $(dirname $0); pwd`

SECRET="$SCRIPT_DIR/etc/secret"
[[ -e "$SECRET" ]] && source <(sed -e 's:=:=":' -e 's:$:":' $SECRET)

set_mandatory_value(){
	PROMPT=$2
	VAR=$1
	[[ -n "${!VAR}" ]] && DEFAULT="${!VAR}" || unset DEFAULT
	read -p "$PROMPT`[[ -n "$DEFAULT" ]] && echo -e " [$DEFAULT]"`: " INPUT
	export $VAR="${INPUT:-$DEFAULT}"
	[[ -z "${!VAR}" ]] && echo "Invalid value: Do not leave blank" && exit 1
	VAR_LIST="$VAR_LIST $VAR"
	unset INPUT
}

write_secret(){
    VAR_LIST=( $VAR_LIST )
    for VAR in ${VAR_LIST[@]}; do
        echo "$VAR=${!VAR}"
    done > $SECRET
}

set_mandatory_value DOMAIN "Enter the domain"
set_mandatory_value IP_BEGIN "Enter the first assignable IP"
set_mandatory_value IP_END "Enter the last assignable IP"
set_mandatory_value ROUTER_IP "Enter the IP of the router"
set_mandatory_value DNS_LIST "Enter the list of DNS"

write_secret
