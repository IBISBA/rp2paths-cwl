#!/usr/bin/env cwl-runner
# This tool description was generated automatically by argparse2tool ver. 0.4.5
# To generate again: $ RP2paths.py --generate_cwl_tool
# Help: $ RP2paths.py --help_arg2cwl

cwlVersion: v1.0

class: CommandLineTool
baseCommand: ['RP2paths.py', 'filter']

doc: |
  Filter out unwanted pathways

inputs:
  
  outdir:
    type: string
    default: /home/stain/src/rp2paths/
    doc: Folder to put all results
    inputBinding:
      prefix: --outdir 

  customsinkfile:
    type: string
    doc: User-defined sink file, i.e. file listing compounds to consider as sink compounds. Sink compounds should be provided by their IDs, as used in the reaction.erxn file. If no file is provided then the sink file generated during the "convert" task is used (default behavior). If a file is provided then **only** comppounds listed in this file will be used.
    inputBinding:
      prefix: --customsinkfile 

  onlyPathsStartingBy:
    type:
    - type: array
      items: string

    doc: List of compounds IDs to consider. If specified, only paths making use of at least one of these compounds as initial substrate (first step of a pathway) are kept.
    inputBinding:
      prefix: --onlyPathsStartingBy 

  notPathsStartingBy:
    type:
    - type: array
      items: string

    doc: List of compounds IDs. If specifed, paths making use of one of these compounds as unique initial substrate will be filtered out
    inputBinding:
      prefix: --notPathsStartingBy 


outputs:
    []
