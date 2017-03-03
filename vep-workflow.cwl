#!/usr/bin/env cwl-runner

class: Workflow

cwlVersion: v1.0

inputs:
  assembly:
    type: string
  gzipfile:
    type: File
  vep_config:
    type: File
  outputname:
    type: string

outputs:
  outfile:
    type: File
    outputSource: vep/output

steps:

  gunzip:
    run: gunzip.cwl
    in:
      gzipfile: gzipfile
    out: [unzipped_vcf]

  vep:
    run: vep.cwl
    in:
      input_vcf: gunzip/unzipped_vcf #cut/trimmed_vcf
      vep_config: vep_config
      assembly: assembly
      outputname: outputname
    out: [output]

doc: |
  Annotate variants provided in a gziped VCF using SnpEff
