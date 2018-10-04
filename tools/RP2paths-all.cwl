#!/usr/bin/env cwl-runner
# This tool description was generated automatically by argparse2tool ver. 0.4.5
# To generate again: $ RP2paths.py --generate_cwl_tool
# Help: $ RP2paths.py --help_arg2cwl

cwlVersion: v1.0

class: CommandLineTool
baseCommand: ['RP2paths.py', 'all']

doc: |
  Compute the full workflow

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

  minDepth:
    type: ["null", boolean]
    default: False
    doc: Use minimal depth scope, i.e. stop the scope computation as as soon an a first minimal path linking target to sink is found (default - False).
    inputBinding:
      prefix: --minDepth 

  customsinkfile:
    type: ["null", string]
    doc: User-defined sink file, i.e. file listing compounds to consider as sink compounds. Sink compounds should be provided by their IDs, as used in the reaction.erxn file. If no file is provided then the sink file generated during the "convert" task is used (default behavior). If a file is provided then **only** comppounds listed in this file will be used.
    inputBinding:
      prefix: --customsinkfile 

  ebin:
    type: ["null", string]
    default: /home/stain/src/rp2paths/efmtool/launch_efm.sh
    doc: Path to the binary that enumerate the EFMs
    inputBinding:
      prefix: --ebin 

  timeout:
    type: ["null", int]
    default: 900
    doc: Timeout before killing a process (in s)
    inputBinding:
      prefix: --timeout 

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

  unfold_compounds:
    type: ["null", boolean]
    default: False
    doc: Unfold pathways based on equivalencie of compounds (can lead to combinatorial explosion).
    inputBinding:
      prefix: --unfold_compounds 

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

  cmpdnamefile:
    type: ["null", string]
    default: /home/stain/src/rp2paths/mnx-data/mnx-compounds-name.tsv
    doc: File with name of compounds.
    inputBinding:
      prefix: --cmpdnamefile 

  target:
    type: ["null", string]
    default: TARGET_0000000001
    doc: Target compound internal ID. This internal ID specifies which compound should be considered as the targeted compound. The default behavior is to consider as the target the first compound used as a source compound in a first iteration of a metabolic exploration. Let this value as it is except if you know what you are doing.
    inputBinding:
      prefix: --target 


outputs:
    []
