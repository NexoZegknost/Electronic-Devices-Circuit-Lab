# CO2037 – Dự án 3: Lưu ý & Quy tắc làm việc (Ruleset)

> **Dự án:** Xây dựng tài liệu thực hành mới với LTspice – chuyển 6 bài lab mô phỏng từ PSpice for TI sang LTspice
> **GV:** TS. Lê Trọng Nhân · **Nhóm:** 3 sinh viên · **Nguồn:** `CO2037_Project3_LTspice_Labs_VI.docx`

---

## 1. Tóm tắt nhanh

| Mục | Nội dung |
|---|---|
| Phạm vi | 6 lab: Ch.1 → Lab 1, Ch.2 → Lab 2, Ch.3 → Lab 3, Ch.5 → Lab 4, Ch.6 → Lab 5, Ch.7 → Lab 6 |
| Ngoài phạm vi | Ch.4 (Altium), mục Altium trong Ch.5 & Ch.6, Ch.8 (Final Project); **không** PCB, **không** thi công |
| Công cụ | **Chỉ LTspice** (Analog Devices) |
| Mỗi lab | Introduction + Hướng dẫn LTspice + **đúng 10 bài chính** + **≥ 2 bài nâng cao** |
| Ngôn ngữ tài liệu lab | **Tiếng Anh** (thống nhất với tài liệu gốc) |
| Báo cáo dự án | Theo **mẫu Phần B** (tiếng Việt), 12 mục |
| AI | Được phép, **bắt buộc ghi nhật ký** + kiểm chứng |
| File nộp | `MSSV1_MSSV2_MSSV3_Project3.zip` |

---

## 2. Những điểm BẮT BUỘC (dễ mất điểm nếu thiếu)

1. **Đúng 10 bài tập chính mỗi lab** – không hơn, không kém.
   - Gốc nhiều hơn → chọn lọc hoặc gộp (Lab 3 có 13 mục).
   - Gốc ít hơn → bổ sung (Lab 4: +3, Lab 6: +2, Lab 5: bổ sung đủ 10).
2. **Mỗi bài có nhãn trạng thái** và **lý do** nếu không phải Giữ nguyên:
   - `Giữ nguyên` – chỉ đổi công cụ.
   - `Điều chỉnh` – đổi linh kiện/giá trị, giữ mục tiêu học tập.
   - `Thay thế` – bài tương đương mới, phải lập luận mục tiêu học tập tương đương.
3. **Mỗi bài tập chính gồm đủ 4 phần:** sơ đồ mạch · phần tính lý thuyết **để trống** · phần mô phỏng (cấu hình lệnh) · **bảng so sánh lý thuyết – mô phỏng**.
4. **Mọi số liệu phải do nhóm chạy LTspice thực tế.** Không dùng số liệu AI tự sinh.
5. **Mọi file `.asc` mở và chạy được ngay trên bộ cài offline**, không cần tải thêm gì (thư viện/model bổ sung phải nằm trong zip).
6. **Lời giải chỉ nằm trong file dành cho giảng viên**; tài liệu phát cho sinh viên để trống phần tính.
7. **Mọi hình mạch & hình kết quả chụp từ LTspice**, đủ rõ khi in, **có đánh số và chú thích**.
8. **Mỗi bài ghi rõ giá trị linh kiện cụ thể và tên mô hình linh kiện** (vd. `1N4148`, `2N3904`, `.model` tự khai báo…).
9. **Nộp cả file nguồn (.docx hoặc .tex) và PDF** cho tài liệu lab.
10. **Hướng dẫn cài đặt offline** phải có (PDF riêng hoặc 1 chương trong tài liệu).
11. **Trả lời đủ 9 câu hỏi [1]–[9]** trong báo cáo.
12. **Mỗi thành viên phải giải thích được mọi lab** (vấn đáp), không chỉ phần mình làm.

---

## 3. Sản phẩm nộp (checklist)

- [ ] **(1)** Tài liệu thực hành mới – 6 lab · `.pdf` + `.docx`/`.tex`
- [ ] **(2)** File lời giải tham khảo · `.pdf` (lời giải lý thuyết + kết quả mô phỏng + bảng so sánh cho **mọi** bài)
- [ ] **(3)** Thư mục mô phỏng LTspice + thư viện bổ sung · `.zip`
- [ ] **(4)** Hướng dẫn cài đặt offline · `.pdf`
- [ ] **(5)** Báo cáo dự án theo mẫu Phần B · `.docx` + `.pdf`
- [ ] **(6)** *(Khuyến khích)* Video demo ngắn mỗi lab · `.mp4` hoặc link

