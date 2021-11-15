SEARCH=$1
REPLACE=$2

if [[ -z "$SEARCH" ]] ; then
        printf -- "\n ERROR: Search value is required! \n"
        exit 64
fi

if [[ -z ${REPLACE+x} ]] ; then
        printf -- "\n ERROR: Replace value is required! \n"
        exit 64
fi

printf -- "\n Searching for: \"${SEARCH}\"\n"
printf -- "\n Replacing with: \"${REPLACE}\"\n"

for i in "$@"; do
  case $i in
  --execute*)
    EXECUTE=1
    ;;
  *)
    # unknown option
    ;;
  esac
done

if [[ -z "${EXECUTE}" ]] ; then
        set -x
        sudo wp search-replace "${SEARCH}" "${REPLACE}" --dry-run --log --skip-plugins=w3-total-cache
        exit 0
fi

printf -- "\n Backing up site.. \n"

JOB_ID=$(sudo wp updraftplus backup | sed -n 's/.*Success: Recently started backup job id: //p')

if [[ -z "$JOB_ID" ]] ; then
        printf -- "\n ERROR: Failed to backup site \n"
        exit 64
fi

(printf -- "\n Checking backup job ${JOB_ID} progress.. \n" & wait)

PROGRESS=$(sudo wp updraftplus backup_progress "${JOB_ID}")

printf -- "\n ${PROGRESS} \n"

SUCCESS=$(echo "${PROGRESS}" | sed -n 's/Success: The backup apparently succeeded and is now complete.*/1/p')

if [[ "$SUCCESS" != 1 ]] ; then
        printf -- "\n ERROR: Failed to backup site \n"
        exit 64
fi

set -x
sudo wp search-replace "${SEARCH}" "${REPLACE}" --log --skip-plugins=w3-total-cache
exit 0
