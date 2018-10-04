#!/usr/bin/env cwl-runner
# This tool description was generated automatically by argparse2tool ver. 0.4.5
# To generate again: $ RP2paths.py --generate_cwl_tool
# Help: $ RP2paths.py --help_arg2cwl

cwlVersion: v1.0

class: CommandLineTool
baseCommand: ['RP2paths.py', 'efm']

doc: |
  Enumerating EFMs according to a computed scope

inputs:
  
  outdir:
    type: ["null", string]
    default: /home/stain/src/rp2paths/
    doc: Folder to put all results
    inputBinding:
      prefix: --outdir 

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

  target:
    type: ["null", string]
    default: TARGET_0000000001
    doc: Target compound internal ID. This internal ID specifies which compound should be considered as the targeted compound. The default behavior is to consider as the target the first compound used as a source compound in a first iteration of a metabolic exploration. Let this value as it is except if you know what you are doing.
    inputBinding:
      prefix: --target 


outputs:
    []
