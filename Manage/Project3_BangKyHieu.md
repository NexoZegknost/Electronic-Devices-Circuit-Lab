# CO2037 – Dự án 3 · Bảng ký hiệu thống nhất (Notation Guide)

> **Mục đích:** đáp ứng yêu cầu 9.2 của đề – *"thuật ngữ và ký hiệu nhất quán giữa các bài"*. Cả 3 thành viên dùng chung bảng này khi viết Lab Manual, Solutions, file `.asc` và báo cáo.
> **Nguồn rà soát:** `Lab1_Manual_Ch1.pdf`, `Ch2.pdf`, `Ch3.pdf`, `Ch5.pdf`, `Ch6.pdf` (thư mục `Docs`). `Ch4.pdf` (Altium) ngoài phạm vi. **Chưa có Ch.7** (nguồn của Lab 6) → mục 11 để trống, bổ sung khi có file.
> **Quy ước của file này:** cột *LaTeX* là cách viết trong tài liệu; cột *LTspice* là biểu thức dùng khi vẽ đồ thị / `.meas`; cột *Biến thể trong đề gốc* là các cách viết cũ cần **thay bằng** ký hiệu chuẩn.

**Ánh xạ lab ↔ chương gốc (Bảng 1 của đề):**

| Lab mới | Chương gốc | File trong `Docs` | Phụ trách |
|---|---|---|---|
| Lab 1 | Ch.1 First Project on PSpice | `Lab1_Manual_Ch1.pdf` | Cường |
| Lab 2 | Ch.2 Diode Circuits Analysis | `Ch2.pdf` | Cường |
| Lab 3 | Ch.3 Bipolar Junction Transistor | `Ch3.pdf` | Đạt |
| Lab 4 | Ch.5 Operational Amplifier | `Ch5.pdf` (bỏ mục 4 Altium) | Đạt |
| Lab 5 | Ch.6 Field Effect Transistor | `Ch6.pdf` (bỏ mục 5 Altium) | Đức |
| Lab 6 | Ch.7 24 Hour Project for Midterm | **chưa có** | Đức |
| – | Ch.4 Altium Designer | `Ch4.pdf` | ngoài phạm vi |

---

## 1. Quy tắc chung

| # | Quy tắc | Ví dụ đúng | Tránh |
|---|---|---|---|
| G1 | Đại lượng **DC / giá trị tĩnh**: chữ in hoa, chỉ số in hoa | $V_{CE}$, $I_D$, $V_{GS}$ | `vce`, `Vce` |
| G2 | Đại lượng **tức thời / biến thiên theo thời gian**: chữ thường, có `(t)` | $v_o(t)$, $i_D(t)$ | dùng $V_o$ cho dạng sóng |
| G3 | **Biên độ / đỉnh**: chỉ số `m` (đỉnh), `p-p` (đỉnh–đỉnh) | $V_m$, $V_{r(p\text{-}p)}$ | `Vmax`, `Vpeak` lẫn lộn |
| G4 | Chỉ số là **tên viết tắt** (CE, GS, out, sat, th…) viết **thẳng** (roman); chỉ số là **biến/số thứ tự** viết nghiêng | $V_{\mathrm{CE(sat)}}$, $R_1$, $I_{B1}$ | – |
| G5 | Trạng thái đặc biệt đặt trong ngoặc ở chỉ số | $V_{CE(\mathrm{sat})}$, $I_{C(\mathrm{sat})}$, $R_{DS(\mathrm{on})}$, $V_{GS(\mathrm{Th})}$ | `VCE(Sat)`, `Vce_sat` |
| G6 | **Một nút**: $V_A$ = điện áp nút A so với đất. **Hai nút**: $V_{AB} = V_A - V_B$ | $V_{AB}$ | $U_{CD}$ (Ch.1 dùng `U`) |
| G7 | **Dòng nhánh**: $I_{AB}$ = dòng từ A sang B; dòng qua linh kiện: $I_{R1}$, $I_{D2}$ | $I_{R1}$ | `IR1`, `I R1` |
| G8 | **Công suất hấp thụ** theo quy ước dấu thụ động (passive sign convention): $P > 0$ hấp thụ, $P < 0$ phát | $P_{R_S}$, $P_Z$ | `p2` trong lời văn (giữ chữ thường chỉ khi khớp nhãn hình) |
| G9 | **Ký hiệu trong lời văn phải khớp nhãn trên hình**. Hình vẽ lại bằng LTspice thì đặt nhãn theo bảng này | – | đề hỏi `ID3` nhưng bảng ghi `ID1` (Ch.2 3.5) |
| G10 | Giá trị trong **lời văn**: số – khoảng trắng hẹp – đơn vị SI, dấu thập phân là dấu chấm | `1.5~k$\Omega$`, `10~$\mu$F`, `0.7~V` | `1.5K Ohm`, `1,5k`, `10uF` trong lời văn |
| G11 | Giá trị trên **schematic / netlist LTspice**: hậu tố SPICE, không khoảng trắng, không chữ Ω | `1.5k`, `10µ`, `220`, `1Meg` | `1.5 kΩ`, `1M` (= 1 milli!) |
| G12 | Thuật ngữ tiếng Anh dùng một cách gọi duy nhất cho cả 6 lab (xem mục 10) | *operating point* | lúc *bias point*, lúc *DC operating point* |

