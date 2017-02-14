cwlVersion: v1.0

class: CommandLineTool

baseCommand: [wget]

inputs:
  url:
    type: string
    inputBinding:
      position: 1

outputs:
  gzipfile:
    type: File
    outputBinding:
      glob: "*.gz"

