#!/bin/bash
main () {
    local url=$1
    if [[ -z "$url" ]]; then
        echo "ERROR:
        An URL must be provided.
        Usage: check-res <url>
        Aborting.
        "
        exit 1
    fi
    print_header
    echo "REMOVING METRICS LOG FILE"
    rm -rf metrics.log
    echo "REMOVING ERRORS LOG FILE"
    rm -rf errors.log
    echo "RESPONSE_CODE | TIME_TOTAL(s) | POD_ID" >> metrics.log
    echo "RESPONSE_CODE | TIME_TOTAL(s) | POD_ID" >> errors.log
    for i in $(seq 1 10000); do
        make_request $url
    done
    rm -rf output.log
    }
    print_header () {
        echo "code,time_total"
    }
    make_request () {
        local url=$1
        http_status=$(curl --write-out %{http_code} --silent --output output.log $url)
        if [[ "$http_status" -ne 200 ]] ; then
            curl \
            --write-out "%{http_code} | %{time_total} | " \
            --silent \
            --output output.log \
            >> errors.log \
            "$url"
        else
            curl \
            --write-out "%{http_code} | %{time_total} | " \
            --silent \
            --output output.log \
            >> metrics.log \
            "$url"
            curl --silent $url | grep -o 'helloweb[^;]*' >> metrics.log
        fi
    }
main "$@"