---

## 2. Đơn vị và hậu tố SPICE (dùng trong LTspice)

| Hậu tố | Hệ số | Ví dụ | Ghi chú |
|---|---|---|---|
| `T` | $10^{12}$ | – | |
| `G` | $10^{9}$ | – | |
| `Meg` | $10^{6}$ | `1Meg` | **Không** viết `1M` |
| `k` | $10^{3}$ | `4.7k` | |
| `m` | $10^{-3}$ | `100m` (100 ms) | `M` và `m` đều là milli trong SPICE |
| `u` hoặc `µ` | $10^{-6}$ | `680u`, `33µ` | |
| `n` | $10^{-9}$ | `1n` | |
| `p` | $10^{-12}$ | `10p` | |
| `f` | $10^{-15}$ | – | **Bẫy:** `1F` = 1 femto, không phải 1 farad |

- Chữ cái đứng sau hậu tố bị bỏ qua (`10uF` = `10u`), nhưng trong tài liệu thống nhất **không ghi đơn vị** trên schematic.
- Dòng điện, điện áp, thời gian trong lệnh: không ghi đơn vị (`.tran 100m`, không ghi `.tran 100ms`).

---

## 3. Tên linh kiện (reference designator)

| Tiền tố | Linh kiện | Ví dụ | Ghi chú |
|---|---|---|---|
| `R` | Điện trở | `R1`, `RL`, `RS` | Tên đặc biệt: `RL` (tải), `RS` (điện trở nối tiếp Zener), `RB`, `RC`, `RE`, `RD`, `RG`, `RF` (hồi tiếp) |
| `C` | Tụ điện | `C1` | |
| `L` | Cuộn cảm | `L1` | |
| `K` | Hệ số ghép (biến áp) | `K1 L1 L2 1` | Thay *Transformer* của PSpice |
| `D` | Diode, Zener, LED | `D1`, `D2` | LTspice dùng chung prefix `D`; Zener ghi rõ model |
| `Q` | BJT | `Q1`, `Q2` | |
| `J` | JFET | `J1` | |
| `M` | MOSFET | `M1` | |
| `U` | Op-amp, IC (subcircuit từ thư viện) | `U1` | |
| `X` | Subcircuit tự khai báo | `X1` | |
| `V` | Nguồn áp độc lập | `V1`, `VCC`, `VIN` | |
| `I` | Nguồn dòng độc lập | `I1` | |
| `E` | Nguồn áp điều khiển bằng áp (VCVS) | `E1` | Ch.1 Ex.1 |
| `F` | Nguồn dòng điều khiển bằng dòng (CCCS) | `F1` | |
| `G` | Nguồn dòng điều khiển bằng áp (VCCS) | `G1` | |
| `H` | Nguồn áp điều khiển bằng dòng (CCVS) | `H1` | Ch.1 Ex.9 |
| `B` | Nguồn hành vi (behavioral) | `B1` | Dùng khi cần mô hình thay thế |
| `S` / `W` | Công tắc điều khiển áp / dòng | `S1` | Thay công tắc trong mạch opto (Ch.3 3.13) |

