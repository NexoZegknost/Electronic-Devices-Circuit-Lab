# CO2037 – Dự án 3 · Ruleset

## Phạm vi
1. Chỉ dùng LTspice, cả nhóm dùng chung một phiên bản. Không làm Altium, PCB hay thi công mạch.
2. Gồm 6 lab: Ch.1→Lab 1, Ch.2→Lab 2, Ch.3→Lab 3, Ch.5→Lab 4, Ch.6→Lab 5, Ch.7→Lab 6.

## Nội dung lab
3. Mỗi lab gồm Introduction, LTspice Guide có ảnh chụp, **đúng 10 Ex** và **ít nhất 2 Adv**.
4. Mỗi Ex có sơ đồ mạch, phần lý thuyết **để trống**, phần cấu hình mô phỏng và bảng so sánh LT–MP.
5. Mỗi Ex gắn nhãn **Keep / Adjust / Replace**. Bài Adjust hoặc Replace phải ghi lý do và mục tiêu học tập được giữ lại.
6. Ghi rõ giá trị linh kiện và tên model. Tài liệu lab viết bằng **tiếng Anh**, thuật ngữ thống nhất giữa 6 lab.
7. Mọi hình đều chụp từ LTspice, in ra phải rõ, có đánh số và chú thích.

## File mô phỏng
8. Đặt tên theo mẫu `LabN/Ex01..Ex10.asc` và `LabN/Adv01..asc`, mỗi bài một file.
9. Thư viện bổ sung để trong `lib/` và gọi bằng đường dẫn tương đối. File phải **chạy được trên máy cài offline sạch**.
10. Dùng `.meas` để lấy các giá trị cần so sánh.

## Số liệu & lời giải
11. Số liệu **chỉ lấy từ lần chạy LTspice thật** của nhóm, không dùng số do AI sinh ra.
12. Ghi sai lệch LT–MP bằng % và giải thích nguyên nhân.
13. Lời giải chỉ nằm trong file dành cho giảng viên.

## AI
14. Được dùng AI để tra cứu, sinh netlist, viết nháp, gợi ý bài tập và rà lỗi.
15. Lần nào AI ảnh hưởng tới kết quả thì ghi ngay vào **Nhật ký AI**, kèm cách kiểm chứng.

## Nhóm
16. Mỗi người phụ trách 2 lab nhưng **phải giải thích được cả 6 lab** khi vấn đáp.
17. Mỗi lab phải được **người khác** chạy lại từ đầu đến cuối (kiểm thử chéo). Chỉ khi sửa hết lỗi lab mới tính là xong.
18. Thay đổi chung như template, thuật ngữ, thư mục hay phiên bản phải được cả nhóm thống nhất trước.

## Nộp bài
19. Nộp `MSSV1_MSSV2_MSSV3_Project3.zip` gồm:
    - tài liệu lab (.pdf và .docx hoặc .tex)
    - lời giải (.pdf)
    - thư mục .asc (.zip)
    - hướng dẫn cài offline (.pdf)
    - báo cáo theo mẫu Phần B (.docx và .pdf), trả lời đủ câu [1]–[9]
