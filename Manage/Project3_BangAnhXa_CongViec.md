# CO2037 – Dự án 3 · Công việc lập Bảng ánh xạ PSpice for TI → LTspice

> **Người phụ trách:** TV2 · **Hạn bản nháp:** cuối tuần 1 · **Dùng cho:** LTspice Guide của 6 lab, mục 3 báo cáo Phần B, câu hỏi [1]
> **Phiên bản LTspice:** `________` · **HĐH kiểm thử:** `________`

---

## 1. Mục tiêu

Bảng ánh xạ là "từ điển" để chuyển mọi thao tác PSpice for TI trong tài liệu gốc sang LTspice. Có hai yêu cầu:
- Mỗi dòng phải được **kiểm trên đúng phiên bản LTspice nhóm dùng**, vì tên menu thay đổi giữa XVII và 24.x.
- Cả 6 lab dùng **chung một cách gọi tên** thao tác.

---

## 2. Các bước thực hiện

### Bước 1 – Chốt môi trường
- [ ] Ghi phiên bản LTspice đang dùng trên máy cài offline (Help → About).
- [ ] Nếu có, mở PSpice for TI song song để đối chiếu. Nếu không, dựa vào ảnh chụp trong tài liệu gốc.

### Bước 2 – Rà tài liệu gốc
- [ ] Đọc Ch.1, 2, 3, 5, 6, 7 (bỏ qua Ch.4, Ch.8 và các mục Altium).
- [ ] Liệt kê **mọi thao tác PSpice** được dùng: menu, part, kiểu phân tích, probe/marker, xuất dữ liệu.
- [ ] Ghi vị trí xuất hiện của từng thao tác (vd. *Ch.3 – Nested DC Sweep, Fig 3.5*).

### Bước 3 – Gom nhóm thao tác

| Nhóm | Phạm vi |
|---|---|
| **A** | Project, file |
| **B** | Vẽ schematic |
| **C** | Linh kiện, nguồn |
| **D** | Mô hình linh kiện |
| **E** | Kiểu phân tích |
| **F** | Hiển thị kết quả |
| **G** | Đo đạc |
| **H** | Xuất dữ liệu |
| **I** | Lỗi thường gặp |

### Bước 4 – Tìm thao tác tương đương trong LTspice
- [ ] Mỗi dòng ghi đủ: menu / phím tắt, directive và cú pháp, mức tương đương, ghi chú.
- [ ] Mức tương đương: ✅ tương đương trực tiếp · 🔄 làm theo cách khác · ❌ không có, cần giải pháp thay thế.

### Bước 5 – Kiểm chứng
- [ ] Mỗi thao tác quan trọng có file thử nhỏ: `Mapping/Map_<Nhóm><STT>_<tên>.asc`.
- [ ] Chạy thử, chụp màn hình, ghi tên file vào cột *Minh chứng*.
- [ ] Đánh dấu ☑ ở cột *Đã kiểm* sau khi chạy thành công.

### Bước 6 – Viết đầu ra
- [ ] **Bản đầy đủ** (tiếng Việt) cho mục 3 của báo cáo Phần B.
- [ ] **Bản rút gọn** (tiếng Anh, 1–2 trang), đưa vào Appendix của Lab Manual làm *LTspice Quick Reference*.
- [ ] **Phần so sánh tổng quát** cho câu [1], xem mục 4.

### Bước 7 – Phối hợp
- [ ] Gửi bản nháp cho TV1 và TV3 trước khi họ viết LTspice Guide.
- [ ] Gom các thao tác thành viên khác phát hiện thêm vào mục 5 rồi cập nhật bảng.
- [ ] Nếu tra cú pháp bằng AI, ghi vào **Nhật ký AI** kèm tên file thử đã dùng để kiểm chứng.

---

## 3. Bảng ánh xạ (khung, cần kiểm từng dòng)

> Cột LTspice là **gợi ý ban đầu**. Mọi dòng phải kiểm lại trên phiên bản đang dùng trước khi đánh ☑.

### A. Project, file

| # | PSpice for TI | LTspice (menu / phím tắt) | Directive / cú pháp | Mức | Ghi chú | Lab | Minh chứng | Đã kiểm |
|---|---|---|---|---|---|---|---|---|
| A1 | New Project | File → New Schematic | – | 🔄 | Không có khái niệm project. Mỗi mạch là một file `.asc` | 1 | | ☐ |
| A2 | Simulation Profile (New / Edit) | Simulate → Edit Simulation Cmd (24.x: Configure Analysis) | `.op`, `.dc`, `.tran`, `.ac`… | 🔄 | Lệnh mô phỏng đặt trên schematic dưới dạng text | 1 | | ☐ |
| A3 | Run (F11) | Simulate → Run / nút chạy | – | ✅ | | 1 | | ☐ |
| A4 | Lưu và mở project | File → Save / Open (`.asc`) | – | ✅ | File kết quả `.raw`, log `.log` | 1 | | ☐ |
| A5 | Output file | View → SPICE Error Log (Ctrl+L) | – | 🔄 | Chứa kết quả `.op` và `.meas` | 1 | | ☐ |