**Quy tắc đánh số:** giữ **đúng số thứ tự như hình gốc** khi bài ở trạng thái *Keep*/*Adjust* (để lời văn, bảng so sánh, lời giải khớp nhau). Bài *Replace*: đánh số từ 1, trái sang phải, trên xuống dưới.

---

## 4. Tên nút (net label) trong LTspice

| Quy tắc | LTspice | Trong lời văn |
|---|---|---|
| Đất | `0` (ký hiệu ground) | GND, 0 V |
| Nút có tên chữ cái trong đề | `a`, `b`, `c`… (chữ thường) | $V_A$, $V_B$ |
| Ngõ vào / ngõ ra | `in`, `out` | $V_i$, $V_o$ |
| Đường nguồn | `vcc`, `vdd`, `vee`, `vbb` | $V_{CC}$, $V_{DD}$, $V_{EE}$, $V_{BB}$ |
| Chân BJT đặt tên khi cần đo | `b`, `c`, `e` (mạch 1 transistor); `b1`, `c1`… (nhiều transistor) | $V_B$, $V_C$, $V_E$ |
| Chân FET | `g`, `d`, `s` | $V_G$, $V_D$, $V_S$ |

- LTspice không phân biệt hoa/thường tên nút: `V(OUT)` = `V(out)`. Thống nhất viết **chữ thường**.
- Mọi nút được hỏi trong đề **phải có net label** để sinh viên đọc được `V(tên)`.

---

## 5. Mạch điện cơ bản (Lab 1, dùng chung)

| Ký hiệu | LaTeX | Ý nghĩa | Đơn vị | LTspice | Biến thể trong đề gốc |
|---|---|---|---|---|---|
| $V_S$ | `V_S` | Nguồn áp | V | `V(n)` | `V`, `V1` |
| $I_S$ | `I_S` | Dòng do nguồn cung cấp | A | `-I(V1)` ⚠ | `I S` (Ch.1 Ex.7) |
| $V_A$ | `V_A` | Điện áp nút A | V | `V(a)` | `VA`, `Va` |
| $V_{AB}$ | `V_{AB}` | $V_A - V_B$ | V | `V(a,b)` | `V AB`, `UCD` |
| $I_{AB}$ | `I_{AB}` | Dòng từ A đến B | A | `I(Rx)` | `I AB` |
| $I_{R1}$ | `I_{R1}` | Dòng qua R1 | A | `I(R1)` ⚠ | `I R1`, `IR1` |
| $R_{eq}$ | `R_{eq}` | Điện trở tương đương | Ω | – | `R equivalent`, `Req` |
| $R_{AB}$ | `R_{AB}` | Điện trở tương đương giữa A–B | Ω | `.meas` hoặc $V/I$ | `R ab`, `R AF` |
| $R_{AB(1234)}$ | `R_{AB(1234)}` | $R$ giữa A–B chỉ gồm R1–R4 | Ω | – | `R AB _1234` (Ch.1 Ex.2) |
| $P_X$ | `P_X` | Công suất hấp thụ của phần tử X | W | `V(n1,n2)*I(X)` hoặc Alt+click | `p 2`, `PR` |
| $P_{R(\mathrm{rated})}$ | `P_{R(\mathrm{rated})}` | Công suất định mức điện trở | W | – | `PR` (Ch.1 Ex.5) |
| $\varepsilon\%$ | `\varepsilon\%` | Sai số phần trăm | % | `.meas` | `percent error` |

⚠ **Dấu dòng điện trong LTspice:** `I(V1)` dương khi dòng đi vào cực + của nguồn (nguồn đang hấp thụ). Nguồn cấp điện sẽ hiện **giá trị âm** → dòng cấp là `-I(V1)`. `I(R1)` dương theo chiều chân 1 → chân 2, phụ thuộc chiều đặt điện trở → **kiểm tra dấu khi đọc kết quả** và ghi chú trong guide.

**Công thức sai số dùng chung cho mọi bảng so sánh:**

$$\varepsilon = \frac{\left|X_{\mathrm{sim}} - X_{\mathrm{theory}}\right|}{\left|X_{\mathrm{theory}}\right|}\times 100\%$$

---

## 6. Diode (Lab 2)

| Ký hiệu | LaTeX | Ý nghĩa | Đơn vị | LTspice | Biến thể trong đề gốc |
|---|---|---|---|---|---|
| $V_D$ | `V_D` | Điện áp trên diode (đo được / tính được) | V | `V(a,k)` | `VD`, `V` (bảng Ch.2 3.1) |
| $I_D$ | `I_D` | Dòng qua diode | A | `I(D1)` | `I`, `I D2` |
| $V_F$ | `V_F` | Điện áp ngưỡng **giả định** trong mô hình lý thuyết | V | – | `V f`, "forward voltage", "drop-down voltage" |
| $r_d$ | `r_d` | Điện trở trong (mô hình diode đầy đủ) | Ω | `Rs` (tham số model) | "internal resistor" |
| $V_R$ | `V_R` | Điện áp trên điện trở | V | `V(n1,n2)` | `VR`, `VR1` |
| $V_Z$ | `V_Z` | Điện áp Zener | V | `BV` (tham số model) | `V Z` |
| $I_Z$ | `I_Z` | Dòng qua Zener | A | `I(D1)` (âm khi phân cực ngược ⚠) | `I Z` |
| $I_L$ | `I_L` | Dòng tải | A | `I(RL)` | `I L`, `I RL` |
| $I_{R_S}$ | `I_{R_S}` | Dòng qua điện trở nối tiếp $R_S$ | A | `I(RS)` | `IS` (Ch.2 3.8) – **đổi** vì trùng $I_S$ |
| $V_L$ | `V_L` | Điện áp tải | V | `V(out)` | `VL`, `VRL` |
| $P_Z$, $P_{R_S}$ | `P_Z`, `P_{R_S}` | Công suất Zener, công suất $R_S$ | W | – | `PZ`, `P RS` |
| $V_m$ | `V_m` | Biên độ đỉnh nguồn sin | V | `SINE(0 Vm f)` | `VAMPL` |
| $V_{dc}$ | `V_{dc}` | Giá trị trung bình điện áp ra | V | `.meas AVG` | – |
| $V_{r(p\text{-}p)}$ | `V_{r(p\text{-}p)}` | Độ gợn đỉnh–đỉnh | V | `.meas PP` | – |
| $f$, $T$ | `f`, `T` | Tần số, chu kỳ | Hz, s | – | `FREQ` |
| $n$ | `n = N_1/N_2` | Tỉ số vòng biến áp | – | `L1/L2 = n^2` | `N 1/N 2` |
| $I_s$ | `I_s` | Dòng bão hoà ngược (tham số model) | A | `Is` | – (chỉ dùng ở bài nâng cao / câu [3]) |

**Lưu ý thống nhất:**
- Phân biệt **$V_F$** (hằng số giả định: 0.7 V, 0.7223 V, 0.78 V tuỳ bài) với **$V_D$** (giá trị thực tế trên diode). Đề gốc trộn lẫn hai khái niệm.
- Tên mô hình diode chuẩn hoá ở mục 11; mỗi bài ghi rõ model trong hộp *Components and models*.

---

## 7. BJT (Lab 3)

| Ký hiệu | LaTeX | Ý nghĩa | Đơn vị | LTspice | Biến thể trong đề gốc |
|---|---|---|---|---|---|
| $I_B$, $I_C$, $I_E$ | `I_B`… | Dòng base, collector, emitter | A | `Ib(Q1)`, `Ic(Q1)`, `Ie(Q1)` ⚠ | `I B`, `IB` |
| $V_B$, $V_C$, $V_E$ | `V_B`… | Điện áp nút base / collector / emitter | V | `V(b)`, `V(c)`, `V(e)` | `VB`, `VC` |
| $V_{BE}$ | `V_{BE}` | Áp base–emitter (NPN) | V | `V(b,e)` | `VB E` |
| $V_{EB}$ | `V_{EB}` | Áp emitter–base (PNP) | V | `V(e,b)` | `VE B` |
| $V_{CE}$ | `V_{CE}` | Áp collector–emitter | V | `V(c,e)` | `VC E`, `V CE` |
| $V_{CE(\mathrm{sat})}$ | `V_{CE(\mathrm{sat})}` | Áp $V_{CE}$ khi bão hoà | V | – | `VC E (Sat )` |
| $I_{C(\mathrm{sat})}$ | `I_{C(\mathrm{sat})}` | Dòng collector bão hoà | A | – | `I Sat`, `IC (Sat )` |
| $\beta$ | `\beta` | Hệ số khuếch đại dòng DC ($\beta = I_C/I_B$) | – | `Bf` (tham số model) | `β`, "current gain" |
| $\beta_D$ | `\beta_D` | Hệ số Darlington ($\approx\beta_1\beta_2$) | – | – | `I AL / I BE` |
| $V_{CC}$, $V_{BB}$ | `V_{CC}`, `V_{BB}` | Nguồn collector, nguồn base | V | `V(vcc)` | `Vcc`, `VCC` |
| $R_B$, $R_C$, $R_E$, $R_L$ | `R_B`… | Điện trở base, collector, emitter, tải | Ω | `RB`… | `R B`, `RC` |
| $I_{B(\min)}$, $I_{B(\max)}$ | `I_{B(\min)}` | Giới hạn dòng base | A | – | `I B(mi n)` |
| $I_{\mathrm{REF}}$ | `I_{\mathrm{REF}}` | Dòng tham chiếu gương dòng | A | `I(R1)` | `IC T RL` (Ch.3 3.11) |
| $I_O$ | `I_O` | Dòng ra gương dòng | A | `Ic(Q2)` | `IL` |
| $I_F$ | `I_F` | Dòng thuận LED (opto) | A | `I(D…)` | `I F` |
| $\mathrm{CTR}$ | `\mathrm{CTR}` | Tỉ số truyền dòng ($I_C/I_F$) | – | – | `CTR` |
| $V_{F(\mathrm{LED})}$ | `V_{F(\mathrm{LED})}` | Áp ngưỡng LED | V | – | `VF` |

⚠ **Dấu dòng BJT:** LTspice báo dòng dương khi **đi vào** chân linh kiện → với NPN, `Ie(Q1)` hiện giá trị âm; với PNP, `Ib`, `Ic` âm. Ghi chú này vào LTspice Guide của Lab 3 (cần kiểm chứng lại trên 26.1.1 khi chạy).

**Thuật ngữ vùng làm việc:** *active region*, *saturation region*, *cutoff region*. **Không** dùng "linear mode" (Ch.3 dùng lẫn "linear (or active)").

---

## 8. Op-amp (Lab 4)

| Ký hiệu | LaTeX | Ý nghĩa | Đơn vị | LTspice | Biến thể trong đề gốc |
|---|---|---|---|---|---|
| $V_+$, $V_-$ | `V_+`, `V_-` | Áp tại ngõ vào không đảo / đảo | V | `V(inp)`, `V(inn)` | `V (+)`, `V (−)` |
| $V_i$ | `V_i` | Điện áp vào | V | `V(in)` | `V1`, "input voltage" |
| $V_o$ | `V_o` | Điện áp ra | V | `V(out)` | `VOUT`, `VOU T` |
| $A_v$ | `A_v` | Độ lợi điện áp kín ($V_o/V_i$) | V/V | `V(out)/V(in)` | "gain", "amplifier factor" |
| $A_v\,(\mathrm{dB})$ | `20\log_{10}|A_v|` | Độ lợi theo dB | dB | `dB(V(out)/V(in))` | `20l og (10)` |
| $R_f$, $R_i$ | `R_f`, `R_i` | Điện trở hồi tiếp, điện trở vào | Ω | `RF`, `RI` | `Rf`, `Ri` |
| $f_H$ | `f_H` | Tần số cắt trên (lọc thông thấp) | Hz | `.meas ... WHEN` | `f H` |
| $f_L$ | `f_L` | Tần số cắt dưới (lọc thông cao) | Hz | `.meas` | – |
| $V_{UT}$, $V_{LT}$ | `V_{UT}`, `V_{LT}` | Ngưỡng trên / dưới (Schmitt trigger) | V | – | "high threshold", "low threshold" |
| $V_H$ | `V_H = V_{UT}-V_{LT}` | Độ trễ (hysteresis) | V | – | – |
| $V_{o(\max)}$, $V_{o(\min)}$ | `V_{o(\max)}` | Mức bão hoà ngõ ra | V | – | "toggled at +4V and −4V" |
| $\pm V_{CC}$ | `\pm V_{CC}` | Nguồn nuôi op-amp | V | `V(vcc)`, `V(vee)` | `VPOS`, `VNEG` |
| $\mathrm{GBW}$, $\mathrm{SR}$ | `\mathrm{GBW}` | Tích độ lợi–băng thông, tốc độ quét | Hz, V/µs | tham số model | – (bài nâng cao) |

---

## 9. FET (Lab 5)

| Ký hiệu | LaTeX | Ý nghĩa | Đơn vị | LTspice | Biến thể trong đề gốc |
|---|---|---|---|---|---|
| $I_D$, $I_G$, $I_S$ | `I_D`… | Dòng drain, gate, source | A | `Id(J1)`, `Ig(J1)`, `Is(J1)`; `Id(M1)` | `ID` |
| $V_{GS}$ | `V_{GS}` | Áp gate–source | V | `V(g,s)` | `VGS` |
| $V_{DS}$ | `V_{DS}` | Áp drain–source | V | `V(d,s)` | – |
| $I_{DSS}$ | `I_{DSS}` | Dòng drain bão hoà khi $V_{GS}=0$ (JFET, D-MOSFET) | A | – | `IDSS` |
| $V_P$ | `V_P` | Điện áp thắt kênh (pinch-off) | V | `Vto` (tham số model) | `VP` |
| $V_{GS(\mathrm{Th})}$ | `V_{GS(\mathrm{Th})}` | Điện áp ngưỡng (E-MOSFET) | V | `Vto` (tham số model) | `VTH`, `V TH` |
| $k$ | `k` | Hằng số E-MOSFET: $I_D = k(V_{GS}-V_{GS(\mathrm{Th})})^2$ | A/V² | – | – |
| $g_m$ | `g_m` | Hỗ dẫn | S | – | – (bài nâng cao) |
| $R_{DS(\mathrm{on})}$ | `R_{DS(\mathrm{on})}` | Điện trở dẫn của MOSFET | Ω | `V(d,s)/Id(M1)` | – (bài nâng cao) |
| $V_{DD}$, $V_{GG}$ | `V_{DD}`… | Nguồn drain, nguồn gate | V | `V(vdd)` | `VDD`, `+VDD`, `-VDD` |
| $R_D$, $R_S$, $R_G$ | `R_D`… | Điện trở drain, source, gate | Ω | `RD`… | – |
| $R_{IN}$, $R_{GS}$ | `R_{IN}`, `R_{GS}` | Điện trở vào, điện trở kéo xuống gate | Ω | `RIN`, `RGS` | `RIN`, `RGS` (giữ nguyên) |
| $V_{IN}$ | `V_{IN}` | Mức logic điều khiển (TTL: 0 V / 5 V) | V | `PULSE(0 5 …)` | `VIN` |

**Phương trình Shockley (JFET, D-MOSFET) – dùng một dạng duy nhất:**

$$I_D = I_{DSS}\left(1 - \frac{V_{GS}}{V_P}\right)^2$$

**Thuật ngữ:** *JFET*, *depletion-type MOSFET (D-MOSFET)*, *enhancement-type MOSFET (E-MOSFET)*; *ohmic region*, *saturation region*, *cutoff region*. **Không** dùng *DFET*, *EFET*, *JUGFET*, *eMOSFET* như đề gốc.

---

## 10. Nguồn tín hiệu và lệnh mô phỏng

### 10.1 Thông số nguồn (đổi từ PSpice)

| PSpice for TI | Tham số PSpice | LTspice | Ghi chú |
|---|---|---|---|
| `VDC` | `DC` | `V1 n 0 5` | |
| `VSIN` | `VOFF VAMPL FREQ` | `SINE(Voffset Vamp Freq)` | Đề gốc gọi `VAMPL` là "Amplifier voltage" → sửa thành *amplitude* |
| `VPULSE` | `V1 V2 TD TR TF PW PER` | `PULSE(V1 V2 Tdelay Trise Tfall Ton Tperiod)` | Thứ tự tham số giống nhau (Ch.3 3.12) |
| `VAC` | `ACMAG` | `AC 1` trong ô *Small signal AC analysis* | Dùng cho `.ac` |

### 10.2 Kiểu phân tích – tên gọi thống nhất

| Tên trong đề gốc | Tên dùng trong tài liệu mới | Lệnh LTspice | Ví dụ |
|---|---|---|---|
| Bias Point | **Operating point** | `.op` | `.op` |
| DC Sweep | **DC sweep** | `.dc` | `.dc V1 0 5 0.1` |
| Nested DC Sweep | **Nested DC sweep** | `.dc` 2 nguồn | `.dc V2 0 10 0.1 V3 -3 0 0.5` |
| Time Domain (Transient) | **Transient analysis** | `.tran` | `.tran 0 100m 0 0.1m` |
| AC Sweep | **AC analysis** | `.ac` | `.ac lin 200 1 50k` |
| Parametric sweep | **Parameter sweep** | `.step` | `.step param R 1k 10k 1k` |
| Measurement / cursor | **Measurement** | `.meas` | `.meas DC Iat1V FIND I(D1) AT 1` |
| Temperature | **Temperature sweep** | `.temp` / `.step temp` | `.step temp -25 100 25` |
| – | **Fourier analysis** | `.four` | `.four 50 V(out)` |

### 10.3 Thao tác – tên gọi thống nhất

| Đề gốc (PSpice) | Dùng trong tài liệu mới (LTspice) |
|---|---|
| Simulation Profile | *simulation command* (SPICE directive) |
| Trace / Add Trace | *plot* / *Add Traces* |
| Voltage/Level Marker, Current Marker | *voltage probe*, *current probe* (click lên dây / chân linh kiện) |
| Voltage Differential Markers | *differential voltage probe* (kéo từ nút này sang nút kia) |
| Probe Cursor / Toggle Cursor | *cursor* |
| Enable Bias Voltage/Current Display | *operating point labels* / *SPICE Error Log* |
| Copy to Clipboard → Notepad | *File → Export data as text* |
| Favourites list / Place → PSpice Component | *Component (F2)* |

---

## 11. Mô hình linh kiện – tên chuẩn hoá (đề xuất, cần kiểm chứng)

> Mỗi bài ghi rõ model trong `\components{...}`. Tên dưới đây là **đề xuất ban đầu**; bảng ánh xạ của Cường chốt tên cuối cùng sau khi chạy thử trên bộ cài offline.

| Đề gốc (PSpice for TI) | Chương | Đề xuất LTspice | Trạng thái dự kiến |
|---|---|---|---|
| `Dbreak` | Ch.2 | Diode mặc định `D` (không tham số) hoặc `1N4148` | Adjust (câu [3] so sánh cả hai) |
| `Zener_P` (`Zenner_P` trong đề) | Ch.2 | `.model` Zener tự khai báo với `BV` = $V_Z$ | Adjust |
| `LM2596_5P0_TRANS` | Ch.2 | IC buck có sẵn trong thư viện ADI (câu [5]) | Replace |
| Transformer (System Modules) | Ch.2 | `L1`, `L2` + `K1 L1 L2 1` | Adjust |
| `QBreakN` ($\beta = 100$) | Ch.3 | `.model` NPN với `BF=100` hoặc `2N3904` | Adjust |
| PNP (Ch.3 3.6–3.7) | Ch.3 | `.model` PNP với `BF=100` hoặc `2N3906` | Adjust |
| Optocoupler `OK1` | Ch.3 | Mô hình tương đương (LED + nguồn dòng điều khiển, CTR = 2) | Replace/Adjust |
| `OPAMP` (VPOS, VNEG) | Ch.5 | `UniversalOpAmp` / op-amp ADI tương đương | Adjust |
| `LM358` (nếu dùng) | Ch.5 | Kiểm tra có trong thư viện; nếu không thì op-amp ADI | Adjust |
| `JbreakN` | Ch.6 | `NJF` với `Vto`, `Beta` khai báo rõ | Adjust |
| `MbreakND` (D-MOSFET) | Ch.6 | `.model` tự khai báo (`Vto < 0`) | Adjust |
| `MbreakN` (E-MOSFET) | Ch.6 | `.model` NMOS / VDMOS với `Vto > 0` | Adjust |

---

## 12. Lab 6 (Ch.7 – 24 Hour Project for Midterm)

Chưa có file nguồn trong thư mục `Docs`. Lab 6 là bài tổng hợp (điện trở tương đương, dòng điện, diode, Zener, BJT, BJT + Zener) nên **dùng lại ký hiệu của mục 5, 6, 7**. Khi có `Ch7.pdf`, rà lại và bổ sung các ký hiệu riêng vào đây.

---

## 13. Lỗi và chỗ không nhất quán trong đề gốc (không chép sang tài liệu mới)

| Chương | Vị trí | Vấn đề | Sửa thành |
|---|---|---|---|
| Ch.1 | Ex.2 | Quy ước `R AB _1234` khác cách viết `RC D_3456`, `RB E` | $R_{AB(1234)}$, $R_{CD(3456)}$, $R_{BE}$ |
| Ch.1 | Ex.9 | Dùng `UCD` (ký hiệu U cho điện áp) | $V_{CD}$ |
| Ch.1 | Ex.7 | `R equi v al ent` | $R_{eq}$ |
| Ch.2 | 3.1 | "above simulation circuit (Figure 1.2)" – sai số hình | Hình 2.1 |
| Ch.2 | 3.1 bảng | Cột PSpice ghi `V` thay cho $V_D$ | $V_D$ |
| Ch.2 | 3.3 bảng | Cột PSpice ghi `VR4` thay cho $I_{R4}$ | $I_{R4}$ |
| Ch.2 | 3.5 | Lời văn hỏi `ID3`, `ID4`; bảng ghi `ID1`, `ID2` | Theo nhãn hình vẽ lại |
| Ch.2 | 3.6 / 3.7 | $V_f$ = 0.78 V và 0.7 V, viết `V f` | $V_F$, ghi giá trị trong từng bài |
| Ch.2 | 3.8 | `IS` là dòng qua $R_S$ – trùng $I_S$ (dòng nguồn / dòng bão hoà) | $I_{R_S}$ |
| Ch.2 | 3.8 | `Zenner_P` | `Zener_P` (chỉ nhắc khi đối chiếu PSpice) |
| Ch.2 | 3.10 | Tiêu đề "Exercise 8" trong mục 3.10 | Đánh số theo lab mới |
| Ch.2 | 3.6 | "Amplifier voltage" (VAMPL) | *amplitude* |
| Ch.3 | 2 | "linear (or active) mode" | *active region* |
| Ch.3 | 3.4 | `Vt er` | $V_{\mathrm{ter}}$ hoặc $V_{\mathrm{logic}}$ (chọn 1) |
| Ch.3 | 3.9 | `I BE`, `I AC`, `I AL` | $I_{B1}$, $I_C$, $I_L$ theo nhãn hình |
| Ch.3 | 3.11 | `IC T RL` | $I_{\mathrm{REF}}$ |
| Ch.3 | 3.11 | "called circuit mirror" | *current mirror* |
| Ch.5 | 1 | "cooperator" | *comparator* |
| Ch.5 | 2.1, 3.x | `VOUT`, `V (+)` | $V_o$, $V_+$ |
| Ch.5 | 3.5 | `20log(7) = 16.9` thiếu đơn vị | 16.9 dB |
| Ch.6 | 1 | JFET input impedance "thousands of Ohms" | Kiểm tra lại (thường là MΩ trở lên) |
| Ch.6 | 2 | "JUGFET"; "has no PN-junctions" (chỉ đúng với đường dẫn dòng drain–source) | *JFET*; nói rõ tiếp giáp PN nằm ở cực gate |
| Ch.6 | 2.1 | $I_{DSS}$ = 400 mA với `JbreakN` | Kiểm tra lại đơn vị khi chạy model LTspice |
| Ch.6 | 3.x | `DFET`, `EFET`, `eMOSFET`, `VTH` | D-MOSFET, E-MOSFET, $V_{GS(\mathrm{Th})}$ |
| Chung | – | "bellow", "supple", "Volate", "half-ware", "archived" | below, supply, Voltage, half-wave, achieved |

---

## 14. Macro LaTeX đề xuất (thêm vào `shared/preamble.tex` nếu nhóm đồng ý)

```latex
% ---- Ký hiệu thống nhất (Project3_BangKyHieu.md) ----
\newcommand{\VCEsat}{V_{CE(\mathrm{sat})}}
\newcommand{\ICsat}{I_{C(\mathrm{sat})}}
\newcommand{\VGSth}{V_{GS(\mathrm{Th})}}
\newcommand{\RDSon}{R_{DS(\mathrm{on})}}
\newcommand{\Vrpp}{V_{r(p\text{-}p)}}
\newcommand{\IRS}{I_{R_S}}
\newcommand{\Iref}{I_{\mathrm{REF}}}
\newcommand{\Req}{R_{eq}}
\newcommand{\unit}[2]{#1\,\mathrm{#2}}   % \unit{4.7}{k\Omega} -> 4.7 kΩ
```

> Dùng macro giúp đổi ký hiệu một chỗ là cập nhật cả 6 lab và bản lời giải.

---

## 15. Việc cần làm với bảng này

- [ ] Cả nhóm đọc và thống nhất (đặc biệt mục 1, 9, 13) trước khi viết tiếp Lab 1–5.
- [ ] Cường đối chiếu mục 10–11 với bảng ánh xạ PSpice → LTspice, kiểm trên LTspice 26.1.1.
- [ ] Kiểm chứng các dòng có dấu ⚠ (dấu dòng điện) khi chạy bài đầu tiên của Lab 1 và Lab 3.
- [ ] Bổ sung mục 12 khi có `Ch7.pdf`.
- [ ] Rút gọn mục 1, 5–9 thành 1 trang tiếng Anh *Notation* cho Appendix của Lab Manual.
