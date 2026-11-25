# CO2037 – Dự án 3: Tài liệu thực hành LTspice (skeleton)

Bộ khung LaTeX cho **toàn bộ sản phẩm** của Dự án 3, dựng theo mẫu `Lab1`–`Lab4` của nhóm (XeLaTeX + latexmk, mỗi bài một file, ô dán ảnh tự hiện khi chưa có ảnh).

| Thành viên | MSSV | Phụ trách |
|---|---|---|
| Đỗ Việt Cường | 2510280 | Lab 1, Lab 2, Bảng ánh xạ, câu hỏi [1] [3] [5] [7] |
| Nguyễn Quốc Đạt | 2510287 | Lab 3, Lab 4, Biên tập – đóng gói, câu hỏi [4] [6] [8] |
| Nguyễn Huỳnh Hữu Đức | 2510290 | Lab 5, Lab 6, Hướng dẫn cài đặt, câu hỏi [2] [9] |

> Họ tên, MSSV, GVHD, lớp, phiên bản LTspice: sửa **một chỗ duy nhất** ở `shared/config.tex`.

## 1. Bốn tài liệu từ một nguồn

| File gốc | Sản phẩm | Ngôn ngữ | Ghi chú |
|---|---|---|---|
| `manual.tex` | (1) Lab Manual cho sinh viên | English | `\solutionfalse` → phần tính để trống, ô số liệu trống |
| `solutions.tex` | (2) Lời giải cho giảng viên | English | `\solutiontrue` → hiện lời giải, lý do đổi trạng thái, số liệu |
| `install_guide.tex` | (4) Hướng dẫn cài đặt offline | English | Cũng được chèn làm Appendix A của manual |
| `report.tex` | (5) Báo cáo dự án (mẫu Phần B) | Tiếng Việt | Đủ 12 mục, Bảng 5–15 |

Lab Manual và Solutions dùng **chung file bài tập** – viết lời giải một lần, không phải giữ hai bản.

## 2. Cấu trúc thư mục

```
Report/
├── manual.tex  solutions.tex  install_guide.tex  report.tex
├── latexmkrc                  XeLaTeX, kết quả vào build/
├── shared/
│   ├── config.tex             ← THÔNG TIN NHÓM (sửa ở đây)
│   ├── preamble.tex           gói, macro bài tập, ô dán ảnh, bảng so sánh
│   ├── cover.tex              trang bìa (SVTH: 3 thành viên – MSSV)
│   ├── preface.tex            "How to use this manual"
│   ├── output_common.tex      phần chung của mục Output Requirements
│   └── labs_all.tex           danh sách 6 lab
├── labs/
│   └── labN/                  (N = 1..6)
│       ├── lab.tex            khung chương: Introduction → LTspice Guide → Exercises → Advanced → Output Requirements
│       ├── intro.tex          Introduction
│       ├── guide.tex          LTspice Guide (các bước + ảnh)
│       ├── ex01.tex … ex10.tex
│       ├── adv01.tex  adv02.tex
│       ├── output.tex         Output Requirements: checklist đầu ra từng bài
│       └── images/
│           ├── guide/         stepNN_xxx.png  (ảnh thao tác)
│           ├── circuit/       exNN.png, advNN.png (schematic)
│           └── sim/           exNN_sim.png, advNN_sim.png (đồ thị/kết quả)
├── install/body.tex           nội dung hướng dẫn cài đặt
├── appendix/quickref.tex      bảng ánh xạ rút gọn (Appendix B)
├── report/sec00 … sec12       các mục của báo cáo Phần B
├── images/common/hcmut.png    logo
├── images/install/            ảnh cài đặt
├── ltspice/                   (3) file .asc: Lab1/Ex01.asc … Lab6/Adv02.asc, lib/
└── tools/pack.ps1             đóng gói 2510280_2510287_2510290_Project3.zip
```

## 3. Cách viết một bài tập (`labs/labN/exNN.tex`)

```latex
\exercise{Tiêu đề}{Keep|Adjust|Replace}{Bài gốc}   % nhãn trạng thái + tên file .asc tự sinh
\statusreason{Lý do đổi}                           % chỉ in trong bản lời giải
\task{Đề bài}
\circuitfig{ex03}{Chú thích}                       % -> images/circuit/ex03.png
\components{R1 = 1 kΩ, D1: 1N4148}
\answerspace{8}                                     % dòng chấm cho SV (ẩn ở bản lời giải)
\begin{solution} ...lời giải... \end{solution}     % chỉ hiện ở bản lời giải
\begin{spice} .op \end{spice}                       % khối lệnh SPICE
\simfig{ex03_sim}{Chú thích}                       % -> images/sim/ex03_sim.png
\begin{comparison}{Chú thích}
\cmprow{$V_o$}{V}{4.30}{4.27}{0.7}                 % SV thấy ô trống; GV thấy số
\end{comparison}
```

- Ảnh: lưu đúng tên file hiện trong **khung cam** → khung tự biến mất.
- `\todo{...}` hiện chữ đỏ. Khi nộp: đổi `\showtodotrue` → `\showtodofalse` trong `shared/preamble.tex`.
- Số liệu mô phỏng **chỉ** lấy từ lần chạy LTspice thật của nhóm.

## 4. Biên dịch

```
latexmk                     # build cả 4 PDF vào build/
latexmk manual.tex          # chỉ build 1 tài liệu
```
Cần TeX Live/MiKTeX có gói tiếng Việt (`babel-vietnamese`) như các lab trước.

## 5. Đóng gói nộp bài

```
powershell -ExecutionPolicy Bypass -File tools\pack.ps1 -Name 2510280_2510287_2510290_Project3
```

## 6. Báo cáo .docx

Đề yêu cầu báo cáo Phần B ở **.docx và .pdf**. Bản LaTeX (`report.tex`) dùng để soạn và xuất PDF; trước khi nộp cần thêm `report/Project3_Report.docx`:
- chuyển nội dung sang file Word mẫu Phần B của đề (khuyến nghị, giữ đúng mẫu GV), hoặc
- `pandoc report.tex -o report/Project3_Report.docx` rồi chỉnh lại định dạng.

## 7. Mốc thời gian (hạn chót 12/12, nộp nội bộ 10/12)

| Mốc | Việc |
|---|---|
| 18/11 | Bộ cài offline chạy được (Đức) |
| 19/11 | Bảng ánh xạ bản nháp (Cường) |
| 25–26/11 | Lab 1, 4, 6 xong (tài liệu + .asc + lời giải) |
| 29/11 | Lab 2, 3, 5 xong |
| 28/11 | Install guide PDF hoàn chỉnh |
| 5/12 | Kiểm thử chéo xong · 7/12 sửa lỗi xong |
| 6–7/12 | Trả lời câu hỏi [1]–[9] |
| 8/12 | Ghép tài liệu, báo cáo · 9/12 vấn đáp thử |
| 10/12 | Nộp |
