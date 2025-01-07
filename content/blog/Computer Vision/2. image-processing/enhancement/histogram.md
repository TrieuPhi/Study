---
title: "Cải thiện ảnh bằng Histogram"
description: "Các kỹ thuật cải thiện ảnh dựa trên histogram"
date: 2024-03-21
tags: [image-processing, enhancement, histogram]
---

# Histogram Enhancement trong Xử lý ảnh

## 1. Cơ bản về Histogram

### 1.1 Định nghĩa
- Histogram là biểu đồ phân phối cường độ pixel
- Thể hiện tần suất xuất hiện của các mức xám
- Công cụ quan trọng trong phân tích và cải thiện ảnh

### 1.2 Tính toán Histogram

```python
def compute_histogram(image):
"""
Tính histogram của ảnh grayscale
"""
histogram = np.zeros(256)
for pixel in image.flat:
histogram[pixel] += 1
return histogram
def normalize_histogram(histogram, total_pixels):
"""
Chuẩn hóa histogram
"""
return histogram / total_pixels
```

## 2. Histogram Equalization

### 2.1 Nguyên lý
- Phân phối lại các mức xám
- Tăng contrast toàn cục
- Công thức biến đổi:
```python
def histogram_equalization(image):
# Tính histogram tích lũy
hist = compute_histogram(image)
cdf = np.cumsum(hist)
cdf_normalized = cdf 255 / cdf[-1]
# Áp dụng biến đổi
return cdf_normalized[image]
```


### 2.2 Adaptive Histogram Equalization (AHE)
- Cải thiện cục bộ
- Xử lý theo từng vùng nhỏ
- Contrast Limited AHE (CLAHE)

## 3. Histogram Matching

### 3.1 Specification
- Điều chỉnh histogram theo mẫu
- Bảo toàn đặc trưng của ảnh gốc
- Ứng dụng trong color grading

### 3.2 Implementation

```python
def histogram_matching(source, reference):
"""
Điều chỉnh histogram của source theo reference
"""
# Tính CDF cho cả hai ảnh
src_hist = compute_histogram(source)
ref_hist = compute_histogram(reference)
src_cdf = np.cumsum(src_hist)
ref_cdf = np.cumsum(ref_hist)
# Tạo mapping function
mapping = np.zeros(256)
j = 0
for i in range(256):
while j < 256 and ref_cdf[j] < src_cdf[i]:
j += 1
mapping[i] = j
return mapping[source]
```


## 4. Multi-channel Histogram Processing

### 4.1 Color Histograms
- RGB channels
- HSV/LAB spaces
- Joint histograms

### 4.2 Color Balancing
- White balance
- Color correction
- Tone mapping

## 5. Advanced Techniques

### 5.1 Bi-Histogram Equalization
- Preserving brightness
- Reducing over-enhancement
- Natural looking results

### 5.2 Exposure Fusion
- Multiple exposure combination
- HDR imaging
- Local contrast enhancement

## 6. Applications

### 6.1 Medical Imaging
- X-ray enhancement
- MRI contrast improvement
- Tissue visualization

### 6.2 Remote Sensing
- Satellite image enhancement
- Atmospheric correction
- Feature extraction

## 7. Best Practices

### 7.1 Pre-processing
- Noise reduction
- Edge preservation
- Dynamic range consideration

### 7.2 Parameter Selection
- Window size for AHE
- Clip limit for CLAHE
- Histogram bins

## 8. Common Issues and Solutions

### 8.1 Over-enhancement
- Noise amplification
- Artifact introduction
- Contrast limiting

### 8.2 Under-enhancement
- Insufficient contrast
- Poor visibility
- Parameter tuning

## 9. Evaluation Metrics

### 9.1 Quantitative Metrics
- Contrast measurement
- Entropy
- PSNR/MSE

### 9.2 Visual Assessment
- Subjective quality
- Natural appearance
- Detail preservation

## 10. Exercises

1. **Basic Implementation**
   - Implement basic histogram equalization
   - Compare global vs local approaches
   - Visualize results

2. **Advanced Projects**
   - Build a CLAHE implementation
   - Create an exposure fusion system
   - Develop a color correction pipeline

[← Transformations] | [Filtering →]