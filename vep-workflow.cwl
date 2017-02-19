#!/usr/bin/env cwl-runner

class: Workflow

cwlVersion: v1.0

inputs:
  assembly:
    type: string
  # url:
  #   type: string
  #   doc: url of 1kg file
  gzipfile:
    type: File
  vep_config:
    type: File

outputs:
  outfile:
    type: File
    outputSource: vep/output

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

  vep:
    run: vep.cwl
    in:
      input_vcf: cut/trimmed_vcf
      vep_config: vep_config
      assembly: assembly
    out: [output]

doc: |
  Annotate variants provided in a gziped VCF using SnpEff