### B. Vẽ schematic

| # | PSpice for TI | LTspice | Directive | Mức | Ghi chú | Lab | Minh chứng | Đã kiểm |
|---|---|---|---|---|---|---|---|---|
| B1 | Place Part (P) | Component (F2) | – | ✅ | Có phím tắt riêng: R, C, L, D | 1 | | ☐ |
| B2 | Place Wire (W) | Wire (F3) | – | ✅ | | 1 | | ☐ |
| B3 | Place Ground (0/GND) | Ground (G) | – | ✅ | GND của LTspice chính là node 0 | 1 | | ☐ |
| B4 | Net Alias | Label Net (F4) | – | ✅ | Đặt tên node để probe dễ hơn | 1 | | ☐ |
| B5 | Rotate / Mirror | Ctrl+R / Ctrl+E | – | ✅ | | 1 | | ☐ |
| B6 | Move / Drag | Move (F7) / Drag (F8) | – | ✅ | | 1 | | ☐ |
| B7 | Sửa giá trị linh kiện | Chuột phải lên linh kiện | – | ✅ | | 1 | | ☐ |
| B8 | Place Text | Comment (T) | – | ✅ | Phân biệt Comment với SPICE Directive | 1 | | ☐ |

### C. Linh kiện, nguồn

| # | PSpice for TI | LTspice | Directive | Mức | Ghi chú | Lab | Minh chứng | Đã kiểm |
|---|---|---|---|---|---|---|---|---|
| C1 | R, C, L | `res`, `cap`, `ind` | – | ✅ | Hậu tố giá trị: `k`, `meg` (không phải `M`), `u`, `n`, `p` | 1 | | ☐ |
| C2 | VDC | `voltage` | `V1 n+ n- 5` | ✅ | | 1 | | ☐ |
| C3 | IDC | `current` | `I1 n+ n- 1m` | ✅ | | 1 | | ☐ |
| C4 | VSIN | `voltage` → Advanced → SINE | `SINE(Voff Vamp Freq)` | ✅ | | 2 | | ☐ |
| C5 | VPULSE | `voltage` → PULSE | `PULSE(V1 V2 Td Tr Tf Ton Tper)` | ✅ | | 3, 5 | | ☐ |
| C6 | VAC | `voltage` → Small signal AC | `AC 1` | 🔄 | Biên độ AC nằm chung trong nguồn V | 4 | | ☐ |
| C7 | VCVS (E) | `e` | `E1 out 0 in 0 10` | ✅ | | 1 | | ☐ |
| C8 | CCCS (F) | `f` | `F1 a b Vsense 2` | ✅ | Cần nguồn 0 V để đo dòng | 1 | | ☐ |
| C9 | VCCS (G) / CCVS (H) | `g` / `h` | | ✅ | | 1 | | ☐ |
| C10 | ABM (nguồn hành vi) | `bv` / `bi` | `B1 out 0 V=V(a)*2` | 🔄 | | 3, 4 | | ☐ |
| C11 | Biến áp | 2 cuộn `ind` + lệnh `K` | `K1 L1 L2 1` | 🔄 | | 2 | | ☐ |
| C12 | Switch (Sw_tClose) | `sw` + `.model SW` | `.model SW1 SW(Ron=.1 Roff=1meg Vt=.5)` | 🔄 | | 2 | | ☐ |

### D. Mô hình linh kiện

