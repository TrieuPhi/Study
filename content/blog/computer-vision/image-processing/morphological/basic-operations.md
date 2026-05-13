---
title: "Các phép toán hình thái học cơ bản"
description: "Giới thiệu về các phép toán hình thái học cơ bản trong xử lý ảnh"
date: 2024-03-21
tags: [image-processing, morphological, basic]
---

# Phép toán hình thái học cơ bản

## 1. Giới thiệu

### 1.1 Định nghĩa
- Morphological operations là các phép toán xử lý ảnh dựa trên hình dạng
- Thường áp dụng cho ảnh nhị phân (binary images)
- Có thể mở rộng cho ảnh grayscale

### 1.2 Structuring Element (SE)
- Kernel định nghĩa hình dạng và kích thước của operation
- Các loại SE phổ biến: square, cross, disk
- Ảnh hưởng của kích thước SE

## 2. Phép toán Dilation (Giãn nở)

### 2.1 Nguyên lý
- Mở rộng đối tượng trong ảnh
- Lấp đầy các lỗ nhỏ
- Kết nối các thành phần gần nhau

### 2.2 Implementation

```python
def dilation(image, kernel_size):
"""
Thực hiện phép giãn nở
"""
kernel = np.ones((kernel_size, kernel_size), np.uint8)
return cv2.dilate(image, kernel, iterations=1)
```


## 3. Phép toán Erosion (Co)

### 3.1 Nguyên lý
- Thu nhỏ đối tượng trong ảnh
- Loại bỏ các chi tiết nhỏ
- Tách các đối tượng kết nối yếu

### 3.2 Implementation

```python
def erosion(image, kernel_size):
"""
Thực hiện phép co
"""
kernel = np.ones((kernel_size, kernel_size), np.uint8)
return cv2.erode(image, kernel, iterations=1)
```


## 4. Phép toán Opening

### 4.1 Nguyên lý
- Erosion sau đó Dilation
- Loại bỏ nhiễu nhỏ
- Giữ nguyên kích thước tổng thể

### 4.2 Implementation

```python
def opening(image, kernel_size):
"""
Thực hiện phép mở
"""
kernel = np.ones((kernel_size, kernel_size), np.uint8)
return cv2.morphologyEx(image, cv2.MORPH_OPEN, kernel)
```


## 5. Phép toán Closing

### 5.1 Nguyên lý
- Dilation sau đó Erosion
- Lấp đầy lỗ nhỏ
- Kết nối các đối tượng gần nhau

### 5.2 Implementation

```python
def closing(image, kernel_size):
"""
Thực hiện phép đóng
"""
kernel = np.ones((kernel_size, kernel_size), np.uint8)
return cv2.morphologyEx(image, cv2.MORPH_CLOSE, kernel)
```

## 6. Ứng dụng cơ bản

### 6.1 Noise Removal

```python
def remove_noise(binary_image):
"""
Loại bỏ nhiễu sử dụng opening
"""
return opening(binary_image, 3)
```

### 6.2 Hole Filling

```python
def fill_holes(binary_image):
"""
Lấp đầy lỗ sử dụng closing
"""
return closing(binary_image, 3)
```


## 7. Best Practices

### 7.1 Chọn Structuring Element
- Kích thước phù hợp với đối tượng
- Hình dạng phù hợp với bài toán
- Cân nhắc computational cost

### 7.2 Sequence of Operations
- Thứ tự các phép toán
- Số lần lặp
- Kết hợp các phép toán

## 8. Common Issues

### 8.1 Border Effects
- Xử lý biên
- Padding strategies
- Edge preservation

### 8.2 Performance
- Optimizing kernel size
- Efficient implementations
- GPU acceleration

## 9. Exercises

1. **Basic Operations**
   - Implement basic morphological operations
   - Compare different SE shapes
   - Analyze effect of kernel size

2. **Applications**
   - Text cleaning in documents
   - Object counting
   - Boundary detection

[← Filtering] | [Advanced Operations →]

