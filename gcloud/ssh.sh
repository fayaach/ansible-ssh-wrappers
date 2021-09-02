#!/bin/bash

# initialization
declare -a OPTIONS
ZONE="us-central1-a"

# phase 1
ARGS=$(getopt -n "$(basename "${0}")" -o Co:t: -- "${@}")

VALID_ARGUMENTS=$?

if [ "$VALID_ARGUMENTS" != "0" ]; then
  usage
fi

# phase 2
eval set -- "${ARGS}"

while true; do

  case "${1}" in
    -C )    OPTIONS[${#OPTIONS[@]}]="${1}"     ; shift                       ;;
    -o )    OPTIONS[${#OPTIONS[@]}]="${1} ${2}"; shift 2                     ;;
    -t )    OPTIONS[${#OPTIONS[@]}]="${1} ${2}"; shift 2                     ;;
     --)    shift;                               break                       ;;
      *)    echo "Unexpected option: $1";        echo "Wrong usage."; exit 2 ;;
  esac
  
done

SOURCE=$1; shift;
TARGET=$( echo $1 | sed 's/\[\|\]//g' ); shift;

# running wrapped command
/usr/bin/gcloud compute scp --quiet --zone "${ZONE}" "${SOURCE}" "${TARGET}"