| # | PSpice for TI | LTspice | Directive | Mức | Ghi chú | Lab | Minh chứng | Đã kiểm |
|---|---|---|---|---|---|---|---|---|
| D1 | Dbreak | `diode` mặc định hoặc Pick New Diode | `.model D D` | 🔄 | Ghi rõ tham số mặc định (câu [3]) | 2 | | ☐ |
| D2 | D1N4148, D1N4007 | `1N4148`, `1N4007` | – | ✅ | | 2 | | ☐ |
| D3 | Zener (D1N750…) | `zener` → Pick New (vd. BZX84C…) | | 🔄 | Tên model khác với PSpice | 2, 6 | | ☐ |
| D4 | Qbreak, Q2N3904/3906 | `npn` / `pnp` → `2N3904`, `2N3906` | | ✅ | | 3 | | ☐ |
| D5 | JFET (J2N3819…) | `njf` / `pjf` | `.model` nếu thiếu | 🔄 | | 5 | | ☐ |
| D6 | MOSFET kênh cảm ứng | `nmos` → Pick New (vd. 2N7002, IRF…) | | 🔄 | | 5 | | ☐ |
| D7 | MOSFET kênh có sẵn | `nmos` + tự khai báo | `.model MD NMOS(VTO=-2 KP=…)` | ❌→🔄 | Thư viện hầu như không có sẵn | 5 | | ☐ |
| D8 | LM358 (TI) | Op-amp ADI (LT1001…) hoặc `UniversalOpAmp` | | 🔄 | Kiểm tra model TI có chạy không (câu [4]) | 4 | | ☐ |
| D9 | LM2596_5P0_TRANS | IC buck ADI hoặc mô hình hành vi | | ❌ | Model TI mã hoá (câu [5]) | 2 | | ☐ |
| D10 | Optocoupler | Model opto có sẵn hoặc LED + B-source + BJT | | 🔄 | | 3 | | ☐ |
| D11 | Nhập `.lib` ngoài | SPICE directive | `.lib path/file.lib` / `.include` | ✅ | Dùng đường dẫn tương đối | 2, 4 | | ☐ |
| D12 | Tạo part từ `.subckt` | Mở `.lib` → chuột phải dòng `.subckt` → Create Symbol | | 🔄 | | 4 | | ☐ |

### E. Kiểu phân tích

| # | PSpice for TI | LTspice | Directive | Mức | Ghi chú | Lab | Minh chứng | Đã kiểm |
|---|---|---|---|---|---|---|---|---|
| E1 | Bias Point | Edit Simulation Cmd → DC op pnt | `.op` | ✅ | | 1 | | ☐ |
| E2 | DC Sweep | DC sweep | `.dc V1 0 5 10m` | ✅ | | 2, 3 | | ☐ |
| E3 | Nested DC Sweep | DC sweep (thêm nguồn thứ 2) | `.dc V1 0 10 0.1 V2 0 5 1` | 🔄 | Nguồn ghi trước là trục x | 3, 5 | | ☐ |
| E4 | Time Domain (Transient) | Transient | `.tran 0 20m 0 10u` | ✅ | Tham số cuối là max timestep (câu [7]) | 2, 4, 5 | | ☐ |
| E5 | AC Sweep | AC Analysis | `.ac dec 100 10 1meg` | ✅ | Nguồn phải có `AC 1` | 4 | | ☐ |
| E6 | Parametric Sweep | – | `.param R 1k` + `.step param R 1k 10k 1k` | 🔄 | Giá trị linh kiện ghi là `{R}` | 1, 3 | | ☐ |
| E7 | Temperature | – | `.temp 0 27 75` / `.step temp …` | ✅ | | 2 | | ☐ |
| E8 | Monte Carlo | – | `{mc(1k,0.05)}` + `.step param run 1 50 1` | 🔄 | Không có hộp thoại riêng | 3 | | ☐ |
| E9 | Fourier | – | `.four 1k V(out)` | ✅ | Kết quả nằm trong log | 4 | | ☐ |

### F. Hiển thị kết quả

| # | PSpice for TI | LTspice | Directive | Mức | Ghi chú | Lab | Minh chứng | Đã kiểm |
|---|---|---|---|---|---|---|---|---|
| F1 | Enable Bias Voltage/Current Display | Rê chuột lên dây/linh kiện, hoặc chuột phải → Place .op Data Label | | 🔄 | | 1 | | ☐ |
| F2 | Voltage / Current Marker | Click vào dây (probe áp) hoặc vào linh kiện (probe dòng) | | ✅ | | 1 | | ☐ |
| F3 | Differential marker | Kéo probe từ node này sang node kia | | 🔄 | | 2 | | ☐ |
| F4 | Add Trace kèm biểu thức | Plot Settings → Add Trace | `V(out)/V(in)` | ✅ | | 2, 4 | | ☐ |
| F5 | Add Plot | Plot Settings → Add Plot Pane | | ✅ | | 3 | | ☐ |
| F6 | Cursor | Click nhãn trace để bật cursor 1/2 | | ✅ | | 2 | | ☐ |
| F7 | Trục log, đổi trục x | Chuột phải lên trục | | ✅ | | 4 | | ☐ |
| F8 | Average / RMS | Ctrl + click nhãn trace | | 🔄 | | 2 | | ☐ |
| F9 | Power marker (W) | Alt + click linh kiện | | 🔄 | | 1, 5 | | ☐ |

