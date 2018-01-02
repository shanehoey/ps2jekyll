# ps2jekyll

## About

A simple script that will document a PowerShell module and turn each function into a Markdown file that can then be uploaded to a Jekyll website. 

This script is purpose built to generate Markdown files compatible with Jekyll only. If you require a more flexible script try [psdoc](https://github.com/ChaseFlorell/psDoc/) instead

For an example of the output of this script in Jekyll visit [worddoc docs](https://shanehoey.github.io/worddoc/docs/)

## Examples

### ------------------------------Example------------------------------

``` 
import-module WordDoc 
.\ps2jekyll\ps2Jekyll.ps1 -Module WordDoc -ModulePath .\worddoc\WordDoc\WordDoc.psm1 -outputpath .\worddoc\docs\_docs\
```

## Credits

[psdoc](https://github.com/ChaseFlorell/psDoc/) by Chase Florell. I use this script when I need a more flexible script than this one to create HTML or Markdown. 
