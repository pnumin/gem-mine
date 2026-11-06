# Builds index.html (a full HTML document for GitHub Pages) from gem-mine.html.
# gem-mine.html stays a page fragment so it can also be published as a Claude artifact.
# Run after every change to gem-mine.html:  powershell -File build-pages.ps1
$root = $PSScriptRoot
$body = [IO.File]::ReadAllText((Join-Path $root 'gem-mine.html'), [Text.Encoding]::UTF8)
$head = @'
<!doctype html>
<html lang="ko">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">
<!-- Generated from gem-mine.html by build-pages.ps1. Do not edit directly. -->

'@
$utf8NoBom = New-Object Text.UTF8Encoding $false
[IO.File]::WriteAllText((Join-Path $root 'index.html'), ($head + $body + "`n</html>`n"), $utf8NoBom)
Write-Output 'index.html updated'
