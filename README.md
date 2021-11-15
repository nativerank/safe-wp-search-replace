# Safe wp search-replace

## Requirements

    - Wordpress by Bitnami
    - WP CLI
    - UpdraftPlus Wordpress backup plugin

Dry run

```bash
curl https://raw.githubusercontent.com/nativerank/safe-wp-search-replace/master/safe-wp-search-replace.sh | bash -s -- "-x-PLACEHOLDER-x-" "-x-PLACEHOLDER-x-"
```

Execute :warning: search and replace can be very dangerous, BUT as a safety precaution this script will take a full
UpdraftPlus backup of your site before executing the search-replace command

```bash
curl https://raw.githubusercontent.com/nativerank/safe-wp-search-replace/master/safe-wp-search-replace.sh | bash -s -- "-x-PLACEHOLDER-x-" "-x-PLACEHOLDER-x-" --execute
```
