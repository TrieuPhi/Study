---
title: "Lọc ảnh số"
description: "Các kỹ thuật lọc ảnh trong xử lý ảnh số"
date: 2024-03-21
tags: [image-processing, enhancement, filtering]
---

# Lọc ảnh số

## 1. Cơ bản về Image Filtering

### 1.1 Định nghĩa
- Convolution và correlation
- Kernel/mask
- Padding và border handling

### 1.2 Types of Filters
- Linear filters
- Non-linear filters
- Spatial vs Frequency domain

## 2. Linear Filtering

### 2.1 Mean Filters

```python
def mean_filter(image, kernel_size):
"""
Implement mean filter
"""
kernel = np.ones((kernel_size, kernel_size)) / (kernel_size kernel_size)
return cv2.filter2D(image, -1, kernel)
```

## 3. Non-linear Filtering

### 3.1 Median Filter

```python
def median_filter(image, kernel_size):
"""
Implement median filter
"""
return cv2.medianBlur(image, kernel_size)
```

### 3.2 Bilateral Filter

```python
def bilateral_filter(image, d, sigma_color, sigma_space):
"""
Edge-preserving smoothing
"""
return cv2.bilateralFilter(image, d, sigma_color, sigma_space)
```

## 4. Edge Detection Filters

### 4.1 Gradient Filters
- Sobel operator
- Prewitt operator
- Roberts cross operator

### 4.2 Laplacian Filter

```python
def laplacian_filter(image):
"""
Implement Laplacian filter
"""
return cv2.Laplacian(image, cv2.CV_64F)
```


## 5. Advanced Filtering Techniques

### 5.1 Adaptive Filtering
- Local adaptive filters
- Wiener filter
- Kalman filter

### 5.2 Anisotropic Diffusion
- Edge-preserving smoothing
- Perona-Malik diffusion
- Implementation considerations

## 6. Frequency Domain Filtering

### 6.1 Low-pass Filters
- Ideal low-pass
- Butterworth low-pass
- Gaussian low-pass

### 6.2 High-pass Filters
- Ideal high-pass
- Butterworth high-pass
- Gaussian high-pass

## 7. Applications

### 7.1 Noise Reduction
- Gaussian noise
- Salt-and-pepper noise
- Speckle noise

### 7.2 Image Enhancement
- Sharpening
- Detail enhancement
- Texture preservation

## 8. Implementation Considerations

### 8.1 Performance Optimization

```python
def optimized_filter(image, kernel):
"""
Optimized filtering implementation
"""
# Use FFT for large kernels
if kernel.size > 64:
return frequency_domain_filter(image, kernel)
else:
return spatial_domain_filter(image, kernel)
```


### 8.2 Border Handling
- Constant padding
- Reflect padding
- Wrap padding

## 9. Filter Design

### 9.1 Kernel Design
- Separable kernels
- Rotational symmetry
- Normalization

### 9.2 Parameter Selection
- Kernel size
- Standard deviation
- Threshold values

## 10. Common Issues and Solutions

### 10.1 Edge Effects
- Border artifacts
- Ringing artifacts
- Solution strategies

### 10.2 Computational Efficiency
- Separable filtering
- Integral images
- GPU acceleration

## 11. Exercises

1. **Basic Filtering**
   - Implement various linear filters
   - Compare different noise reduction methods
   - Analyze edge detection results

2. **Advanced Projects**
   - Build an adaptive filtering system
   - Implement frequency domain filters
   - Create a custom filter design tool

[← Histogram] | [Morphological Operations →]