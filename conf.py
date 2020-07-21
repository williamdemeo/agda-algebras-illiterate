#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#
# This file only contains a selection of the most common options. For a full
# list see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

def setup(app):
    app.add_stylesheet('_static/custom.css')
    app.add_stylesheet('_static/mathconf.js')

# -- Path setup --------------------------------------------------------------
# If extensions (or modules to document with autodoc) are in another directory,
# add these directories to sys.path here. If the directory is relative to the
# documentation root, use os.path.abspath to make it absolute, like shown here.
#
import os
import sys
sys.path.insert(0, os.path.abspath('.'))

# -- Project information -----------------------------------------------------

#project = u'⋀𝖦𝖣⋀ ⋀𝖫𝖦∃𝖡𝖱⋀'
project = u'agda-ualib'
copyright = u'2019, William DeMeo and Siva Somayyajula'
author = u'William DeMeo and Siva Somayyajula'
date = u'30 Jan 2020'
#address = u'Praha, Czechia`

# The short X.Y version.
version = u'0'
# The full version, including alpha/beta/rc tags
release = u'0.2'


# -- General configuration ---------------------------------------------------

# If your documentation needs a minimal Sphinx version, state it here.
#
# needs_sphinx = '1.8.3'

# Add any Sphinx extension module names here, as strings. They can be
# extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
# ones.
#import sphinx_rtd_theme

extensions = [
#    'sphinx_rtd_theme',
#    'sphinx.ext.imgmath',
#    'sphinx.ext.ifconfig',
#    'sphinx.ext.imgconverter',
    'sphinx.ext.intersphinx',
    'sphinx.ext.todo',
    'sphinx.ext.mathjax',
    'sphinx.ext.githubpages',
    'sphinxcontrib.bibtex',
    'sphinxcontrib.tikz',
    'sphinxcontrib.proof']

# numbered_blocks = [{'name': 'exercise',
#                     'numbering-level': 2
# }]

proof_theorem_types = {
    "axiom": "Axiom",
    "conjecture": "Conjecture",
    "corollary": "Corollary",
    "definition": "Definition",
    "example": "Example",
    "examples": "Examples",
    "exercise": "Exercise",
    "lemma": "Lemma",
    "notation": "Notation",
    "observation": "Observation",
    "proof": "Proof",
    "property": "Property",
    "question": "Question",
    "prop": "Proposition",
    "theorem": "Theorem",
    "agda": "Agda Artifact",
}

# use numbering for section references with :numref:, e.g. 'Section 3.2'.
numfig = True

# Add any paths that contain templates here, relative to this directory.
templates_path = ['_templates']

# The suffix(es) of source filenames.
# You can specify multiple suffix as a list of string:
#
# source_suffix = ['.rst', '.md']
source_suffix = ['.lagda.rst','.rst']

# The master toctree document.
master_doc = 'index'


# The language for content autogenerated by Sphinx. Refer to documentation
# for a list of supported languages.
#
# This is also used if you do content translation via gettext catalogs.
# Usually you set "language" from the command line for these cases.
language = None

# List of patterns, relative to source directory, that match files and
# directories to ignore when looking for source files.
# This patterns also effect to html_static_path and html_extra_path
exclude_patterns = ['_build', 'Thumbs.db', '.DS_Store', '.venv', 'exclude']
#exclude_patterns = [u'_build', 'Thumbs.db', '.DS_Store']

# The name of the Pygments (syntax highlighting) style to use.
pygments_style = 'sphinx'
highlight_language = 'Agda'

# If true, `todo` and `todoList` produce output, else they produce nothing.
todo_include_todos = True

source_parsers = {}

#html_theme = "sphinx_rtd_theme"

html_theme = 'alabaster'
#html_theme_path = [sphinx_rtd_theme.get_html_theme_path()]