---

## 4. Quy ước đặt tên & cấu trúc thư mục

```
MSSV1_MSSV2_MSSV3_Project3/
├── 01_LabManual/
│   ├── CO2037_LTspice_LabManual.docx   (hoặc .tex)
│   └── CO2037_LTspice_LabManual.pdf
├── 02_Solutions/
│   └── CO2037_LTspice_Solutions.pdf
├── 03_LTspice/
│   ├── lib/                 # .lib / .subckt / .asy bổ sung (nếu có)
│   ├── Lab1/
│   │   ├── Ex01.asc … Ex10.asc
│   │   └── Adv01.asc, Adv02.asc
│   ├── Lab2/ … Lab6/        # cùng quy tắc
├── 04_OfflineInstall/
│   └── LTspice_Offline_Install_Guide.pdf
├── 05_Report/
│   ├── Project3_Report.docx
│   └── Project3_Report.pdf
└── 06_Video/ (tuỳ chọn)
```

- Tên file mô phỏng **bắt buộc**: `LabN/ExNN.asc` (Ex01…Ex10), `LabN/AdvNN.asc` (Adv01, Adv02…).
- Không dùng dấu tiếng Việt, khoảng trắng trong tên file/thư mục.
- Model bổ sung tham chiếu bằng **đường dẫn tương đối** (`.lib ../lib/xxx.lib`) để chạy được ở máy khác.

---

## 5. Cấu trúc chuẩn của MỖI lab

```
Lab N – <Title>
  N.1 Introduction            – mục tiêu, kiểu phân tích được giới thiệu
  N.2 LTspice Guide           – các bước có ảnh chụp màn hình (đủ cho người mới)
  N.3 Exercises (Ex01–Ex10)
        Ex0k. <Title>   [Status: Keep | Adjust | Replace]
          a) Circuit diagram (Figure N.x)
          b) Theoretical calculation   ← để trống
          c) Simulation setup          ← lệnh .op/.dc/.tran/.ac/.step/.meas
          d) Theory vs. Simulation table
  N.4 Advanced Exercises (Adv01, Adv02, …)
          – mục tiêu rõ ràng, mức độ cao hơn bài chính
```

**Bảng so sánh mẫu (dùng thống nhất):**

| Quantity | Theory | Simulation | Error (%) |
|---|---|---|---|
| V_out (V) | | | |
| I_D (mA) | | | |

---

## 6. Lưu ý kỹ thuật theo từng lab

### Lab 1 – First Project (Ch.1)
- Phân tích `.op`; nguồn phụ thuộc **E** (VCVS); hiển thị điểm làm việc trên schematic; `.meas`.
- Nội dung: Kirchhoff, nguồn phụ thuộc, điện trở tương đương, biến đổi Y–Δ, chọn điện trở chuẩn.
- Gợi ý nâng cao: `.step` khảo sát công suất tải → định lý truyền công suất cực đại; `.meas` tự tính sai số.

### Lab 2 – Diode (Ch.2) ⚠️
- `Dbreak` và `LM2596_5P0_TRANS` (mô hình TI) **có thể không dùng được** → cần mô hình thay thế hoặc bài tương đương (liên quan câu **[5]**).
- Nội dung: đặc tuyến V-I, diode nối tiếp, mạch kẹp, chỉnh lưu bán/toàn kỳ, Zener, nguồn AC/DC.
- Chú ý **bước thời gian tối đa** trong `.tran` của mạch chỉnh lưu (câu **[7]**).
- So sánh mô hình diode mặc định vs `1N4148` vs mô hình 0,7 V (câu **[3]**).
- Gợi ý nâng cao: `.temp`/`.step temp` lên V_F; độ gợn theo tụ lọc; mạch buck dùng IC ADI.

### Lab 3 – BJT (Ch.3) ⚠️
- Gốc 13 mục → **chọn/gộp còn 10**, ghi rõ lý do.
- Cần tìm **mô hình optocoupler** hoặc tự xây mô hình tương đương.
- Nội dung: bão hoà, DC sweep, khoá, lái tải, phân cực, PNP, NPN+PNP, R_E, Darlington, base chung, gương dòng, cổng logic, opto.
- Gợi ý nâng cao: ổn định Q-point khi β thay đổi; Monte Carlo sai số điện trở; đáp ứng tần số CE.

