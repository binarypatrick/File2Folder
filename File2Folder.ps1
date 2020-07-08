Get-ChildItem -file | foreach-object {
	$name = $_.Name
	$baseName = $_.BaseName

	if (!(Test-Path -Path $baseName)) {
		[void](New-Item -Path "./" -Name "./$baseName" -ItemType "directory")
	}

	if (!(Test-Path -Path "./$baseName/$name")) {
		Move-Item -Path "./$name" -Destination "./$baseName"
	}

	# Move-Item -Path 
}