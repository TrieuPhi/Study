---
title: "Biến đổi hình học trong xử lý ảnh"
description: "Các phép biến đổi hình học cơ bản trong xử lý ảnh"
date: 2024-03-21
tags: [image-processing, transformations, geometric]
---

# Biến đổi hình học trong xử lý ảnh

## 1. Giới thiệu

Biến đổi hình học là các phép biến đổi thay đổi vị trí của pixels trong ảnh mà không thay đổi giá trị của chúng.

## 2. Các phép biến đổi cơ bản

### 2.1 Translation (Tịnh tiến)
- Di chuyển ảnh theo vector (tx, ty)
- Ma trận biến đổi:
```python
[[1, 0, tx],
[0, 1, ty],
[0, 0, 1 ]]
```
### 2.2 Rotation (Xoay)
- Xoay ảnh quanh một điểm với góc θ
- Ma trận biến đổi:

```python
[[cos θ, -sin θ, 0],
[sin θ, cos θ, 0],
[0, 0, 1]]
```


### 2.3 Scaling (Co giãn)
- Thay đổi kích thước ảnh
- Uniform vs Non-uniform scaling
- Ma trận biến đổi:
```python
[[sx, 0, 0],
[0, sy, 0],
[0, 0, 1]]
```

### 2.4 Shearing (Cắt)
- Biến đổi làm nghiêng ảnh
- Horizontal vs Vertical shearing

## 3. Phép biến đổi affine

### 3.1 Định nghĩa
- Kết hợp của translation, rotation, scaling, và shearing
- Bảo toàn tính song song của đường thẳng

### 3.2 Ma trận biến đổi

```python
[[a, b, tx],
[c, d, ty],
[0, 0, 1 ]]
```

## 4. Phép biến đổi perspective

### 4.1 Định nghĩa
- Biến đổi phối cảnh
- Không bảo toàn tính song song
- Sử dụng ma trận 3x3

### 4.2 Ứng dụng
- Camera calibration
- Image rectification
- Document scanning

## 5. Interpolation Methods

### 5.1 Nearest Neighbor
- Đơn giản nhất
- Chất lượng thấp nhất
- Nhanh nhất

### 5.2 Bilinear
- Sử dụng 4 pixel lân cận
- Chất lượng trung bình
- Tốc độ vừa phải

### 5.3 Bicubic
- Sử dụng 16 pixel lân cận
- Chất lượng cao nhất
- Chậm nhất

## 6. Implementation

### 6.1 Using OpenCV

```python
import cv2
import numpy as np
def geometric_transformations(image):
# Translation
M = np.float32([[1, 0, 100], [0, 1, 50]])
translated = cv2.warpAffine(image, M, (image.shape[1], image.shape[0]))
# Rotation
center = (image.shape[1]//2, image.shape[0]//2)
M = cv2.getRotationMatrix2D(center, 45, 1.0)
rotated = cv2.warpAffine(image, M, (image.shape[1], image.shape[0]))
# Scaling
scaled = cv2.resize(image, None, fx=2, fy=2, interpolation=cv2.INTER_CUBIC)
return translated, rotated, scaled
```
### 6.2 Using NumPy
```python
def manual_rotation(image, angle):
# Convert angle to radians
theta = np.radians(angle)
# Calculate center
center_x, center_y = image.shape[1]//2, image.shape[0]//2
# Create rotation matrix
cos_theta = np.cos(theta)
sin_theta = np.sin(theta)
# Apply rotation
for y in range(image.shape[0]):
for x in range(image.shape[1]):
# Center coordinates
xc = x - center_x
yc = y - center_y
# Rotate
new_x = int(xc cos_theta - yc sin_theta + center_x)
new_y = int(xc sin_theta + yc cos_theta + center_y)
```


## 7. Common Issues and Solutions

### 7.1 Border Handling
- Constant border
- Reflect border
- Wrap border
- Transparent border

### 7.2 Performance Optimization
- Vectorization
- GPU acceleration
- Caching transformations

## 8. Practical Applications

1. **Image Registration**
   - Medical imaging
   - Satellite imagery
   - Panorama stitching

2. **Object Tracking**
   - Motion estimation
   - Feature tracking
   - Video stabilization

3. **Augmented Reality**
   - Camera pose estimation
   - Object placement
   - Scene understanding

## 9. Best Practices

1. **Choosing Interpolation Method**
   - Use nearest neighbor for masks/labels
   - Use bilinear for real-time applications
   - Use bicubic for high-quality results

2. **Optimization Tips**
   - Pre-compute transformation matrices
   - Use appropriate data types
   - Consider memory constraints

## 10. Exercises

1. Implement a basic image rotation function without using OpenCV
2. Create a function that applies multiple transformations sequentially
3. Build a simple document scanner using perspective transformation

[← Back to Image Processing] | [Fourier Transform →]