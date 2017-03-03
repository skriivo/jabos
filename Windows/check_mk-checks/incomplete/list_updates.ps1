# initialize the com object
$wsus = New-Object -ComObject "Microsoft.update.Session"
 
# build an update searcher
$wsussearch = $wsus.createupdatesearcher()
 
# build a filter and get the result
$res = $wsussearch.search("IsInstalled=0")
 
# list title and severity of updates that are not yet installed
$res.updates | Select-Object title, msrcseverity 