import json
import os
import webbrowser

from mako.template import Template
from invoke import task
from invocations.watch import watch as watch_task

HERE = SOURCE_DIR = os.path.dirname(os.path.abspath(__file__))


def collect_json(source_dir):
    ret = []
    for filename in os.listdir(source_dir):
        if filename.lower().endswith('.json'):
            with open(os.path.join(source_dir, filename), 'r') as fp:
                ret.append(json.load(fp))
    return sorted(ret, key=lambda each: each['last'])


@task
def build(ctx, browse=False):
    index = Template(filename=os.path.join(HERE, 'index.mako'))
    data = collect_json(SOURCE_DIR)
    with open(os.path.join(HERE, 'index.html'), 'w') as fp:
        fp.write(index.render(data=data))
    print('Finished building site.')
    if browse:
        webbrowser.open_new_tab(os.path.join(HERE, 'index.html'))


@task
def watch(ctx, browse=False):
    if browse:
        build(ctx, browse=True)
    print('Watching for changes...')
    watch_task(
        ctx, build, ['\.'], ['.*/\..*\.swp']
    )
