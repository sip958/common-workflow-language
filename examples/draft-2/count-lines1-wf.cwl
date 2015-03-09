#!/usr/bin/env cwl-runner
{
    "@context": "https://raw.githubusercontent.com/common-workflow-language/common-workflow-language/master/schemas/draft-2/cwl-context.json",
    "class": "Workflow",

    "inputs": [{
        "id": "#input_file",
        "type": "File"
    }],

    "outputs": [{
        "id": "#count_output",
        "type": "int",
        "connect": {"source": "#step2_output"}
    }]

    "steps": [
        {
            "id": "#step1",
            "impl": "wc-tool.json",
            "inputs": [{
                "def": "wc-tool.json#file1",
                "connect": {"source": "#input_file"}
            }],
            "outputs": [{
                "def": "wc-tool.json#output",
                "id": "#step1_output"
            }]
        },
        {
            "id": "#step2",
            "impl": "parseInt-tool.json",
            "inputs": [{
                "def": "parseInt-tool.json#file1",
                "connect": {"source": "#step1_output"}
            }],
            "outputs": [{
                "def": "parseInt-tool.json#output",
                "id": "#step2_output"
            }]
        }
    ]
}