### Lab 4 – Op-Amp (Ch.5)
- Gốc 7 bài → **bổ sung 3**.
- Kiểm tra mô hình **LM358**; nếu không chạy, chọn op-amp tương đương của **ADI** có sẵn trong thư viện.
- Kiểu phân tích: `.ac` (nguồn phải có biên độ AC), `.tran`.
- Liên quan câu **[4]**: thử nhập mô hình op-amp TI (.lib/.subckt) + tạo symbol.
- Gợi ý nâng cao: GBW & slew rate thực; Sallen-Key bậc 2; `.four` tính THD.

### Lab 5 – FET (Ch.6) ⚠️
- **Nested DC sweep** → `.dc V1 … V2 …` (hai nguồn trong một lệnh) cho họ đặc tuyến.
- MOSFET **kênh có sẵn (depletion)** có thể phải **tự khai báo `.model`**.
- Bổ sung đủ 10 bài.
- Gợi ý nâng cao: đặc tuyến truyền đạt & R_DS(on) theo V_GS; tổn hao chuyển mạch tải cảm; cầu H.

### Lab 6 – 24 Hour Project for Midterm (Ch.7)
- Gốc 8 bài → **bổ sung 2**; dùng làm bài ôn tập giữa kỳ.
- Gợi ý nâng cao: bài tổng hợp nhiều khối (nguồn – ổn áp – khoá BJT/MOSFET – op-amp).

---

## 7. Bảng ánh xạ PSpice for TI → LTspice (khung cần hoàn thiện)

> Phải **kiểm tra lại theo phiên bản LTspice thực tế** đang dùng (tên menu thay đổi giữa các phiên bản) và bổ sung thao tác phát hiện thêm.

| PSpice for TI | LTspice | Ghi chú |
|---|---|---|
| Project + Simulation Profile | Schematic `.asc` + SPICE directive | Lệnh đặt trên schematic dạng text |
| Bias Point / Bias Display | `.op`; rê chuột lên dây/linh kiện; nhãn `.op data` | Kết quả cũng ở cửa sổ text |
| DC Sweep | `.dc <src> <start> <stop> <step>` | |
| Nested DC Sweep | `.dc V1 … V2 …` | Họ đặc tuyến JFET/BJT |
| Parametric sweep | `.step param R list …` / `.step param R 1k 10k 1k` | Kết hợp `.param`, giá trị `{R}` |
| Time Domain | `.tran <Tstop>` | Chú ý max timestep |
| AC Sweep | `.ac dec <pts> <fstart> <fstop>` | Nguồn phải có AC amplitude |
| Add Trace, cursor | Probe trên nút/linh kiện; cursor; `.meas` | `.meas` tự động hoá so sánh |
| Copy to Clipboard | Export data dạng text từ cửa sổ đồ thị | |
| VCVS / CCCS… | E, F, G, H; nguồn hành vi B | |
| VSIN, VPULSE | Nguồn áp hàm SINE / PULSE | |
| Dbreak, mô hình TI | D + `.model`, thư viện; nhập `.lib/.subckt` | Mô hình TI mã hoá thường không chạy |

---

## 8. Cài đặt offline – những gì phải trình bày

- [ ] Nguồn tải chính thức, **phiên bản**, dung lượng, hệ điều hành hỗ trợ.
- [ ] **Điều khoản sử dụng** – có được phân phối lại trong nội bộ trường không?
- [ ] Bộ cài có kèm đủ thư viện không; thư viện cập nhật thế nào; cách **sao chép thư viện** sang máy không Internet.
- [ ] Cách **kiểm tra tính toàn vẹn** bộ cài (vd. checksum SHA-256).
- [ ] Các bước triển khai trên máy không Internet + cách **cập nhật về sau**.
- [ ] Chạy trên macOS / Linux (Wine) – ghi rõ giới hạn nếu có.
- [ ] Quy trình kiểm tra cài đặt thành công (mở & chạy file trong `examples`).
- [ ] Ảnh chụp quá trình cài đặt và kiểm tra.

---

## 9. 9 câu hỏi phải trả lời trong báo cáo

