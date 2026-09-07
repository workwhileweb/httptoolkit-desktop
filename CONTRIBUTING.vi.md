# Đóng góp cho HTTP Toolkit Desktop

Cảm ơn bạn đã giúp cải thiện HTTP Toolkit. Tài liệu này giải thích cách nhanh nhất để bắt đầu làm việc trên lớp vỏ desktop và cách đóng góp thay đổi.

## Yêu cầu trước

- Node: >= 22 (kho lưu trữ này nhắm tới Node 22.x). Nên dùng nvm để quản lý phiên bản Node.
- Để dùng phiên bản đã ghim (nếu đã cài nvm):
  - `nvm install` — cài phiên bản trong `.nvmrc`
  - `nvm use`
- Hoặc dùng Node hệ thống nếu đáp ứng yêu cầu phiên bản tối thiểu.

## Bắt đầu

- Clone kho lưu trữ này.
- Cài dependency: `npm install`
- Để build và chạy ứng dụng Electron cục bộ:
  - `npm start` — chạy ứng dụng desktop, tải server live mới nhất và dùng giao diện live từ `app.httptoolkit.tech`.
    - Hữu ích khi chỉ làm việc trên ứng dụng desktop và muốn thử với môi trường live thật.
  - `npm run start:dev` — chạy ứng dụng desktop không kèm server tích hợp, dùng giao diện từ `http://localhost:8080`.
    - Hữu ích khi bạn chạy giao diện và/hoặc server cục bộ và muốn lớp vỏ desktop host giao diện đó.
    - Để làm việc trên giao diện và xem trong ứng dụng desktop, khởi động dự án UI (https://github.com/httptoolkit/httptoolkit-ui) bằng `npm start`.
    - Hoặc chạy dự án server (https://github.com/httptoolkit/httptoolkit-server) bằng `npm start`, và `npm run start:web` trong dự án UI để chạy server + giao diện cục bộ.
- Để build gói phân phối:
  - `npm run build` — build và đóng gói ứng dụng desktop cho nền tảng hiện tại.

## Một vài gợi ý

- Hành vi dev của Electron không giống hệt bản build production — hãy xác minh thay đổi trên bản build thật.
- Phần lớn cấu hình build phân phối nằm trong trường `build` của `package.json`.

## Báo cáo vấn đề

- Với lỗi hoặc đề xuất tính năng liên quan đến HTTP Toolkit nói chung, nên tạo issue tại kho chính: https://github.com/httptoolkit/httptoolkit/
- Với vấn đề riêng lớp vỏ desktop này (đóng gói, hành vi Electron, bộ cài), tạo issue trong kho lưu trữ này.

## Thay đổi và pull request

- Tạo nhánh tính năng từ `main` cho mỗi thay đổi.
- Giữ PR tập trung và mô tả rõ vấn đề cùng cách giải quyết.
- Đảm bảo TypeScript biên dịch được: `npm run build:src`
- Nếu thay đổi ảnh hưởng đóng gói hoặc bước build, kèm hướng dẫn tái hiện cục bộ.
- CI phải pass trước khi merge; maintainer sẽ review và merge.

## Phong cách code và kiểm thử

- Dự án dùng TypeScript. Tuân theo pattern và phong cách code hiện có.
- Chạy trình biên dịch TypeScript để kiểm tra lỗi: `npm run build:src`
