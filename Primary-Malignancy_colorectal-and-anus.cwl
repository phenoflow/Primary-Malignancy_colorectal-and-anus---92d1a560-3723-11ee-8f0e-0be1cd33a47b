cwlVersion: v1.0
steps:
  read-potential-cases-disc:
    run: read-potential-cases-disc.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
      potentialCases:
        id: potentialCases
        source: potentialCases
  primary-malignancy_colorectal-and-anus-colon---primary:
    run: primary-malignancy_colorectal-and-anus-colon---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-disc/output
  primary-malignancy_colorectal-and-anus-flexure---primary:
    run: primary-malignancy_colorectal-and-anus-flexure---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: primary-malignancy_colorectal-and-anus-colon---primary/output
  rectosigmoid-primary-malignancy_colorectal-and-anus---primary:
    run: rectosigmoid-primary-malignancy_colorectal-and-anus---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: primary-malignancy_colorectal-and-anus-flexure---primary/output
  primary-malignancy_colorectal-and-anus-caecum---primary:
    run: primary-malignancy_colorectal-and-anus-caecum---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: rectosigmoid-primary-malignancy_colorectal-and-anus---primary/output
  primary-malignancy_colorectal-and-anus-neoplasm---primary:
    run: primary-malignancy_colorectal-and-anus-neoplasm---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: primary-malignancy_colorectal-and-anus-caecum---primary/output
  primary-malignancy_colorectal-and-anus-cancer---primary:
    run: primary-malignancy_colorectal-and-anus-cancer---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: primary-malignancy_colorectal-and-anus-neoplasm---primary/output
  other-primary-malignancy_colorectal-and-anus---primary:
    run: other-primary-malignancy_colorectal-and-anus---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: primary-malignancy_colorectal-and-anus-cancer---primary/output
  primary-malignancy_colorectal-and-anus-rectum---primary:
    run: primary-malignancy_colorectal-and-anus-rectum---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: other-primary-malignancy_colorectal-and-anus---primary/output
  primary-malignancy_colorectal-and-anus-carcinoma---primary:
    run: primary-malignancy_colorectal-and-anus-carcinoma---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: primary-malignancy_colorectal-and-anus-rectum---primary/output
  primary-malignancy_colorectal-and-anus-history---primary:
    run: primary-malignancy_colorectal-and-anus-history---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: primary-malignancy_colorectal-and-anus-carcinoma---primary/output
  anus---primary:
    run: anus---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule12
      potentialCases:
        id: potentialCases
        source: primary-malignancy_colorectal-and-anus-history---primary/output
  primary-malignancy_colorectal-and-anus-neoplasm---secondary:
    run: primary-malignancy_colorectal-and-anus-neoplasm---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule13
      potentialCases:
        id: potentialCases
        source: anus---primary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule14
      potentialCases:
        id: potentialCases
        source: primary-malignancy_colorectal-and-anus-neoplasm---secondary/output
class: Workflow
inputs:
  potentialCases:
    id: potentialCases
    doc: Input of potential cases for processing
    type: File
  inputModule1:
    id: inputModule1
    doc: Python implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
  inputModule12:
    id: inputModule12
    doc: Python implementation unit
    type: File
  inputModule13:
    id: inputModule13
    doc: Python implementation unit
    type: File
  inputModule14:
    id: inputModule14
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
