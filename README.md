# SHARE Curation Associates Directory

## Add yourself

Add a JSON file with your name as the filename, e.g. `brian-may.json`.

```json
{
    "first": "Brian",
    "last": "May",
    "twitter": "DrBrianMay"
}
```


Valid keys:

- `first`
- `last`
- `email`
- `osf`
- `github`
- `twitter`
- `personal`

## Build the site

Install requirements:

```
pip install -r requirements.txt
```

Build the site (and watch for changes):

```
inv watch -b
```
