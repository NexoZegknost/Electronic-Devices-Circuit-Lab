# CO2037 – Dự án 3 · Phân công công việc (3 thành viên)

> Mỗi người nhận **1 lab khó + 1 lab dễ hơn** để khối lượng chia đều, kèm **1 mảng việc chung**.
> Danh sách 10 Ex dưới đây là **đề xuất**. Nhóm cần đối chiếu với tài liệu gốc trước khi chốt.

## 0. Tổng quan

| | **TV1** | **TV2** | **TV3** |
|---|---|---|---|
| Lab chính | **Lab 1** (dễ) + **Lab 2** (khó) | **Lab 3** (khó) + **Lab 4** (TB) | **Lab 5** (khó) + **Lab 6** (dễ) |
| Mảng chung | Cài đặt offline | Bảng ánh xạ PSpice → LTspice | Template tài liệu, biên tập, đóng gói |
| Câu hỏi báo cáo | [2], [3], [5], [7] | [1], [4], [8] | [6], [9] |
| Kiểm thử chéo | Thử **Lab 5, 6** | Thử **Lab 1, 2** | Thử **Lab 3, 4** |
| Mục báo cáo Phần B | 2, 5.1, 5.2 | 3, 5.3, 5.4 | 1, 4, 5.5, 5.6, 6, 8, 9, 11, 12 |

Việc **mỗi người** đều phải làm với 2 lab của mình:
- Viết Introduction và LTspice Guide.
- Làm 10 Ex, ít nhất 2 Adv, cùng các file `.asc` tương ứng.
- Viết lời giải cho mọi bài.
- Điền bảng lab trong báo cáo (Bảng 7–12) và nhật ký AI của phần mình.

---

## 1. TV1 – Lab 1, Lab 2 và Cài đặt offline

### 1.1. Lab 1 – First Project (`.op`, nguồn E, `.meas`)
**LTspice Guide:**
- Cài và mở LTspice, tạo schematic `.asc`.
- Đặt linh kiện, đi dây, đặt GND.
- Thêm SPICE directive, chạy `.op`.
- Xem điểm làm việc bằng cách rê chuột hoặc đặt nhãn `.op data`.
- Đọc cửa sổ kết quả dạng text.

| Ex | Nội dung | Trạng thái dự kiến |
|---|---|---|
| 01–02 | Định luật Kirchhoff (KCL, KVL) | Keep |
| 03–04 | Nguồn phụ thuộc VCVS (nguồn **E**) | Keep |
| 05–06 | Điện trở tương đương | Keep |
| 07–08 | Biến đổi sao – tam giác | Keep |
| 09–10 | Chọn điện trở chuẩn (E12/E24) | Keep |

**Adv:**
- **Adv01:** dùng `.step param RL` để kiểm chứng định lý truyền công suất cực đại.
- **Adv02:** dùng `.meas` tự tính sai số % giữa lý thuyết và mô phỏng cho một mạch Kirchhoff.

### 1.2. Lab 2 – Diode (`.dc`, `.tran`) ⚠️
**LTspice Guide:**
- Khai báo lệnh `.dc`.
- Chọn model diode (mặc định, `1N4148`, `1N4007`, Zener `1N4733`…).
- Cấu hình nguồn SINE và lệnh `.tran`, đặt max timestep.
- Đo giá trị bằng `.meas`.

| Ex | Nội dung | Trạng thái dự kiến |
|---|---|---|
| 01 | Đặc tuyến V-I (`.dc`) | Adjust: Dbreak → `1N4148` |
| 02 | Mô hình diode (so sánh mặc định, 1N4148, 0,7 V) | Adjust |
| 03 | Diode nối tiếp | Keep |
| 04 | Mạch kẹp (clamper) | Keep |
| 05 | Mạch chuyển nguồn (power switching) | Keep |
| 06 | Chỉnh lưu bán kỳ | Keep |
| 07 | Chỉnh lưu toàn kỳ (cầu) | Keep |
| 08 | Ổn áp Zener | Adjust (đổi model Zener) |
| 09 | Nguồn AC/DC (biến áp, chỉnh lưu, tụ lọc) | Keep/Adjust |
| 10 | Nguồn AC/DC với LM2596 | **Replace**: IC buck ADI có sẵn (vd. LT8610/LTC3600) hoặc buck mô hình hành vi |

