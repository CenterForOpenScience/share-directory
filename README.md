# SHARE Directory

This repo has two purposes:

- Provide a directory listing of the people building and using SHARE
- Serve as a learning tool for learning Git and GitHub

## Add yourself

1. Add a JSON file with your name as the filename, e.g. `brian-may.json`, to the appropriate directory. Fill out your information.
2. Send a PR.

Example JSON file:

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

- Install requirements:

```
pip install -r requirements.txt
```

- Build the site (and watch for changes):

```
inv watch -b
```
