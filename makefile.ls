#!/usr/bin/env lsc

{ simple-make, wmake, all, x, hooks, plugins} = require 'wmake'


plugins.copy-extension \sh, (path-system) -> 
  "#{path-system.server-dir}/bin"

plugins.copy-extension \template, (path-system) -> 
  "#{path-system.server-dir}/bin" 

files = [ { name: "./md2pdf.sh",   type: \sh } 
          { name: "./xetex.template", type: \template } ]

wmake({deploy-dir: ".", local-server-dir: "."}, { other: files} )