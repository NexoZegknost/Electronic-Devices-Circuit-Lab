# =====================================================================
#  ltspice_kit.ps1 -- hỗ trợ làm "LTspice Offline Kit" (chạy trên Windows)
#  Chưa chạy thử trong môi trường phát triển: nếu lỗi, gửi lại thông báo lỗi.
#
#  Bước A  (máy có Internet) Tải bộ cài + tính SHA-256:
#      powershell -ExecutionPolicy Bypass -File tools\ltspice_kit.ps1 -Download
#  Bước B  Cài LTspice BẰNG TAY (để chụp ảnh từng bước), mở LTspice 1 lần.
#  Bước C  Thu thập thông tin phiên bản + đường dẫn thư viện, đóng gói thư viện:
#      powershell -ExecutionPolicy Bypass -File tools\ltspice_kit.ps1 -Inspect
#  Kết quả: kit\INFO.txt, kit\SHA256.txt, kit\LTspice_lib\ (nếu -Inspect tìm thấy)
#  Gửi nội dung kit\INFO.txt để điền vào install\body.tex
# =====================================================================
param(
  [switch]$Download,
  [switch]$Inspect,
  [string]$Url = "https://ltspice.analog.com/software/LTspice64.msi",
  [string]$Kit = "kit"
)

New-Item -ItemType Directory -Force $Kit | Out-Null
$info = Join-Path $Kit "INFO.txt"

function Log($t) { Write-Host $t; Add-Content -Path $info -Value $t -Encoding UTF8 }

if ($Download) {
  $msi = Join-Path $Kit "LTspice64.msi"
  Log "== DOWNLOAD $(Get-Date -Format 'yyyy-MM-dd HH:mm')"
  Log "Source URL : $Url"
  try {
    Invoke-WebRequest -Uri $Url -OutFile $msi -UseBasicParsing
  } catch {
    Log "DOWNLOAD FAILED: $($_.Exception.Message)"
    Log "-> Tải thủ công từ https://www.analog.com/ltspice, lưu vào $Kit\LTspice64.msi rồi chạy lại -Download."
  }
  if (Test-Path $msi) {
    $h = Get-FileHash $msi -Algorithm SHA256
    $mb = [math]::Round((Get-Item $msi).Length / 1MB, 1)
    "$($h.Hash)  LTspice64.msi" | Set-Content (Join-Path $Kit "SHA256.txt")
    Log "File       : LTspice64.msi  ($mb MB)"
    Log "SHA-256    : $($h.Hash)"
    $sig = Get-AuthenticodeSignature $msi
    Log "Signature  : $($sig.Status) -- $($sig.SignerCertificate.Subject)"
  }
}

if ($Inspect) {
  Log "== INSPECT $(Get-Date -Format 'yyyy-MM-dd HH:mm')"
  Log "OS         : $((Get-CimInstance Win32_OperatingSystem).Caption) $((Get-CimInstance Win32_OperatingSystem).Version)"

  $exe = @(
    "$env:ProgramFiles\ADI\LTspice\LTspice.exe",
    "${env:ProgramFiles(x86)}\LTC\LTspiceXVII\XVIIx64.exe",
    "$env:LOCALAPPDATA\Programs\ADI\LTspice\LTspice.exe"
  ) | Where-Object { Test-Path $_ } | Select-Object -First 1
  if (-not $exe) {
    $exe = Get-ChildItem "$env:ProgramFiles","$env:LOCALAPPDATA\Programs" -Recurse -Filter "LTspice*.exe" -ErrorAction SilentlyContinue |
           Select-Object -First 1 -ExpandProperty FullName
  }
  if ($exe) {
    Log "LTspice exe: $exe"
    Log "Version    : $((Get-Item $exe).VersionInfo.FileVersion)  (đối chiếu với Help > About)"
  } else { Log "LTspice exe: KHÔNG TÌM THẤY -- đã cài chưa?" }

  # Tìm thư mục thư viện: chứa lib\cmp\standard.dio hoặc lib\sub
  $roots = @("$env:ProgramFiles\ADI","$env:LOCALAPPDATA\LTspice","$env:USERPROFILE\Documents\LTspiceXVII","$env:USERPROFILE\Documents\LTspice","$env:LOCALAPPDATA\Programs\ADI")
  $libs = @()
  foreach ($r in $roots) {
    if (Test-Path $r) {
      $libs += Get-ChildItem $r -Recurse -Filter "standard.dio" -ErrorAction SilentlyContinue |
               ForEach-Object { $_.Directory.Parent.FullName }
    }
  }
  $libs = $libs | Sort-Object -Unique
  if (-not $libs) { Log "Library    : KHÔNG TÌM THẤY standard.dio -- mở LTspice 1 lần (có mạng) để nó tải thư viện, rồi chạy lại." }
  foreach ($l in $libs) {
    $size = [math]::Round((Get-ChildItem $l -Recurse -File -ErrorAction SilentlyContinue | Measure-Object Length -Sum).Sum / 1MB, 1)
    Log "Library    : $l  ($size MB)"
    foreach ($sub in "cmp","sub","sym") {
      $p = Join-Path $l $sub
      if (Test-Path $p) { Log "   $sub : $((Get-ChildItem $p -Recurse -File | Measure-Object).Count) files" }
    }
  }
  foreach ($r in $roots) {
    $ex = Join-Path $r "examples"
    if (Test-Path $ex) { Log "Examples   : $ex  ($((Get-ChildItem $ex -Recurse -Filter *.asc | Measure-Object).Count) .asc files)" }
  }

  # Kiểm tra model dùng trong các lab
  foreach ($m in "1N4148","1N4007","2N3904","2N3906","2N2222","LT1001","UniversalOpAmp","LM358","4N25") {
    $hit = $false
    foreach ($l in $libs) {
      if (Select-String -Path (Join-Path $l "cmp\*"),(Join-Path $l "sub\*") -Pattern $m -SimpleMatch -Quiet -ErrorAction SilentlyContinue) { $hit = $true; break }
    }
    Log ("Model {0,-15}: {1}" -f $m, $(if ($hit) {"có trong thư viện"} else {"KHÔNG thấy"}))
  }

  # Đóng gói thư viện
  if ($libs) {
    $dst = Join-Path $Kit "LTspice_lib"
    Copy-Item -Recurse -Force $libs[0] $dst
    Log "Đã chép thư viện: $($libs[0]) -> $dst"
  }
  Log "Kết thúc. Gửi nội dung $info để điền hướng dẫn cài đặt."
}

if (-not $Download -and -not $Inspect) { Write-Host "Dùng -Download hoặc -Inspect (xem đầu file)." }
