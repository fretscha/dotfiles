function svim { vim $(find . -type f | egrep -v 'svn|tmp' | grep $1); }

function uuid { python -c 'import sys,uuid; sys.stdout.write(uuid.uuid4().hex)' | pbcopy && pbpaste && echo }

function server() {
    local port="${1:-8000}"
    open "http://localhost:${port}/"
    python -m SimpleHTTPServer "$port"
}

syspip(){
   PIP_REQUIRE_VIRTUALENV="" pip "$@"
}