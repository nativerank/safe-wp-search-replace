# Safe wp search-replace

## Requirements

    - Wordpress
    - WP CLI
    - UpdraftPlus Wordpress backup plugin

Dry run

```bash
curl https://raw.githubusercontent.com/nativerank/safe-wp-search-replace/master/safe-wp-search-replace.sh | bash -s -- "-x-PLACEHOLDER-x-" "-x-PLACEHOLDER-x-"
```

Execute :warning: search and replace can be very dangerous, fortunately this script will take a full backup of your site before proceeding 

```bash
curl https://raw.githubusercontent.com/nativerank/safe-wp-search-replace/master/safe-wp-search-replace.sh | bash -s -- "-x-PLACEHOLDER-x-" "-x-PLACEHOLDER-x-" --execute
```
