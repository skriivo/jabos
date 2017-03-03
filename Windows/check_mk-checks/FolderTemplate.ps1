#Set date limit
$limit = (get-date).adddays(-30)

#Set the folder
$folder = 'C:\$Recycle.Bin'

#Action 
GCI $folder -Recurse -Force | where { ! $_.PSIsContainer -and $_.Creationtime -le $limit } 
