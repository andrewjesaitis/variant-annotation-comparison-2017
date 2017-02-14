#!/usr/bin/env cwl-runner

class: CommandLineTool

cwlVersion: v1.0

baseCommand: [-t]

requirements:
  - class: InlineJavascriptRequirement
  - class: DockerRequirement
    dockerImageId: andrewjesaitis/snpeff-complete

inputs:
  genome:
    type: string
    inputBinding:
      position: 1
  input_vcf:
    type: File
    inputBinding:
      position: 2
    doc: VCF file to ann\otate

outputs:
  output:
    type: stdout

stdout: $(inputs.genome + '-output.vcf')
