#!/bin/sh

show_help() {
cat << EOF
Usage: ${0##*/} [-hm] [-t FONT] [-s SCALE] [FILE]...
Use pandoc and exemd to convert the markdown FILE to pdf.

    -h          display this help and exit
    -t FONT     specify font name (use quotes)
    -s SCALE    specify font size (rational numbers, default 1.0)
    -m          use the memoir package
EOF
}

# Initialize our own variables:
use_memoir=0
verbose=0
fontsize=10pt
scalemain=1.0

OPTIND=1 # Reset is necessary if getopts was used previously in the script.  It is a good idea to make this local in a function.

mainfont="Palatino Linotype"

while getopts "hmt:s:" opt; do
    case "$opt" in
        h)
            show_help
            exit 0
            ;;
        m)  use_memoir=$((use_memoir+1))
            ;;
		t)  mainfont=$OPTARG
			;;
		s)  scalemain=$OPTARG
			;;
        '?')
            show_help >&2
            exit 1
            ;;
    esac
done
shift "$((OPTIND-1))" # Shift off the options and optional --.

theclass="article"
if [ "$use_memoir" -ne 0 ]; then
	theclass="memoir";
fi
   
fullfile="$@"
filename=$(basename "$fullfile")
extension="${filename##*.}"
filename="${filename%.*}"

srcdir=`dirname $0`
srcdir=`cd $srcdir; pwd`
dstdir=`pwd`

paper=a4paper
hmargin=3cm
vmargin=3.5cm
#fontsize=11pt
#fontsize=12pt

sansfont=Corbel
monofont="Hasklig Medium"
# mainfont=Georgia
# sansfont=Verdana
# monofont="Courier New"
language=english
#language=swedish
nohyphenation=false
linespread=1.05

columns=onecolumn
#columns=twocolumn

geometry=portrait
#geometry=landscape

#alignment=flushleft
#alignment=flushright
#alignment=center


$srcdir/../lib/node_modules/md2pdf/node_modules/.bin/exemd -p "$fullfile" | pandoc -f markdown+implicit_figures --latex-engine=xelatex --template="${srcdir}/../lib/node_modules/md2pdf/bin/xetex.template" \
-V language=$language -V paper=$paper -V hmargin=$hmargin -V vmargin=$vmargin \
-V mainfont="$mainfont" -V sansfont="$sansfont" -V monofont="$monofont" \
-V geometry=$geometry -V alignment=$alignment -V columns=$columns \
-V fontsize=$fontsize -V nohyphenation=$nohyphenation \
-V toc=$toc \
-V theclass=$theclass \
-V scalemain=$scalemain \
-V linespread=$linespread \
-o $filename.pdf
