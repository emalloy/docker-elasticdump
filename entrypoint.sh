#!/usr/bin/env bash

if [[ -z ${ES_INPUT_URL} ]]; then
  echo "ES_INPUT_URL undefined!. Exiting ..."
  exit 1
fi

if [[ -z ${ES_OUTPUT_URL} ]]; then
  echo "ES_OUTPUT_URL undefined! Exiting ..."
  exit
fi

if [[ -z ${ES_INPUT_INDEX} ]]; then
  echo "ES_INPUT_INDEX undefined! Exiting ..."
  exit 1
fi

if [[  -z ${ES_OUTPUT_INDEX} ]]; then
  echo "ES_OUTPUT_INDEX undefined! Exiting ..."
  exit 1
fi

if ! hash elasticdump > /dev/null 2>&1; then
  echo "elasticdump binary not found! Exiting."
  exit 1
fi


elasticdump \
	--input ${ES_INPUT_URL} \
       	--input-index=${ES_INPUT_INDEX} \
       	--output=${ES_OUTPUT_URL} \
       	--output-index=${ES_OUTPUT_INDEX} \
       	--limit=${ES_LIMIT_CHUNK:-500}

exit $?
