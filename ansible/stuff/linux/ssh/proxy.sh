#!/usr/bin/env bash
proxy() {
    export auto_proxy="http://host.net/proxy.pac"
    export http_proxy="http://HOST:PORT/"
    export https_proxy="${http_proxy}"
    export ftp_proxy="${http_proxy}"
    export rsync_proxy="${http_proxy}"
    export no_proxy="127.0.0.1,localhost,.host1.net,.host2.com,host3.com"
}

noproxy() {
    unset $(env | awk -F'=' '/_proxy/ { print $1 }')
}

proxy