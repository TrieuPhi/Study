---
title: "Biến đổi cường độ trong xử lý ảnh"
description: "Các phép biến đổi cường độ pixel và ứng dụng trong xử lý ảnh"
date: 2024-03-21
tags: [image-processing, transformations, intensity]
---

# Biến đổi cường độ trong xử lý ảnh

## 1. Cơ bản về Intensity Transformation

### 1.1 Định nghĩa
- Biến đổi giá trị pixel
- Pixel mapping functions
- Point operations vs Neighborhood operations

### 1.2 Công thức tổng quát

```
s = T(r)
Trong đó:
r là giá trị pixel đầu vào
s là giá trị pixel đầu ra
T là hàm biến đổi
```


## 2. Các phép biến đổi cơ bản

### 2.1 Linear Transformation

```python
def linear_transform(image, a, b):
"""
s = ar + b
a: độ dốc (contrast)
b: độ dời (brightness)
"""
return np.clip(a image + b, 0, 255).astype(np.uint8)
```
### 2.2 Negative Transformation
```python
def negative(image):
"""
s = L - 1 - r
L: số mức xám tối đa (thường là 255)
"""
return 255 - image
```

### 2.3 Log Transformation
```python
def log_transform(image, c):
"""
s = c log(1 + r)
c: hằng số
"""
return c np.log1p(image.astype(float))
```
### 2.4 Power-Law (Gamma) Transformation

```python
def gamma_correction(image, gamma):
"""
s = c r^γ
γ: gamma value
"""
return np.power(image/255.0, gamma) 255.0
```


## 3. Histogram-based Transformations

### 3.1 Histogram Equalization
- Cải thiện contrast
- Phân phối đều các mức xám
- Global vs Local equalization

### 3.2 Histogram Matching
- Specification của histogram
- Matching với histogram mẫu
- Ứng dụng trong color correction

## 4. Piecewise Linear Transformation

### 4.1 Contrast Stretching

```python
def contrast_stretch(image, r1, s1, r2, s2):
"""
Tăng contrast trong khoảng [r1,r2]
"""
result = np.zeros_like(image, dtype=float)
# Define regions
region1 = image <= r1
region2 = (image > r1) & (image < r2)
region3 = image >= r2
# Apply transformation
result[region1] = s1/r1 image[region1]
result[region2] = ((s2-s1)/(r2-r1)) (image[region2]-r1) + s1
result[region3] = ((255-s2)/(255-r2)) (image[region3]-r2) + s2
return np.clip(result, 0, 255).astype(np.uint8)
```


### 4.2 Thresholding
- Binary thresholding
- Multiple thresholds
- Adaptive thresholding

## 5. Color Space Transformations

### 5.1 RGB Transformations
- Channel separation
- Channel mixing
- Color balance

### 5.2 Color Space Conversion
- RGB to Grayscale
- RGB to HSV/HSL
- RGB to LAB

## 6. Advanced Transformations

### 6.1 Local Adaptive Transformations

```python
def adaptive_transform(image, kernel_size, transform_func):
"""
Áp dụng biến đổi cục bộ theo vùng lân cận
"""
result = np.zeros_like(image)
pad = kernel_size // 2
for i in range(pad, image.shape[0] - pad):
for j in range(pad, image.shape[1] - pad):
neighborhood = image[i-pad:i+pad+1, j-pad:j+pad+1]
result[i,j] = transform_func(neighborhood)
return result
```


### 6.2 Multi-scale Transformations
- Pyramid representations
- Scale-space transformations
- Multi-resolution analysis

## 7. Ứng dụng thực tế

### 7.1 Image Enhancement
- Contrast improvement
- Shadow/Highlight recovery
- HDR tone mapping

### 7.2 Image Correction
- Gamma correction
- Color correction
- Exposure correction

### 7.3 Feature Enhancement
- Edge enhancement
- Texture enhancement
- Detail enhancement

## 8. Implementation Tips

### 8.1 Performance Optimization

```python
def optimized_transform(image):
# Use vectorized operations
lut = np.arange(256)
# Apply transformation to LUT
transformed_lut = some_transform(lut)
# Use LUT for transformation
return transformed_lut[image]
```
### 8.2 Memory Management
- In-place operations
- Batch processing
- Memory-efficient algorithms

## 9. Common Issues and Solutions

### 9.1 Quantization Effects
- Banding artifacts
- Dithering techniques
- Bit depth considerations

### 9.2 Edge Effects
- Border handling
- Padding strategies
- Artifact reduction

## 10. Exercises

1. **Basic Transformations**
   - Implement basic intensity transformations
   - Compare different gamma values
   - Visualize transformation curves

2. **Advanced Projects**
   - Build an adaptive contrast enhancement system
   - Implement HDR tone mapping
   - Create a color correction pipeline

[← Fourier Transform] | [Back to Image Processing]