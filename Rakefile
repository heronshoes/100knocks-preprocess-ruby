# frozen_string_literal: true

require 'rake/clean'

task default: :convert

# Quarto
qmd_dir = 'doc/qmd'
notebook_dir = 'doc/notebook'

directory notebook_dir

qmd_files = FileList["#{qmd_dir}/*.qmd"]
qmd_files.exclude('~*.qmd')
notebooks = qmd_files.pathmap('%{qmd,notebook}p').ext('.ipynb')

qmd_files.zip(notebooks).each do |qmd, notebook|
  file notebook => notebook_dir
  file notebook => qmd do
    sh "quarto convert #{qmd} -o #{notebook}"
  end
end

desc 'Convert qmd to ipynb files'
task convert: notebooks
file notebooks => notebook_dir

desc 'test to execute notebooks'
task test: notebooks do
  notebooks.each do |notebook|
    quarto_options = '--execute-daemon-restart --execute'
    sh "bundle exec quarto render #{notebook} #{quarto_options}"
  end
end

desc 'Start jupyter lab'
task jupyter: :convert do
  jupyter_options =
    "--notebook-dir='doc/notebook' --NotebookApp.token=''"
  sh "bundle exec jupyter lab #{jupyter_options}"
end

CLEAN << 'doc/notebook'