| # | Nội dung | Gắn với |
|---|---|---|
| [1] | So sánh PSpice for TI vs LTspice: giấy phép/đăng ký, HĐH, thư viện, kiểu phân tích, khai báo mô phỏng, xuất dữ liệu, nhập mô hình ngoài; ưu/nhược khi chuyển đổi | Bảng ánh xạ |
| [2] | Giải pháp cài offline: nguồn, phiên bản, đóng gói thư viện, kiểm tra toàn vẹn, triển khai, cập nhật; điều khoản phân phối lại | Mục 8 |
| [3] | Tham số mô hình diode mặc định; so sánh diode nối tiếp: mặc định vs 1N4148 vs 0,7 V; giải thích sai lệch | Lab 2 |
| [4] | Nhập mô hình SPICE nhà sản xuất (.lib/.subckt) + tạo symbol; thử op-amp/IC nguồn TI – chạy được không, vì sao | Lab 4 / Lab 2 |
| [5] | Giải pháp cho bài LM2596: mô hình tương thích / IC buck ADI / mô hình hành vi; so sánh mục tiêu học tập | Lab 2 |
| [6] | Liệt kê **tất cả** bài "Điều chỉnh"/"Thay thế" trong 6 lab + lý do + đảm bảo mục tiêu tương đương | Cả 6 lab |
| [7] | Ảnh hưởng max timestep trong `.tran` (độ gợn, đỉnh dòng); minh hoạ bằng **2 lần chạy** với bước khác nhau | Lab 2 / Lab 5 |
| [8] | Dùng `.step` + `.meas` tự động hoá so sánh LT–MP (≥ 1 bài); lợi ích so với đọc thủ công | Bất kỳ lab |
| [9] | Quá trình kiểm thử chéo: ai thử bài nào, lỗi phát hiện, cách sửa | Mục 8 Phần B |

---

## 10. Tiêu chí đánh giá → ưu tiên công sức

| Tiêu chí | Tỉ trọng | Ưu tiên |
|---|---|---|
| Tài liệu thực hành (6 lab đủ cấu trúc, rõ ràng, hình chất lượng, chính xác) | **35 %** | ⭐⭐⭐ |
| File mô phỏng & lời giải (.asc chạy được offline, lời giải đúng đủ) | **20 %** | ⭐⭐⭐ |
| Chuyển đổi & bài tương đương (bảng ánh xạ, lập luận mục tiêu học tập) | 15 % | ⭐⭐ |
| Bài tập nâng cao (tính mới, thử thách, gắn nội dung lab) | 10 % | ⭐ |
| Cài đặt offline & câu hỏi [1]–[9] | 10 % | ⭐ |
| Báo cáo & quy trình (kiểm thử chéo, nhật ký AI, phân công) | 10 % | ⭐ |

> 55 % điểm nằm ở **tài liệu lab + file mô phỏng/lời giải** → dồn lực vào chất lượng và tính chạy được.

---

## 11. RULESET – Quy tắc làm việc của nhóm

### R1. Phạm vi & công cụ
- **R1.1** Chỉ dùng LTspice; không đưa nội dung Altium/PCB/thi công vào tài liệu.
- **R1.2** Cả nhóm dùng **cùng một phiên bản LTspice**; ghi phiên bản trong báo cáo (Bảng 5).
- **R1.3** Chỉ dùng mô hình có sẵn trong thư viện bộ cài offline hoặc file mô hình được đưa vào `03_LTspice/lib/`.

### R2. Nội dung tài liệu lab
- **R2.1** Viết bằng **tiếng Anh**; thuật ngữ, ký hiệu (V_CE, I_D, β, R_DS(on)…) **nhất quán** giữa 6 lab – dùng chung một bảng thuật ngữ.
- **R2.2** Mỗi lab đúng **10 Ex + ≥ 2 Adv**; mỗi Ex đủ 4 phần (mạch – lý thuyết trống – mô phỏng – bảng so sánh).
- **R2.3** Mỗi Ex ghi **Status** (Keep/Adjust/Replace); Adjust/Replace phải có **Reason** và **Learning objective preserved**.
- **R2.4** Mỗi Ex ghi rõ **giá trị linh kiện** và **tên model**.
- **R2.5** Hướng dẫn LTspice phải đủ để **người chưa từng dùng** làm theo được.
- **R2.6** Bài nâng cao phải khó hơn bài chính, dùng ít nhất một kỹ thuật: `.step`, `.meas`, `.temp`, Monte Carlo, `.four`.

### R3. Hình ảnh
- **R3.1** Mọi hình **chụp từ LTspice**; không vẽ lại bằng công cụ khác, không lấy từ tài liệu gốc.
- **R3.2** Nền trắng/độ tương phản cao để in rõ; đánh số `Figure N.x` + chú thích.
- **R3.3** Đồ thị phải có tên trục, đơn vị, con trỏ/giá trị đo nếu cần đọc số.

