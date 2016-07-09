import json
from pathlib import Path
import webbrowser

from mako.template import Template
from invoke import task
from invocations.watch import watch as watch_task

HERE = Path('.')
BUILD = HERE / 'built'

def collect_json(source_dir):
    ret = []
    source_path = Path(source_dir)
    for file_path in source_path.glob('*.json'):
        with file_path.open() as fp:
            ret.append(json.load(fp))
    return sorted(ret, key=lambda each: each['last'])

def render_site():
    index = Template(filename=str(HERE / 'index.mako'))
    return index.render(
        associates=collect_json(str(HERE / 'associates')),
        developers=collect_json(str(HERE / 'developers')),
    )

@task
def build(ctx, browse=False):
    try:
        BUILD.mkdir()
    except FileExistsError:
        pass
    index_path = BUILD / 'index.html'
    with index_path.open('w') as fp:
        fp.write(render_site())
    print('Finished building site.')
    if browse:
        webbrowser.open_new_tab(str(index_path))


@task
def watch(ctx, browse=False):
    if browse:
        build(ctx, browse=True)
    print('Watching for changes...')
    watch_task(
        ctx, build, ['\.'], ['.*/\..*\.swp']
    )

@task
def publish(ctx, push=True):
    build(ctx, browse=False)
    cmd = 'ghp-import {} -m "Build site"'.format(str(BUILD))
    if push:
        cmd += ' -p'
    ctx.run(cmd, echo=True)
