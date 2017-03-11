from pybuilder.core import init, Author, use_plugin, task, depends

use_plugin("python.core")
use_plugin("python.install_dependencies")
use_plugin('python.distutils')
use_plugin('python.pylint')
use_plugin('exec')
use_plugin('python.sphinx')


name='myproject'
version = '0.1.dev0'

author = Author('Yaniv Yemini', 'yaniv@example.com')
license = 'GPL v3'
url = 'https://github.com/yanivyam/myproject'
description = __doc__
summary = 'My project description'

default_task = ['clean', 'install_dependencies', 'analyze', 'publish']

# to generate documentation via Sphinx, run pyb sphinx_generate_documentation


@init
def initialize(project):
  project.set_property('dir_source_main_python', 'myproject')
  project.set_property("dir_source_unittest_python", "tests")
  project.set_property("dir_source_main_scripts", "scripts")

  project.set_property('distutils_commands', ['bdist_wheel'])

  project.set_property('pylint_options', ['--rcfile', 'pylintrc'])

  project.set_property('run_unit_tests_command', 'nosetests ./tests')
  project.set_property('run_unit_tests_propagate_stdout', 'True')
  project.set_property('run_unit_tests_propagate_stderr', 'True')

  project.set_property('sphinx_source_dir', 'docs/sphinx')
  project.set_property('sphinx_output_dir', 'docs/sphinx/_build/')

  project.depends_on_requirements("requirements.txt")
  project.build_depends_on_requirements("requirements-dev.txt")

@task(description="Create docs")
@depends("sphinx_generate_documentation")
def docs(project):
  pass



