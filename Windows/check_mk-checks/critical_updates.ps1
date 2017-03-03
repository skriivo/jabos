#Get All Assigned updates in $SearchResult
$UpdateSession = New-Object -ComObject Microsoft.Update.Session
$UpdateSearcher = $UpdateSession.CreateUpdateSearcher()
$SearchResult = $UpdateSearcher.Search("IsAssigned=1 and IsHidden=0 and IsInstalled=0")


#Matrix Results for type of updates that are needed
$Critical = $SearchResult.updates | where { $_.MsrcSeverity -eq "Critical" }
$important = $SearchResult.updates | where { $_.MsrcSeverity -eq "Important" }
$other = $SearchResult.updates | where { $_.MsrcSeverity -eq $null }

#Write Results
#Write-Host "total=$($SearchResult.updates.count)"
#Write-Host "critical=$($Critical.count)"
#Write-Host "important=$($Important.count)"
#Write-Host "other=$($other.count)"

	if ($Critical.count -gt 10)
		{
		$status = 2
		$statustxt = "CRITICAL"
		}
	elseif ($Critical.count -gt 2)
		{
		   $status = 1
		   $statustxt = "WARNING"
		}
	else
		{
		   $status = 0
		   $statustxt = "OK"
		}

	if ($Critical.count -eq $null)
		{
		Write-Host "$($status) CRIT_UPDATES - $($statustxt): No Critical Update(s) found out of $($SearchResult.updates.count) Update(s)"
		} 
	else
		{
		Write-Host "$($status) CRIT_UPDATES - $($statustxt): $($Critical.count) Critical Update(s) found out of $($SearchResult.updates.count) Update(s)"
		}