# ps2jekyll

## About

A simple script that will document a PowerShell module and turn each function into a Markdown file that can then be uploaded to a Jekyll website. 

This script is purpose built to generate Markdown files compatible with Jekyll websites only. If you require a more flexible script try [psdoc](https://github.com/ChaseFlorell/psDoc/) by Chase Florell instead.

For an example of the output of this script on a Jekyll website visit [worddoc docs](https://shanehoey.github.io/worddoc/docs)

## Examples

### ------------------------------Example------------------------------

Manually specify the .psd1 file to load and the output path.

``` 
.\ps2jekyll\ps2Jekyll.ps1 -Module WordDoc -ModulePath .\worddoc\WordDoc\WordDoc.psd1 -outputpath .\worddoc\docs\_docs\
```

### ------------------------------Example------------------------------

Specify the module name and the output path.

``` 
.\ps2jekyll\ps2Jekyll.ps1 -Module WordDoc -outputpath .\worddoc\docs\_docs\
```

## Credits

[psdoc](https://github.com/ChaseFlorell/psDoc/) by Chase Florell. I use this script when I need a more flexible script than this one to create HTML or Markdown. 
