---
title: "Giới thiệu OpenCV cho Computer Vision"
description: "Hướng dẫn cơ bản về OpenCV"
date: 2024-03-21
tags: [programming, opencv, prerequisites]
---

# Giới thiệu OpenCV

## 1. Cơ bản về OpenCV

### 1.1 Installation và Setup
- Installing OpenCV
- Importing OpenCV
- Basic configuration

### 1.2 Image Basics
- Loading images
- Displaying images
- Saving images
- Image properties

## 2. Core Operations

### 2.1 Basic Operations
- Pixel access và modification
- ROI selection
- Image arithmetic
- Bitwise operations

### 2.2 Image Processing
- Color space conversions
- Thresholding
- Smoothing
- Edge detection

## 3. Image Transformations

### 3.1 Geometric Transformations
- Scaling
- Rotation
- Translation
- Perspective transform

### 3.2 Morphological Operations
- Erosion
- Dilation
- Opening
- Closing

## 4. Feature Detection

### 4.1 Edge Detection
- Canny edge detector
- Sobel operator
- Laplacian

### 4.2 Corner Detection
- Harris corner detector
- Shi-Tomasi corner detector
- FAST algorithm

## 5. Ví dụ thực tế

### 5.1 Basic Image Processing Pipeline

```python
import cv2
import numpy as np
def basic_opencv_pipeline(image_path):
# Read image
img = cv2.imread(image_path)
# Convert to grayscale
gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
# Apply Gaussian blur
blurred = cv2.GaussianBlur(gray, (5,5), 0)
# Edge detection
edges = cv2.Canny(blurred, 100, 200)
# Display results
cv2.imshow('Original', img)
cv2.imshow('Edges', edges)
cv2.waitKey(0)
cv2.destroyAllWindows()
```


## 6. Best Practices

### 6.1 Memory Management
- Image cleanup
- Window management
- Resource handling

### 6.2 Performance Optimization
- Vectorization
- GPU acceleration
- Code optimization

[← Python Basics] | [Next: Image Processing →]