---
title: "YOLO-based Object Detection System"
---

---
title: "YOLO-based Object Detection System"
---

# Mục lục

- [[#I. Dẫn nhập|I. Dẫn nhập]]
- [[#II. Cơ sở lý thuyết về Object Detection|II. Cơ sở lý thuyết về Object Detection]]
    - [[#II.1. Sự phát triển của dòng họ YOLO|II.1. Sự phát triển của dòng họ YOLO]]
    - [[#II.2. Kiến trúc YOLOv8/v11|II.2. Kiến trúc YOLOv8/v11]]
    - [[#II.3. Các hàm mất mát (Loss Functions)|II.3. Các hàm mất mát (Loss Functions)]]
- [[#III. Thư viện Ultralytics|III. Thư viện Ultralytics]]
    - [[#III.1. Giới thiệu|III.1. Giới thiệu]]
    - [[#III.2. CLI và Python SDK|III.2. CLI và Python SDK]]
- [[#IV. Thực hành|IV. Thực hành]]
    - [[#IV.1. Chuẩn bị môi trường và cấu trúc dự án|IV.1. Chuẩn bị môi trường và cấu trúc dự án]]
    - [[#IV.2. Thu thập và dán nhãn dữ liệu (Roboflow/LabelImg)|IV.2. Thu thập và dán nhãn dữ liệu (Roboflow/LabelImg)]]
    - [[#IV.3. Huấn luyện mô hình (Training)|IV.3. Huấn luyện mô hình (Training)]]
    - [[#IV.4. Đánh giá mô hình (Validation)|IV.4. Đánh giá mô hình (Validation)]]
    - [[#IV.5. Export và Inference (TensorRT/OpenVINO)|IV.5. Export và Inference (TensorRT/OpenVINO)]]
    - [[#IV.6. Xây dựng ứng dụng Real-time|IV.6. Xây dựng ứng dụng Real-time]]
- [[#V. Câu hỏi trắc nghiệm|V. Câu hỏi trắc nghiệm]]
- [[#Phụ lục|Phụ lục]]

---

## I. Dẫn nhập
Giới thiệu về bài toán nhận diện vật thể thời gian thực và tầm quan trọng của dòng mô hình YOLO.

## II. Cơ sở lý thuyết về Object Detection
Các khái niệm cơ bản về thị giác máy tính.

### II.1. Sự phát triển của dòng họ YOLO
Từ YOLOv1 đến các phiên bản hiện đại như YOLOv11.

### II.2. Kiến trúc YOLOv8/v11
Phân tích Backbone, Neck và Head của mô hình.

### II.3. Các hàm mất mát (Loss Functions)
Tìm hiểu về Focal Loss, IoU Loss và cách mô hình tối ưu hóa.

## III. Thư viện Ultralytics
Hệ sinh thái chính để làm việc với YOLO hiện nay.

### III.1. Giới thiệu
Các tính năng nổi bật của Ultralytics.

### III.2. CLI và Python SDK
Hướng dẫn sử dụng dòng lệnh và thư viện Python.

## IV. Thực hành
Quy trình xây dựng dự án từ đầu.

### IV.1. Chuẩn bị môi trường và cấu trúc dự án
Cài đặt `ultralytics`, `opencv-python`, `torch`.

### IV.2. Thu thập và dán nhãn dữ liệu (Roboflow/LabelImg)
Cách tạo dataset chuẩn format YOLO.

### III.3. Huấn luyện mô hình (Training)
Thiết lập các tham số: epoch, batch size, learning rate.

### IV.4. Đánh giá mô hình (Validation)
Phân tích Mean Average Precision (mAP) và Confusion Matrix.

### IV.5. Export và Inference (TensorRT/OpenVINO)
Tối ưu hóa mô hình để chạy trên các thiết bị phần cứng cụ thể.

### IV.6. Xây dựng ứng dụng Real-time
Tích hợp camera và hiển thị kết quả thời gian thực.

## V. Câu hỏi trắc nghiệm
Kiểm tra kiến thức về Object Detection và YOLO.

## Phụ lục
Link dataset, weight đã huấn luyện và tài liệu đọc thêm.

