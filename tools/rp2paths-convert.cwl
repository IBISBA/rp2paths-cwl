#!/usr/bin/env cwl-runner
# This tool description was generated automatically by argparse2tool ver. 0.4.5
# To generate again: $ RP2paths.py --generate_cwl_tool
# Help: $ RP2paths.py --help_arg2cwl

cwlVersion: v1.0

class: CommandLineTool
baseCommand: ['RP2paths.py', 'convert']

doc: |
  Format the output of the RetroPath2.0 workflow into a             format usable by the stoichiometry code

inputs:
  
  infile:
    type: string

    doc: File outputed by the RetroPath2.0 Knime workflow
    inputBinding:
      position: 1

  outdir:
    type: ["null", string]
    default: /home/stain/src/rp2paths/
    doc: Folder to put all results
    inputBinding:
      prefix: --outdir 

  reverse:
    type: ["null", boolean]
    default: True
    doc: Consider reactions in the reverse direction
    inputBinding:
      prefix: -r 


outputs:
    []