**Adv:**
- **Adv01:** ảnh hưởng nhiệt độ lên V_F (`.step temp`).
- **Adv02:** độ gợn theo giá trị tụ lọc (`.step param C`).
- **Adv03 (tuỳ chọn):** mạch buck dùng IC ADI.

### 1.3. Cài đặt offline (sản phẩm số 4)
- Tải bộ cài từ trang chính thức, ghi phiên bản, dung lượng và các HĐH hỗ trợ.
- Đọc điều khoản sử dụng và trả lời: có được phân phối lại trong trường không?
- Xác định bộ cài đã kèm đủ thư viện chưa. Tìm cách sao chép thư viện (thư mục `lib`, `examples`) sang máy không có Internet.
- Ghi checksum SHA-256 để kiểm tra bộ cài còn nguyên vẹn.
- Viết quy trình triển khai cho phòng máy và cách cập nhật về sau.
- Thử trên macOS hoặc Linux (Wine), ghi rõ giới hạn nếu có.
- Kiểm tra cài đặt bằng cách mở và chạy một file trong `examples`. Chụp ảnh từng bước.
- Viết thành `LTspice_Offline_Install_Guide.pdf`.
- **Dựng 1 máy "offline sạch"** để cả nhóm chạy thử file `.asc` trước khi nộp.

### 1.4. Câu hỏi báo cáo
- **[2]** Giải pháp cài offline, dựa trên mục 1.3.
- **[3]** Tham số model diode mặc định. So sánh Ex03 Lab 2 với ba model: mặc định, 1N4148 và 0,7 V.
- **[5]** Giải pháp thay LM2596, so sánh mục tiêu học tập giữa bài gốc và bài thay.
- **[7]** Chạy chỉnh lưu (Lab 2 Ex07) **2 lần** với max timestep khác nhau, so sánh độ gợn và dòng đỉnh.

---

## 2. TV2 – Lab 3, Lab 4 và Bảng ánh xạ

### 2.1. Lab 3 – BJT (`.op`, `.dc`, `.tran`) ⚠️ gốc 13 mục → gộp còn 10
**LTspice Guide:**
- Chọn model BJT (`2N3904`, `2N3906`, `2N2222`).
- Vẽ họ đặc tuyến bằng `.dc` lồng (I_B, V_CE).
- Đọc β và các vùng làm việc.