# Theme options are theme-specific and customize the look and feel of a theme
# further.  For a list of options available for each theme, see the
# documentation.
#
html_theme_options = {
    'logo_name': True,
    'font_family': 'Times New Roman, Times, serif',
    'head_font_family': 'Times New Roman, Times, serif',
    'code_bg': 'white',
    'extra_nav_links': {
        'PDF version': 'agda-ualib.pdf'
    },
    'donate_url': 'https://www.gofundme.com/formal-foundations-for-informal-mathematics'
    # 'sidebar_width' : '200px',
    # 'page_width' : '960px',
    # 'fixed_sidebar' : True
}

# Add any paths that contain custom static files (such as style sheets) here,
# relative to this directory. They are copied after the builtin static files,
# so a file named "default.css" will overwrite the builtin "default.css".
html_static_path = ['_static']

html_logo = '_static/lambda.jpg'
html_favicon = '_static/favicon.jpg'
html_show_sourcelink = True
#html_output_encoding = 'ascii'

# Custom sidebar templates, must be a dictionary that maps document names to template names.
#
# The default sidebars (for documents that don't match any pattern) are
# defined by theme itself.  Builtin themes are using these templates by
# default: ``['localtoc.html', 'relations.html', 'sourcelink.html',
# 'searchbox.html']``.
#
# html_sidebars = {}

# -- Options for HTMLHelp output ------------------------------------------

# Output file base name for HTML help builder.
htmlhelp_basename = 'ualib'

# -- Options for LaTeX output ---------------------------------------------

latex_engine = 'xelatex'

latex_additional_files = ['unixode.sty', 'bussproofs.sty', 'mylogic.sty']

#, 'unicode-symbols-sphinx.tex.txt']

latex_elements = {
    # The paper size ('letterpaper' or 'a4paper').
    # 'papersize': 'letterpaper',
    # The font size ('10pt', '11pt' or '12pt').
    # 'pointsize': '10pt',
    # Additional stuff for the LaTeX preamble.
    # load packages and make box around code lighter
    'makeindex': '',
    'printindex': '',
    'preamble': r'''
\usepackage{amsmath,mathtools,amssymb}
\usepackage{mathrsfs}
\usepackage{stmaryrd}
\usepackage[cal=boondox]{mathalfa}
\usepackage[titles]{tocloft}
\usepackage{unixode}
\usepackage{bussproofs}
\usepackage{mylogic}
\usepackage{tikz,tikz-cd}
\usetikzlibrary{backgrounds}
'''
    # \definecolor{VerbatimBorderColor}{rgb}{0.7, 0.7, 0.7}
    # \usepackage{tikz, tikz-cd}
    # 'fncychap': r'\usepackage[Bjornstrup]{fncychap}',
    #    'printindex': r'\footnotesize\raggedright\printindex',

    # Latex figure (float) alignment
    #
    # 'figure_align': 'htbp',
}

# -- Options for LaTeX extension ----------------------------------------------
#proof_latex_notheorem = ["definition", "theorem", "proof"]

# Grouping the document tree into LaTeX files. List of tuples
# (source start file, target name, title,
#  author, documentclass [howto, manual, or own class]).
latex_documents = [
    (master_doc, 'agda-ualib.tex', u'Agda Universal Algebra Library',
     u'William DeMeo and Siva Somayyajula', 'manual'),
]

# -- Options for manual page output ------------------------------------------

# One entry per manual page. List of tuples
# (source start file, name, description, authors, manual section).
man_pages = [(master_doc, 'agda-ualib', u'Agda Universal Algebra Library', [author],
              1)]

# -- Options for Texinfo output ----------------------------------------------

# Grouping the document tree into Texinfo files. List of tuples
# (source start file, target name, title, author,
#  dir menu entry, description, category)
texinfo_documents = [
    (master_doc, 'agda-ualib', u'Agda Universal Algebra Library', author, 'agda-ualib',
     'One line description of project.', 'Miscellaneous'),
]

# -- Options for Epub output -------------------------------------------------

# A string of reStructuredText that will be included at the end of every source file that is read.
rst_epilog = """

.. raw:: html

    Please email comments, suggestions, and corrections to <a href="mailto:williamdemeo@gmail.com">williamdemeo@gmail.com</a>
"""
