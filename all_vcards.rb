#!/usr/bin/env ruby19

# get a list of vcf files without the "." and ".."
print Dir.entries(".").drop(2).reject{|c| !c.end_with? ".vcf"}.join(" ")
