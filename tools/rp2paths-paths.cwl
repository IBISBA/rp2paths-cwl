#!/usr/bin/env cwl-runner
# This tool description was generated automatically by argparse2tool ver. 0.4.5
# To generate again: $ RP2paths.py --generate_cwl_tool
# Help: $ RP2paths.py --help_arg2cwl

cwlVersion: v1.0

class: CommandLineTool
baseCommand: ['RP2paths.py', 'paths']

doc: |
  Computing each possible pathways according to a enumerated             EFMs

inputs:
  
  outdir:
    type: ["null", string]
    default: /home/stain/src/rp2paths/
    doc: Folder to put all results
    inputBinding:
      prefix: --outdir 

  maxsteps:
    type: ["null", int]
    default: 10
    doc: cutoff on the maximum number of steps in a pathways
    inputBinding:
      prefix: --maxsteps 

  maxpaths:
    type: ["null", int]
    default: 150
    doc: cutoff on the maximum number of pathways
    inputBinding:
      prefix: --maxpaths 

  timeout:
    type: ["null", int]
    default: 900
    doc: Timeout before killing a process (in s)
    inputBinding:
      prefix: --timeout 

  reverse:
    type: ["null", boolean]
    default: True
    doc: Consider reactions in the reverse direction
    inputBinding:
      prefix: -r 

  unfold_compounds:
    type: ["null", boolean]
    default: False
    doc: Unfold pathways based on equivalencie of compounds (can lead to combinatorial explosion).
    inputBinding:
      prefix: --unfold_compounds 

  target:
    type: ["null", string]
    default: TARGET_0000000001
    doc: Target compound internal ID. This internal ID specifies which compound should be considered as the targeted compound. The default behavior is to consider as the target the first compound used as a source compound in a first iteration of a metabolic exploration. Let this value as it is except if you know what you are doing.
    inputBinding:
      prefix: --target 


outputs:
    []
