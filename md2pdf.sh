#!/bin/sh

#function get_abs_path {
#    dir=$(cd `dirname $1` >/dev/null; pwd )
#    echo $dir
#}
#
#abs=`get_abs_path ./deploy/static`
#echo $abs
#
#
# Split filenames..
#
fullfile=$1
filename=$(basename "$fullfile")
extension="${filename##*.}"
filename="${filename%.*}"

srcdir=`dirname $0`
srcdir=`cd $srcdir; pwd`
dstdir=`pwd`

paper=a4paper
hmargin=3cm
vmargin=3.5cm
fontsize=10pt
#fontsize=11pt
#fontsize=12pt

mainfont="Palatino Linotype"
sansfont=Corbel
monofont=Consolas
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

pandoc -f markdown+lhs --latex-engine=xelatex --template="${srcdir}/../lib/node_modules/md2pdf/bin/xetex.template" \
-V language=$language -V paper=$paper -V hmargin=$hmargin -V vmargin=$vmargin \
-V mainfont="$mainfont" -V sansfont="$sansfont" -V monofont="$monofont" \
-V geometry=$geometry -V alignment=$alignment -V columns=$columns \
-V fontsize=$fontsize -V nohyphenation=$nohyphenation \
-V toc=$toc \
$fullfile \
-o $filename.pdf