| Ex | Nội dung | Trạng thái dự kiến |
|---|---|---|
| 01 | Bão hoà + DC Sweep (gộp 2 mục) | Adjust (gộp) |
| 02 | BJT làm khoá + lái tải (gộp 2 mục) | Adjust (gộp) |
| 03 | Phân cực BJT | Keep |
| 04 | PNP + kết hợp NPN/PNP (gộp 2 mục) | Adjust (gộp) |
| 05 | Điện trở emitter (ổn định Q-point) | Keep |
| 06 | Darlington | Keep |
| 07 | Base chung | Keep |
| 08 | Gương dòng | Keep |
| 09 | Cổng logic dùng BJT | Keep |
| 10 | Optocoupler | Adjust/**Replace**: model opto có sẵn (vd. 4N25) hoặc mô hình tương đương LED + B-source + BJT |

**Adv:**
- **Adv01:** độ ổn định Q-point khi β thay đổi (`.step` theo BF).
- **Adv02:** phân tích Monte Carlo sai số điện trở (`mc()`).
- **Adv03 (tuỳ chọn):** đáp ứng tần số của mạch CE (`.ac`).

### 2.2. Lab 4 – Op-Amp (`.ac`, `.tran`) gốc 7 bài → thêm 3
**LTspice Guide:**
- Chọn op-amp (LM358 nếu chạy được, nếu không thì dùng op-amp ADI như LT1001 hoặc `UniversalOpAmp`).
- Cấp nguồn đôi.
- Khai báo `.ac dec` với nguồn có biên độ AC, vẽ đồ thị Bode.

| Ex | Nội dung | Trạng thái dự kiến |
|---|---|---|
| 01 | Voltage follower | Keep/Adjust (model) |
| 02 | Follower dòng lớn (có BJT đệm) | Keep/Adjust |
| 03 | Khuếch đại không đảo | Keep |
| 04 | Mạch cộng | Keep |
| 05 | Lọc thông thấp (`.ac`) | Keep |
| 06 | Lọc thông cao (`.ac`) | Keep |
| 07 | Schmitt trigger (`.tran`) | Keep |
| 08 | **Mới:** khuếch đại đảo | Replace (bổ sung) |
| 09 | **Mới:** khuếch đại vi sai (trừ) | Replace (bổ sung) |
| 10 | **Mới:** mạch so sánh hoặc tích phân | Replace (bổ sung) |

**Adv:**
- **Adv01:** ảnh hưởng của GBW và slew rate thực.
- **Adv02:** lọc Sallen-Key bậc 2.
- **Adv03 (tuỳ chọn):** đo THD bằng `.four`.

### 2.3. Bảng ánh xạ PSpice for TI → LTspice
- Kiểm lại từng dòng của Bảng 2 theo phiên bản LTspice đang dùng (tên menu, phím tắt).
- Bổ sung các thao tác phát hiện thêm: xuất dữ liệu, `.param`, `.include`/`.lib`, tạo symbol, `.temp`, `.four`.
- Gửi bảng cho cả nhóm sớm, **trước khi viết LTspice Guide**, để các lab dùng chung cách gọi tên.

### 2.4. Câu hỏi báo cáo
- **[1]** So sánh PSpice for TI và LTspice: giấy phép, HĐH, thư viện, kiểu phân tích, cách khai báo, xuất dữ liệu, nhập model ngoài. Nêu ưu và nhược điểm khi chuyển đổi.
- **[4]** Nhập `.lib`/`.subckt` và tạo symbol. Thử với op-amp TI (vd. LM358 của TI): chạy được không, vì sao.
- **[8]** Dùng `.step` + `.meas` để tự động so sánh lý thuyết với mô phỏng, minh hoạ trên Lab 3 Ex05 hoặc Lab 4 Ex03.

---

## 3. TV3 – Lab 5, Lab 6, Template và Biên tập

### 3.1. Lab 5 – FET (`.dc` lồng, `.op`, `.tran`) ⚠️
**LTspice Guide:**
- Dùng `.dc` hai nguồn để vẽ họ đặc tuyến JFET/MOSFET.
- Tự khai `.model` NMOS/PMOS (VTO, KP) cho MOSFET kênh có sẵn.

| Ex | Nội dung | Trạng thái dự kiến |
|---|---|---|
| 01 | JFET – DC Sweep (đặc tuyến truyền đạt) | Keep/Adjust (model) |
| 02 | JFET – Nested DC Sweep (họ đặc tuyến ra) | Adjust (cú pháp `.dc` lồng) |
| 03 | JFET tự phân cực | Keep |
| 04 | JFET phân cực phân áp | Keep |
| 05 | MOSFET kênh có sẵn (depletion) | Adjust (tự khai `.model`, VTO < 0) |
| 06 | MOSFET kênh cảm ứng (enhancement) | Keep/Adjust |
| 07 | MOSFET làm khoá | Keep |
| 08 | MOSFET điều khiển động cơ (tải cảm + diode dập) | Keep/Adjust |
| 09 | **Mới:** khuếch đại nguồn chung CS (`.ac`) | Replace (bổ sung) |
| 10 | **Mới:** cổng đảo CMOS | Replace (bổ sung) |

**Adv:**
- **Adv01:** R_DS(on) theo V_GS (`.step`).
- **Adv02:** tổn hao chuyển mạch khi điều khiển tải cảm.
- **Adv03 (tuỳ chọn):** mạch cầu H.

### 3.2. Lab 6 – 24 Hour Project for Midterm (gốc 8 bài → thêm 2)

| Ex | Nội dung | Trạng thái dự kiến |
|---|---|---|
| 01 | Điện trở tương đương | Keep |
| 02 | Dòng điện trong mạch | Keep |
| 03–04 | Mạch diode | Keep/Adjust (model) |
| 05 | Zener | Keep/Adjust |
| 06–07 | BJT | Keep |
| 08 | BJT + Zener | Keep |
| 09 | **Mới:** khối op-amp (khuếch đại hoặc so sánh) | Replace (bổ sung) |
| 10 | **Mới:** MOSFET làm khoá | Replace (bổ sung) |

**Adv:**
- **Adv01:** hệ tổng hợp nguồn → Zener ổn áp → khoá BJT/MOSFET → tải.
- **Adv02:** cảm biến → op-amp so sánh → khoá MOSFET.

### 3.3. Template, biên tập và đóng gói
- **Làm template ngay từ đầu** (Word hoặc LaTeX):
  - style cho heading;
  - đánh số Figure/Table;
  - khung Ex chuẩn gồm Circuit, Theory (trống), Simulation, Comparison table;
  - bảng thuật ngữ tiếng Anh dùng chung.
- Ghép 6 lab thành **Lab Manual**, rà để thuật ngữ và ký hiệu nhất quán.
- Ghép lời giải của cả nhóm thành **Solutions.pdf**.
- Gom file `.asc` và `lib/` theo đúng cấu trúc thư mục, nén `MSSV1_MSSV2_MSSV3_Project3.zip`.
- Hoàn thiện **báo cáo Phần B**:
  - xoá chữ hướng dẫn và khung mẫu;
  - điền Bảng 5, 6, 13, 14, 15;
  - xuất `.docx` và `.pdf`.

### 3.4. Câu hỏi báo cáo
- **[6]** Tổng hợp **mọi** bài Adjust/Replace của 6 lab từ bảng của cả nhóm, kèm lý do và cách giữ mục tiêu học tập.
- **[9]** Mô tả kiểm thử chéo dựa trên Bảng 13.

---

## 4. Việc chung cả nhóm

| Việc | Ai |
|---|---|
| Chốt phiên bản LTspice, template, bảng thuật ngữ | Cả nhóm (TV3 chủ trì) |
| Họp chốt danh sách 10 Ex và trạng thái của 6 lab | Cả nhóm |
| Chạy thử mọi `.asc` trên máy offline sạch | Cả nhóm (TV1 chuẩn bị máy) |
| Vấn đáp thử nội bộ: mỗi người trình bày lab của người khác | Cả nhóm |
| Video demo (tuỳ chọn) | Mỗi người quay 2 lab của mình |

## 5. Lộ trình đề xuất (6 tuần, điều chỉnh theo hạn nộp)

| Tuần | TV1 | TV2 | TV3 | Mốc |
|---|---|---|---|---|
| 1 | Cài offline, máy sạch | Bảng ánh xạ bản nháp | Template, thuật ngữ | ✅ Chốt công cụ và template |
| 2 | Rà bài gốc Lab 1, 2 | Rà bài gốc Lab 3, 4 | Rà bài gốc Lab 5, 6 | ✅ Chốt 10 Ex và trạng thái |
| 3–4 | Xây Lab 1, 2 | Xây Lab 3, 4 | Xây Lab 5, 6 | ✅ Bản nháp 6 lab và `.asc` |
| 4 | Lời giải Lab 1, 2 | Lời giải Lab 3, 4 | Lời giải Lab 5, 6 | ✅ Lời giải đủ |
| 5 | Thử Lab 5, 6 | Thử Lab 1, 2 | Thử Lab 3, 4 | ✅ Bảng 13, sửa lỗi |
| 6 | Câu [2][3][5][7], mục 2 | Câu [1][4][8], mục 3 | Ghép tài liệu, báo cáo, zip | ✅ Vấn đáp thử, nộp |

## 6. Tỉ lệ đóng góp dự kiến
TV1 ≈ 33 % · TV2 ≈ 33 % · TV3 ≈ 34 %. Nhóm ghi tỉ lệ thực tế vào Bảng 15 khi kết thúc.
