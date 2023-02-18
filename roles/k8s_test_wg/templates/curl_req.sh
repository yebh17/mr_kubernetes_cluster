#!/bin/bash

print_header () {
    echo "code,time_total"
}

cleanup_logs () {
    echo "REMOVING METRICS LOG FILE"
    rm -f metrics.log
    echo "REMOVING ERRORS LOG FILE"
    rm -f errors.log
    echo "RESPONSE_CODE | TIME_TOTAL(s) | POD_ID" >> metrics.log
    echo "RESPONSE_CODE | TIME_TOTAL(s) | POD_ID" >> errors.log
}

make_request () {
    local url=$1
    local http_status=$(curl --write-out %{http_code} --silent --output /dev/null $url)
    local response_time=$(curl --write-out %{time_total} --silent --output /dev/null $url)

    if [[ "$http_status" -ne 200 ]] ; then
        echo "$http_status,$response_time" >> errors.log
    else
        local pod_id=$(curl --silent $url | grep -o 'helloweb[^;]*')
        echo "200,$response_time,$pod_id" >> metrics.log
    fi
}

cleanup_temp_files () {
    rm -f output.log
}

main () {
    local url=$1
    if [[ -z "$url" ]]; then
        echo "ERROR: Please provide an URL as an argument for processing the requests"
        exit 1
    fi

    print_header
    cleanup_logs

    for i in $(seq 1 10000); do
        make_request $url
    done

    cleanup_temp_files
}

main "$@"