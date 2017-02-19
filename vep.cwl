#!/usr/bin/env cwl-runner

class: CommandLineTool

cwlVersion: v1.0

baseCommand: []
arguments: [-u, '0']

requirements:
  - class: InlineJavascriptRequirement
  - class: DockerRequirement
    dockerImageId: andrewjesaitis/vep

inputs:
  assembly:
    type: string
    inputBinding:
      position: 1
      prefix: "--assembly"
  vep_config:
    type: File
    inputBinding:
      position: 1
      prefix: "--config"
  input_vcf:
    type: File
    inputBinding:
      position: 2
      prefix: "--input_file"
    doc: VCF file to ann\otate

outputs:
  output:
    type: stdout

stdout: $(inputs.assembly + '-output.vcf')
