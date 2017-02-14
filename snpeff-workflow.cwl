#!/usr/bin/env cwl-runner

class: Workflow

cwlVersion: v1.0

inputs:
  genome:
    type: string
  # url:
  #   type: string
  #   doc: url of 1kg file
  gzipfile:
    type: File

outputs:
  outfile:
    type: File
    outputSource: snpeff/output

steps:
  # download:
  #   run: download.cwl
  #   in:
  #     url: url
  #   out: [gzipfile]

  gunzip:
    run: gunzip.cwl
    in:
      gzipfile: gzipfile
    #  gzipfile: download/gzipfile
    out: [unzipped_vcf]

  cut:
    run: cut.cwl
    in:
      input_vcf: gunzip/unzipped_vcf
    out: [trimmed_vcf]

  snpeff:
    run: snpeff.cwl
    in:
      input_vcf: cut/trimmed_vcf
      genome: genome
    out: [output]

doc: |
  Annotate variants provided in a gziped VCF using SnpEff
