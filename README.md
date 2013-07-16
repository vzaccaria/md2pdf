# md2pdf

This is an updated version of the script `md2pdf.sh` originally released by Claes Holmerson. It allows to generate pdf through `xelatex` and customize fonts and other aspects of the document very easily (just edit the variables in the `md2pdf.sh`).

## Installation

	npm install -g md2pdf

## Usage

	md2pdf.sh markdown-file.md

## Customization
The following variables can be customized by editing md2pdf:

* paper         (default: `a4paper`)
* hmargin       (default: `3cm`)
* vmargin       (default: `3.5cm`)
* fontsize      (default: `10pt`)
* mainfont      (default: `"Palatino Linotype"`)
* sansfont      (default: `Corbel`)
* monofont      (default: `Consolas`)
* language      (default: `english`)
* nohyphenation (default: `false`)
* columns       (default: `onecolumn`)
* geometry      (default: `portrait`)
