import json
from pathlib import Path

from schema import Schema, Optional

from tasks import render_site

HERE = Path('.')
SCHEMA = Schema({
    'first': str,
    'last': str,
    Optional('twitter'): str,
    Optional('email'): str,
    Optional('osf'): str,
    Optional('personal'): str,
    Optional('github'): str,
})


def validate(path):
    source_path = HERE / path
    for file_path in source_path.glob('*.json'):
        with file_path.open() as fp:
            SCHEMA.validate(json.load(fp))


def test_associates():
    validate('associates')


def test_developers():
    validate('developers')


def test_site_renders():
    assert render_site()
