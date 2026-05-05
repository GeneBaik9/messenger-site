# messenger-site 정적 파일 → Vultr 서버 배포.
# 실행: .\deploy.ps1
$ErrorActionPreference = 'Stop'
Write-Host "=== messenger-site → Vultr 배포 ===" -ForegroundColor Cyan
$repo = $PSScriptRoot
scp "$repo\index.html" vultr:/srv/messenger-site/
Write-Host "[OK] index.html 업로드 완료" -ForegroundColor Green
$resp = Invoke-WebRequest -Uri 'http://104.238.151.252/' -TimeoutSec 10
Write-Host "[verify] homepage http=$($resp.StatusCode), $($resp.Content.Length) bytes" -ForegroundColor Green
Write-Host ""
Write-Host "URL: http://104.238.151.252/" -ForegroundColor Cyan