### R4. File mô phỏng
- **R4.1** Đặt tên đúng `LabN/ExNN.asc`, `LabN/AdvNN.asc`.
- **R4.2** Mỗi bài có **1 file .asc tương ứng**; lệnh mô phỏng đặt ngay trên schematic.
- **R4.3** Ưu tiên dùng `.meas` để xuất giá trị cần so sánh → dễ kiểm chứng, dễ chấm.
- **R4.4** Đường dẫn thư viện **tương đối**; trước khi nộp phải chạy thử toàn bộ file trên **một máy cài offline sạch**.

### R5. Lý thuyết – mô phỏng – lời giải
- **R5.1** Số liệu mô phỏng **chỉ** lấy từ lần chạy thật của nhóm; lưu lại file `.log`/ảnh làm bằng chứng.
- **R5.2** Sai lệch LT–MP phải **tính % và giải thích** (do mô hình linh kiện, giả thiết 0,7 V, β, …).
- **R5.3** Lời giải chỉ có trong file giảng viên; tài liệu sinh viên **không** lộ đáp án.
- **R5.4** Người viết lời giải tự giải tay trước, sau đó đối chiếu mô phỏng – không chép kết quả mô phỏng làm "lý thuyết".

### R6. Sử dụng AI
- **R6.1** Được dùng AI để: tra cứu, sinh netlist, viết nháp hướng dẫn, đề xuất bài nâng cao, rà soát lỗi.
- **R6.2** **Mỗi lần AI ảnh hưởng tới kết quả → ghi ngay** vào Nhật ký AI (Bảng 14): công cụ, mục đích, tóm tắt prompt, kết quả, **cách kiểm chứng**.
- **R6.3** Netlist/mạch do AI sinh **phải chạy lại trên LTspice** và kiểm tra trước khi đưa vào tài liệu.
- **R6.4** **Không bao giờ** đưa số liệu do AI "tính/đoán" vào bảng kết quả.

### R7. Kiểm thử chéo
- **R7.1** Mỗi lab do **người khác** (không phải người viết) làm theo từ đầu đến cuối trên bộ cài offline.
- **R7.2** Ghi lỗi/điểm khó hiểu vào Bảng 13 (người viết – người thử – lỗi – đã sửa).
- **R7.3** Lab chỉ được coi là **xong** khi đã qua kiểm thử chéo và sửa hết lỗi.

### R8. Phối hợp & vấn đáp
- **R8.1** Mỗi thành viên phụ trách chính 2 lab nhưng **phải đọc và chạy được cả 6 lab**.
- **R8.2** Thay đổi ảnh hưởng chung (template, thuật ngữ, cấu trúc thư mục, phiên bản LTspice) phải **thống nhất cả nhóm** trước khi áp dụng.
- **R8.3** Ghi phân công & tỉ lệ đóng góp vào Bảng 15 trung thực.
- **R8.4** Trước khi nộp: tổ chức **buổi vấn đáp thử nội bộ** – mỗi người giải thích lab của người khác.

### R9. Định nghĩa "Hoàn thành" (Definition of Done) cho 1 lab
- [ ] Introduction + LTspice Guide có ảnh chụp
- [ ] Đủ 10 Ex, mỗi Ex đủ 4 phần, có Status (+ lý do nếu cần)
- [ ] ≥ 2 Adv có mục tiêu rõ
- [ ] Đủ file `.asc` (Ex01–Ex10, Adv01–Adv0n), chạy được offline
- [ ] Lời giải đủ cho mọi bài (LT + MP + bảng so sánh)
- [ ] Hình đánh số, chú thích, in rõ
- [ ] Đã kiểm thử chéo & sửa lỗi
- [ ] Nhật ký AI của lab đã cập nhật
- [ ] Bảng 6/7–12 trong báo cáo đã điền

---

## 12. Checklist cuối trước khi nộp

- [ ] Zip đặt tên `MSSV1_MSSV2_MSSV3_Project3.zip`
- [ ] Đủ 5 sản phẩm bắt buộc (+ video nếu có)
- [ ] Toàn bộ `.asc` chạy được trên máy offline sạch
- [ ] Tài liệu lab: có `.pdf` **và** file nguồn
- [ ] Báo cáo: có `.docx` **và** `.pdf`; đã xoá chữ hướng dẫn xám nghiêng & khung cam trong mẫu
- [ ] Trả lời đủ câu [1]–[9]
- [ ] Bảng 5 (thông tin nhóm), 6, 7–12, 13, 14, 15 đã điền đầy đủ
- [ ] Mỗi thành viên tự tin vấn đáp cả 6 lab
