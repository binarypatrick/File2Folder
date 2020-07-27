Get-ChildItem -file | foreach-object {
	$date = $_.LastWriteTime | Get-Date -f "yyyyMMdd_HHmmss"
	$extension = $_.Extension.ToLower()
	$name = $date
	$sequence = 2;

	if (!($_.BaseName -eq $name)) {
		while (Test-Path -Path "$name$extension") {
			$name = "$date-$sequence"
			$sequence++
		}

		$_ | Rename-Item -NewName "$name$extension"
	}
}