#!/bin/sh

show_help() {
cat << EOF
Usage: ${0##*/} [-ahmnqu] [-t FONT] [-s SCALE] [-l SPREAD] [-p LENGTH] [-i LENGTH] [FILE]...
Use pandoc and exemd to convert the markdown FILE to pdf.

    -h            display this help and exit
    -t FONT       specify font name (use quotes)
    -s SCALE      specify font size (rational numbers, default 1.0)
    -l SPREAD     specify line spread (rational, default 1.05)
    -x HEIGHT     specify maximum figure height (rational, default 0.9 of textheight)
    -p LENGTH     absolute distance between paragraphs (with unit, default '\\baselineskip')
    -i LENGTH     paragraph indent (default 12pt)
    -n            monofont as mainfont
    -q            intepret quotes as centered text
    -u            emphasis as underline
    -m            use the memoir package
    -e            output tex
    -a            use administrative config settings (Times new roman, verbatim main, emph as underline)
EOF
}

# Initialize our own variables:
use_memoir=0
verbose=0
fontsize=10pt
scalemain=1.0
scalemono=1.0
linespread=1.05
maxheight=0.9
centerquotes=0
parskip="\\baselineskip"
parindent="0pt"
monoasmain=0
underline=0
ext="pdf"

OPTIND=1 # Reset is necessary if getopts was used previously in the script.  It is a good idea to make this local in a function.

mainfont="Palatino Linotype"

while getopts "ahmnequt:s:l:x:p:i:" opt; do
    case "$opt" in
    h) show_help
       exit 0
       ;;

    m)  use_memoir=$((use_memoir+1))
        ;;

    n)  monoasmain=$((monoasmain+1))
        ;;

    u)  underline=$((underline+1))
        ;;

    q)  centerquotes=$((centerquotes+1))
        ;;

    e)  ext="tex"
        ;;

    a)  mainfont="Times New Roman"
        monoasmain=1
        underline=1
        scalemain=1.2
        linespread=1.2
        centerquotes=1
        ;;

    t)  mainfont=$OPTARG
        ;;

    p)  parskip=$OPTARG
        ;;

    i)  parindent=$OPTARG
        ;;

    s)  scalemain=$OPTARG
        ;;

    l)  linespread=$OPTARG
        ;;

    x)  maxheight=$OPTARG
        ;;

    '?') show_help >&2
         exit 1
         ;;

    esac
done
shift "$((OPTIND-1))" # Shift off the options and optional --.

sansfont=Corbel
monofont="Hasklig Medium"
theclass="article"

if [ "$use_memoir" -ne 0 ]; then
  theclass="memoir";
fi

if [ "$monoasmain" -ne 0 ]; then
    monofont="$mainfont";
    scalemono="$scalemain";
fi

fullfile="$@"
filename=$(basename "$fullfile")
extension="${filename##*.}"
filename="${filename%.*}"

srcdir=`dirname $0`
srcdir=`cd $srcdir; pwd`
dstdir=`pwd`

paper=a4paper
twidth=6in
theight=8in
#fontsize=11pt
#fontsize=12pt

# mainfont=Georgia
# sansfont=Verdana
# monofont="Courier New"
language=english
#language=swedish
nohyphenation=false

columns=onecolumn
#columns=twocolumn

geometry=portrait
#geometry=landscape

#alignment=flushleft
#alignment=flushright
#alignment=center


$srcdir/../lib/node_modules/md2pdf/node_modules/.bin/exemd -p "$fullfile" | pandoc -f markdown+implicit_figures --latex-engine=xelatex --template="${srcdir}/../lib/node_modules/md2pdf/bin/xetex.template" \
-V language=$language -V paper=$paper -V twidth=$twidth -V theight=$theight \
-V mainfont="$mainfont" -V sansfont="$sansfont" -V monofont="$monofont" \
-V geometry=$geometry -V alignment=$alignment -V columns=$columns \
-V fontsize=$fontsize -V nohyphenation=$nohyphenation \
-V toc=$toc \
-V theclass=$theclass \
-V scalemain=$scalemain \
-V scalemono=$scalemono \
-V linespread=$linespread \
-V maxheight=$maxheight \
-V centerquotes=$centerquotes \
-V parskip=$parskip \
-V parindent=$parindent \
-o $filename.$ext
