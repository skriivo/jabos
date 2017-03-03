$errors = Get-EventLog -LogName Application -EntryType ERROR -After ((get-date).addminutes(-5))
$errorsfiltered = $errors | Where-Object {$_.Message -like "*<VALUE>*"}

	if ($errorsfiltered.count -gt 1)
		{
			$status = 2
			$statustxt = "Error"
		}
	elseif ($errorsfiltered.count -eq 1 )
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
		Write-Host "$($status) LOGCHECK - $($statustxt): No Errors Found"
		} 
	else
		{
		Write-Host "$($status) LOGCHECK - $($statustxt): $($errorsfiltered.count) CRITICAL errors found"
		}