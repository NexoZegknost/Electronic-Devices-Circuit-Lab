# Đóng gói bài nộp: chạy trong PowerShell tại thư mục gốc (Report)
#   powershell -ExecutionPolicy Bypass -File tools\pack.ps1
# Yêu cầu: đã chạy `latexmk` để có các PDF trong build\
param([string]$Name = "MSSV1_MSSV2_MSSV3_Project3")

$out = "submit\$Name"
Remove-Item -Recurse -Force $out -ErrorAction SilentlyContinue
New-Item -ItemType Directory -Force "$out\01_LabManual","$out\02_Solutions","$out\04_OfflineInstall","$out\05_Report" | Out-Null

# 1. Tài liệu thực hành: PDF + file nguồn LaTeX
Copy-Item build\manual.pdf "$out\01_LabManual\CO2037_LTspice_LabManual.pdf"
Compress-Archive -Force -Path manual.tex,solutions.tex,install_guide.tex,report.tex,latexmkrc,shared,labs,install,appendix,report,images -DestinationPath "$out\01_LabManual\LabManual_source.zip"
# 2. Lời giải
Copy-Item build\solutions.pdf "$out\02_Solutions\CO2037_LTspice_Solutions.pdf"
# 3. File mô phỏng
Compress-Archive -Force -Path ltspice\* -DestinationPath "$out\03_LTspice.zip"
# 4. Hướng dẫn cài đặt offline
Copy-Item build\install_guide.pdf "$out\04_OfflineInstall\LTspice_Offline_Install_Guide.pdf"
# 5. Báo cáo (.pdf + .docx)
Copy-Item build\report.pdf "$out\05_Report\Project3_Report.pdf"
if (Test-Path report\Project3_Report.docx) { Copy-Item report\Project3_Report.docx "$out\05_Report\" } else { Write-Warning "Thiếu report\Project3_Report.docx" }

Compress-Archive -Force -Path "$out\*" -DestinationPath "submit\$Name.zip"
Write-Host "Done: submit\$Name.zip"
