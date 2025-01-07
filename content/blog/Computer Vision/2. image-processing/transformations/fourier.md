---
title: "Biến đổi Fourier trong xử lý ảnh"
description: "Hiểu và ứng dụng biến đổi Fourier trong xử lý ảnh số"
date: 2024-03-21
tags: [image-processing, transformations, fourier]
---

# Biến đổi Fourier trong Xử lý ảnh

## 1. Cơ sở lý thuyết

### 1.1 Biến đổi Fourier liên tục (CFT)
- Chuyển đổi tín hiệu từ miền không gian sang miền tần số
- Công thức toán học cơ bản
- Ý nghĩa vật lý

### 1.2 Biến đổi Fourier rời rạc (DFT)
- Phiên bản số hóa của CFT
- 2D DFT cho ảnh số
- Fast Fourier Transform (FFT)

## 2. Biến đổi Fourier 2D

### 2.1 Công thức toán học

```python
F(u,v) = Σ Σ f(x,y) e^(-j2π(ux/M + vy/N))
```
### 2.2 Thành phần của phổ Fourier
- Magnitude spectrum (Biên độ)
- Phase spectrum (Pha)
- Power spectrum

## 3. Ứng dụng trong xử lý ảnh

### 3.1 Frequency Domain Filtering
- Low-pass filtering (Làm mịn ảnh)
- High-pass filtering (Phát hiện cạnh)
- Band-pass filtering

### 3.2 Image Enhancement
- Noise reduction
- Edge sharpening
- Pattern recognition

## 4. Implementation

### 4.1 Using NumPy


```python
import numpy as np
import matplotlib.pyplot as plt
def fourier_transform(image):
# Compute the 2D FFT
f_transform = np.fft.fft2(image)
# Shift zero frequency to center
f_shift = np.fft.fftshift(f_transform)
# Compute magnitude spectrum
magnitude_spectrum = 20 np.log(np.abs(f_shift))
return f_shift, magnitude_spectrum
def inverse_fourier_transform(f_shift):
# Inverse shift
f_ishift = np.fft.ifftshift(f_shift)
# Inverse FFT
img_back = np.fft.ifft2(f_ishift)
# Get real part
img_back = np.abs(img_back)
return img_back
```


### 4.2 Frequency Domain Filters

```python
def create_filter(shape, filter_type, cutoff):
rows, cols = shape
crow, ccol = rows//2, cols//2
# Create meshgrid
u = np.arange(rows) - crow
v = np.arange(cols) - ccol
U, V = np.meshgrid(u, v)
# Compute distance from center
D = np.sqrt(U2 + V2)
if filter_type == 'lowpass':
H = D <= cutoff
elif filter_type == 'highpass':
H = D > cutoff
return H
```


## 5. Practical Applications

### 5.1 Image Compression
- JPEG compression principles
- DCT vs FFT
- Compression artifacts

### 5.2 Feature Extraction
- Texture analysis
- Pattern recognition
- Frequency-based features

### 5.3 Image Restoration
- Deblurring
- Noise removal
- Motion estimation

## 6. Advanced Topics

### 6.1 Short-Time Fourier Transform
- Windowing
- Time-frequency analysis
- Applications in video processing

### 6.2 Wavelets vs Fourier
- Multiresolution analysis
- Localization properties
- When to use which

## 7. Common Issues and Solutions

### 7.1 Frequency Leakage
- Causes
- Window functions
- Prevention techniques

### 7.2 Computational Efficiency
- FFT algorithms
- Memory management
- Parallel processing

## 8. Visualization Techniques

### 8.1 Spectrum Visualization

```python
def visualize_spectrum(image):
f_shift, magnitude_spectrum = fourier_transform(image)
plt.subplot(131), plt.imshow(image, cmap='gray')
plt.title('Input Image'), plt.xticks([]), plt.yticks([])
plt.subplot(132), plt.imshow(magnitude_spectrum, cmap='gray')
plt.title('Magnitude Spectrum'), plt.xticks([]), plt.yticks([])
plt.subplot(133), plt.imshow(np.angle(f_shift), cmap='gray')
plt.title('Phase Spectrum'), plt.xticks([]), plt.yticks([])
plt.show()
```

## 9. Best Practices

### 9.1 Performance Optimization
- Use numpy's FFT implementation
- Consider image size and padding
- Utilize GPU acceleration when available

### 9.2 Filter Design
- Choose appropriate cutoff frequencies
- Consider filter smoothness
- Handle edge effects

## 10. Exercises

1. **Basic Exercises**
   - Implement basic low-pass and high-pass filters
   - Visualize frequency spectrums of different images
   - Compare different window functions

2. **Advanced Projects**
   - Build a frequency-domain image denoiser
   - Implement motion blur removal
   - Create a simple image compression system

## 11. Additional Resources

### 11.1 Mathematical Background
- Complex analysis
- Signal processing theory
- Linear systems

### 11.2 Software Tools
- SciPy signal processing
- OpenCV frequency domain functions
- MATLAB Signal Processing Toolbox

[← Geometric Transformations] | [Intensity Transformations →]