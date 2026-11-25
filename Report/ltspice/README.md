# File mô phỏng LTspice (sản phẩm 3)

Mỗi bài tập một file, đặt đúng tên (đề bắt buộc):

```
ltspice/
├── lib/            model / subckt / symbol bổ sung (.lib .sub .asy) -- gọi bằng đường dẫn tương đối
├── Lab1/  Ex01.asc … Ex10.asc, Adv01.asc, Adv02.asc
├── Lab2/  …
└── Lab6/  …
```

Quy tắc:
- Lệnh mô phỏng (.op/.dc/.tran/.ac/.step/.meas) đặt ngay trên schematic.
- Model bổ sung gọi bằng `.lib ../lib/<tên>.lib` (đường dẫn tương đối), không dùng đường dẫn tuyệt đối của máy cá nhân.
- Không cần nộp .raw / .log / .net (LTspice tự sinh lại).
- Trước khi nộp: mở và chạy MỌI file trên máy cài offline sạch.
