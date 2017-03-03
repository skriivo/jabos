Get-MessageTrackingLog -Start "01/01/2015 09:00:00" -End "01/01/2015 10:00:00" -EventId Receive -ResultSize unlimited | where { $_.Recipients -match "<SOMEVALUE>" } | Select Timestamp,sender,@{Name=’recipients‘;Expression={[string]::join(“;”, ($_.recipients))}},messagesubject | export-csv <Somedirectory>/file.csv