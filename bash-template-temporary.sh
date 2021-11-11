# temp directory
tempDirectory=$(mktemp -d -t tmp.XXXXXXXXXX)
function cleanup {
  rm -rf "$tempDirectory"
}
trap cleanup EXIT