### G. Đo đạc

| # | PSpice for TI | LTspice | Directive | Mức | Ghi chú | Lab | Minh chứng | Đã kiểm |
|---|---|---|---|---|---|---|---|---|
| G1 | Đọc giá trị bằng cursor | `.meas` FIND … AT | `.meas DC Id FIND I(D1) AT=1` | 🔄 | Tự động, kết quả nằm trong log | 2 | | ☐ |
| G2 | Measurement (Max/Min/PP) | `.meas` MAX / MIN / PP | `.meas TRAN Vr PP V(out) FROM=10m TO=20m` | 🔄 | | 2 | | ☐ |
| G3 | Đo thời gian, tần số cắt | `.meas` WHEN / TRIG–TARG | `.meas AC f3db WHEN mag(V(out))=0.707` | 🔄 | | 4 | | ☐ |
| G4 | Sai số so với lý thuyết | `.meas` PARAM | `.meas err PARAM (Id-1m)/1m*100` | 🔄 | Dùng cho câu [8] | 1–6 | | ☐ |

### H. Xuất dữ liệu

| # | PSpice for TI | LTspice | Directive | Mức | Ghi chú | Lab | Minh chứng | Đã kiểm |
|---|---|---|---|---|---|---|---|---|
| H1 | Copy to Clipboard (dữ liệu) | Cửa sổ đồ thị → File → Export data as text | | 🔄 | Xuất `.txt` để mở bằng Excel | 1–6 | | ☐ |
| H2 | Copy ảnh đồ thị | Tools → Copy bitmap to Clipboard | | 🔄 | Đặt nền trắng trước khi chụp để in rõ | 1–6 | | ☐ |
| H3 | Lưu cấu hình đồ thị | Plot Settings → Save Plot Settings (`.plt`) | | ✅ | | 1–6 | | ☐ |
| H4 | Đổi màu nền khi in | Tools → Control Panel → Waveforms | | 🔄 | | 1–6 | | ☐ |

### I. Lỗi thường gặp

| # | Hiện tượng (PSpice) | Hiện tượng (LTspice) | Cách xử lý | Lab | Đã kiểm |
|---|---|---|---|---|---|
| I1 | Floating node / no DC path | Singular matrix | Thêm GND, nối đủ đường DC | 1 | ☐ |
| I2 | Convergence problem | Analysis failed / Gmin stepping failed | Đổi giá trị đầu, thêm `.options` | 3, 5 | ☐ |
| I3 | Time step too small | Time step too small | Giảm max timestep, kiểm tra mạch chuyển mạch | 2, 5 | ☐ |
| I4 | Model not found | Unknown model / subcircuit | Kiểm `.lib` và đường dẫn tương đối | 2, 4 | ☐ |
| I5 | – | Giá trị `M` bị hiểu là milli | Dùng `meg` cho mega | 1 | ☐ |

---

## 4. Khung so sánh tổng quát (câu hỏi [1])

| Tiêu chí | PSpice for TI | LTspice | Ảnh hưởng đến môn học |
|---|---|---|---|
| Giấy phép, đăng ký | | | |
| Hệ điều hành | | | |
| Thư viện mô hình | | | |
| Các kiểu phân tích | | | |
| Cách khai báo mô phỏng | | | |
| Xuất dữ liệu | | | |
| Nhập mô hình ngoài | | | |
| Giới hạn (số node, kích thước) | | | |

**Ưu điểm khi chuyển đổi:** …
**Nhược điểm khi chuyển đổi:** …

---

## 5. Thao tác phát hiện thêm (thành viên bổ sung)

| # | Người phát hiện | Lab / Ex | Thao tác PSpice | Đề xuất LTspice | Đã đưa vào bảng |
|---|---|---|---|---|---|
| 1 | | | | | ☐ |
| 2 | | | | | ☐ |

---

## 6. Định nghĩa "Hoàn thành"

- [ ] Mọi thao tác trong Ch.1, 2, 3, 5, 6, 7 đều có dòng ánh xạ.
- [ ] 100 % dòng đã kiểm trên phiên bản LTspice thật (☑) và có file minh chứng.
- [ ] Có bản đầy đủ (tiếng Việt) cho mục 3 báo cáo và bản rút gọn (tiếng Anh) cho Appendix Lab Manual.
- [ ] Câu [1] đã viết xong.
- [ ] Đã gửi cho cả nhóm và cập nhật các thao tác ở mục 5.
