#!/usr/bin/env cwl-runner

class: Workflow

cwlVersion: v1.0

inputs:
  genome:
    type: string
  gzipfile:
    type: File
  outputname:
    type: string

outputs:
  outfile:
    type: File
    outputSource: snpeff/output

steps:
  gunzip:
    run: gunzip.cwl
    in:
      gzipfile: gzipfile
    out: [unzipped_vcf]

  snpeff:
    run: snpeff.cwl
    in:
      input_vcf:  gunzip/unzipped_vcf
      genome: genome
      outputname: outputname
    out: [output]

doc: |
  Annotate variants provided in a gziped VCF using SnpEff
