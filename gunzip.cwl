cwlVersion: v1.0

class: CommandLineTool

baseCommand: [gunzip, -c]

inputs:
  gzipfile:
    type: File
    inputBinding:
      position: 1

outputs:
  unzipped_vcf:
    type: stdout

stdout: unzipped.vcf