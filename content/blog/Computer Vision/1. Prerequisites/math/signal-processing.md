---
title: "Xử lý tín hiệu cho Computer Vision"
description: "Kiến thức xử lý tín hiệu cần thiết cho Computer Vision"
date: 2024-03-21
tags: [mathematics, signal-processing, prerequisites]
---

# Xử lý tín hiệu trong Computer Vision

## 1. Cơ bản về tín hiệu

### 1.1 Tín hiệu số
- Sampling và quantization
- Discrete signals
- 2D signals (images)

### 1.2 Properties của tín hiệu
- Linearity
- Time-invariance
- Causality
- Stability

## 2. Frequency Domain Analysis

### 2.1 Fourier Transform
- DFT (Discrete Fourier Transform)
- FFT (Fast Fourier Transform)
- 2D Fourier Transform

### 2.2 Ứng dụng trong CV
- Image filtering
- Feature extraction
- Pattern recognition
- Compression

## 3. Digital Filters

### 3.1 FIR Filters
- Moving average
- Gaussian filters
- Sobel filters

### 3.2 IIR Filters
- Recursive filters
- Feedback systems
- Stability considerations

## 4. Image Processing Operations

### 4.1 Convolution
- 1D và 2D convolution
- Kernel operations
- Padding strategies

### 4.2 Correlation
- Auto-correlation
- Cross-correlation
- Template matching

## 5. Wavelets

### 5.1 Wavelet Transform
- Continuous Wavelet Transform
- Discrete Wavelet Transform
- Multi-resolution analysis

### 5.2 Applications
- Image compression
- Denoising
- Feature extraction

## 6. Ví dụ thực tế

### 6.1 Frequency Domain Filtering

```python
def frequency_filter(image, filter_type='lowpass', cutoff=0.5):
# Compute FFT
f = np.fft.fft2(image)
fshift = np.fft.fftshift(f)
# Create filter
rows, cols = image.shape
crow, ccol = rows//2, cols//2
mask = np.zeros((rows, cols))
if filter_type == 'lowpass':
mask[crow-cutoff:crow+cutoff, ccol-cutoff:ccol+cutoff] = 1
# Apply filter and inverse FFT
fshift = fshift mask
f_ishift = np.fft.ifftshift(fshift)
img_back = np.fft.ifft2(f_ishift)
return np.abs(img_back)
```
[← Probability and Statistics] | [Python Basics →]