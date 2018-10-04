#!/usr/bin/env cwl-runner
# This tool description was generated automatically by argparse2tool ver. 0.4.5
# To generate again: $ RP2paths.py --generate_cwl_tool
# Help: $ RP2paths.py --help_arg2cwl

cwlVersion: v1.0

class: CommandLineTool
baseCommand: ['RP2paths.py', 'scope']

doc: |
  Computing the scope leading to a given compounds

inputs:
  
  outdir:
    type: ["null", string]
    default: /home/stain/src/rp2paths/
    doc: Folder to put all results
    inputBinding:
      prefix: --outdir 

  minDepth:
    type: ["null", boolean]
    default: False
    doc: Use minimal depth scope, i.e. stop the scope computation as as soon an a first minimal path linking target to sink is found (default - False).
    inputBinding:
      prefix: --minDepth 

  target:
    type: ["null", string]
    default: TARGET_0000000001
    doc: Target compound internal ID. This internal ID specifies which compound should be considered as the targeted compound. The default behavior is to consider as the target the first compound used as a source compound in a first iteration of a metabolic exploration. Let this value as it is except if you know what you are doing.
    inputBinding:
      prefix: --target 

  customsinkfile:
    type: ["null", string]
    doc: User-defined sink file, i.e. file listing compounds to consider as sink compounds. Sink compounds should be provided by their IDs, as used in the reaction.erxn file. If no file is provided then the sink file generated during the "convert" task is used (default behavior). If a file is provided then **only** comppounds listed in this file will be used.
    inputBinding:
      prefix: --customsinkfile 


outputs:
    []
