HTTP Toolkit Desktop [![Build Status](https://github.com/httptoolkit/httptoolkit-desktop/workflows/CI/badge.svg)](https://github.com/httptoolkit/httptoolkit-desktop/actions)
===================

Kho lưu trữ này chứa cấu hình build desktop cho [HTTP Toolkit](https://httptoolkit.com) — proxy gỡ lỗi, phân tích và client HTTP(S) đa nền tảng, mã nguồn mở.

Muốn báo lỗi, đề xuất tính năng hoặc gửi phản hồi? Tạo issue hoặc bình chọn issue hiện có tại [github.com/httptoolkit/httptoolkit](https://github.com/httptoolkit/httptoolkit).

## Đây là gì?

Kho lưu trữ này chịu trách nhiệm đóng gói HTTP Toolkit thành bộ cài đặt và file thực thi desktop độc lập để người dùng chạy trực tiếp trên Windows, Linux và macOS.

HTTP Toolkit gồm hai phần runtime: [giao diện người dùng](https://github.com/httptoolkit/httptoolkit-ui), viết dưới dạng ứng dụng web single-page, và [server](https://github.com/httptoolkit/httptoolkit-server), viết dưới dạng ứng dụng CLI Node.js.

Kho lưu trữ này build một file thực thi duy nhất:

* Bao gồm bản build mới nhất của [httptoolkit-server](https://github.com/httptoolkit/httptoolkit-server)
* Khi chạy:
    * Khởi động server ở chế độ nền
    * Mở giao diện trong cửa sổ [Electron](https://electronjs.org/)
    * Dừng server khi đóng ứng dụng

Vì vậy phần lớn nội dung ở đây là cấu hình Electron và cấu hình build cho file thực thi cùng các bộ cài đặt. Dự án dùng [Electron Builder](https://electron.build/).

Đây không phải cách duy nhất để chạy HTTP Toolkit. Đây là lựa chọn tiện nhất cho đa số người dùng, nhưng bạn cũng có thể chạy server như công cụ độc lập và mở giao diện (host tại https://app.httptoolkit.tech) trên trình duyệt bất kỳ.

Lưu ý: file thực thi kết quả _không_ tự cập nhật (hiện tại). Thay vào đó, server (dưới dạng ứng dụng [oclif](http://oclif.io)) và giao diện web (qua service worker) đều có cơ chế tự cập nhật riêng.

Các bản build được thực hiện trên GitHub Actions; bản build gắn nhãn `main` được tự động phát hành dưới dạng [GitHub releases](https://github.com/httptoolkit/httptoolkit-desktop/releases).

## Đóng góp

Nếu bạn muốn thay đổi hành vi của lớp vỏ desktop HTTP Toolkit (không phải nội dung bên trong), cách build, hoặc thêm nền tảng/định dạng mới, bạn đang ở đúng chỗ :+1:.

Xem [CONTRIBUTING.vi.md](CONTRIBUTING.vi.md) để biết cách bắt đầu đóng góp cho kho lưu trữ này.

## Giấy phép

Mã nguồn ứng dụng desktop HTTP Toolkit được cấp phép theo AGPL-3.0, [như ghi trong kho lưu trữ này](/LICENSE).

Tuy nhiên, các bản tải xuống dạng nhị phân trong kho lưu trữ này hoặc từ [httptoolkit.com](https://httptoolkit.com) có thể được sử dụng theo một trong hai giấy phép:

* [AGPL-3.0](/LICENSE), cho người muốn chỉnh sửa và phân phối lại trong phạm vi giấy phép đó.
* [Creative Commons Attribution-NoDerivatives 4.0 International License](https://creativecommons.org/licenses/by-nd/4.0/) cho người không cần các quyền đó và muốn tránh lo ngại về giấy phép AGPL.
