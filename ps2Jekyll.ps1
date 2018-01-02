param(
    [Parameter(Mandatory=$True,ParameterSetName="Module")]
    $Module,
    [Parameter(Mandatory=$False,ParameterSetName="Module")]
    $ModulePath,
    [Parameter(Mandatory=$True,ParameterSetName="Script")]
    $Script,
    [Parameter(Mandatory=$True,ParameterSetName="Module")]
    [Parameter(Mandatory=$True,ParameterSetName="Script")]
    $outputpath
    ) 

#Example 
#.\ps2jekyll\ps2Jekyll.ps1 -Module WordDoc -ModulePath .\worddoc\WordDoc -outputpath .\worddoc\docs\_docs\

if($PSBoundParameters.ContainsKey("Module")) { 
    if($PSBoundParameters.ContainsKey("ModulePath")) { 
        remove-module -name $Module -ErrorAction SilentlyContinue -Verbose
        Import-module -name $ModulePath -ErrorAction SilentlyContinue -Verbose
    } else {
        remove-module -name $Module -ErrorAction SilentlyContinue -Verbose
        Import-module -name $Module -ErrorAction SilentlyContinue -Verbose
    }
}

$Items = (Get-command -Module $Module).foreach({get-help $_.name -full})
Write-Verbose "Converting Items $($Items.count)" -verbose
foreach ($item in $items) {
    Write-Verbose "Converting Items $($Item.name)" -verbose
    $md = @()
    $md += "---"
    $md += "title: ""$($item.name)"""
    $md += "excerpt: ""$($item.synopsis)"""
    $md += "category: ""help"""
    $md += "---"
    $md += ""
    $md += "# $($item.name)"
    $md += "**Module** $($item.ModuleName)"
    $md += ""
    $md += "## SYNOPSIS"
    $md += "$($item.Synopsis)"
    $md += ""
    $md += "## DESCRIPTION"
    $md += "$($item.description.text)"
    $md += ""
    $md += "## SYNTAX"
    foreach($i in $item.SYNTAX ) {
        $i
        $md += ""
        $md += '```'
        $md += (($i) | out-string).Trim()
        $md += '```'
        $md += ""
    }
    $md += ""
    $md += "## EXAMPLES"
    foreach($i in $item.examples.example ) {
        $md += "### $($i.title)"
        $md +=  $i.examples.example.remarks.text | Out-String
        $md += '```'
        $md += $($i.code) | Out-String
        $md += '```'
        $md += $($i.introduction.text) | Out-String
        $md += $($i.remarks) | Out-String
    }
    $md += "## PARAMETERS"
    foreach($i in $item.parameters.parameter ) {
        $md += "### -$($i.name)"
        $md += "$($i.description)"
        $md += ""
        $md += '```'
        $md += "Type $($i.type)"
        $md += "Parameter Sets: "
        $md += "Aliases: "
        $md += "Required: $($i.required)"
        $md += "Position: $($i.position)"
        $md += "Default Value:$($i.defaultvalue)"
        $md += "Accept pipeline input: $($i.pipelineinput)"
        $md += "Accept wildcard characters"
        #$i.globbing 
        #$i.name
        #$i.parametervalue
        $md += '```'
    }
    $md += "### CommonParameters"
    $md += "This function only supports -verbose"
    $md += "## INPUTS"
    $md += "## OUTPUTS"
    $md += "## NOTES"
    $md += "## RELATED LINKS"
    $md += "# $($item.name)"
    $filepath = join-path -path $outputpath -child "$($item.name).md"
    $md | Out-File -FilePath $filepath 
}

