cwlVersion: v1.0
class: CommandLineTool
baseCommand: [cut, -f, 1-9]
inputs:
  input_vcf:
    type: File
    inputBinding:
      position: 1
outputs:
  trimmed_vcf:
    type: File
    outputBinding:
      glob: out.vcf

stdout: out.vcf