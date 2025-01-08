---
title: "Các phép toán hình thái học nâng cao"
description: "Các phép toán hình thái học phức tạp và ứng dụng"
date: 2024-03-21
tags: [image-processing, morphological, advanced]
---

# Phép toán hình thái học nâng cao

## 1. Hit-or-Miss Transform

### 1.1 Nguyên lý
- Template matching morphological
- Phát hiện pattern cụ thể
- Sử dụng hai structuring elements

### 1.2 Implementation

```python
def hit_or_miss(image):
"""
Thực hiện hit-or-miss transform
"""
kernel1 = np.array([[1,1,1],
[1,1,1],
[1,1,1]], np.uint8)
kernel2 = np.array([[0,0,0],
[0,1,0],
[0,0,0]], np.uint8)
return cv2.morphologyEx(image, cv2.MORPH_HITMISS, kernel1, kernel2)
```


## 2. Top-hat Transform

### 2.1 White Top-hat
- Difference between input and opening
- Highlight bright details
- Contrast enhancement

### 2.2 Black Top-hat
- Difference between closing and input
- Highlight dark details
- Shadow detection

```python
def tophat_transform(image, kernel_size):
"""
Thực hiện white và black top-hat
"""
kernel = np.ones((kernel_size, kernel_size), np.uint8)
white_tophat = cv2.morphologyEx(image, cv2.MORPH_TOPHAT, kernel)
black_tophat = cv2.morphologyEx(image, cv2.MORPH_BLACKHAT, kernel)
return white_tophat, black_tophat
```
## 3. Morphological Gradient

### 3.1 Basic Gradient
- Difference between dilation and erosion
- Edge detection
- Thickness control

### 3.2 Advanced Gradients
- Internal gradient
- External gradient
- Directional gradients

```python
def morphological_gradient(image, kernel_size):
"""
Tính toán morphological gradient
"""
kernel = np.ones((kernel_size, kernel_size), np.uint8)
return cv2.morphologyEx(image, cv2.MORPH_GRADIENT, kernel)
```

## 4. Watershed Segmentation

### 4.1 Nguyên lý
- Flooding-based segmentation
- Marker-controlled watershed
- Over-segmentation handling

### 4.2 Implementation
```python
def watershed_segmentation(image):
"""
Thực hiện watershed segmentation
"""
# Distance transform
dist_transform = cv2.distanceTransform(image, cv2.DIST_L2, 5)
# Threshold to get markers
ret, markers = cv2.threshold(dist_transform, 0.7dist_transform.max(), 255, 0)
markers = np.uint8(markers)
# Apply watershed
markers = cv2.connectedComponents(markers)[1]
return cv2.watershed(cv2.cvtColor(image, cv2.COLOR_GRAY2BGR), markers)
```

## 5. Granulometry

### 5.1 Pattern Spectrum
- Size distribution analysis
- Shape characterization
- Texture analysis

### 5.2 Implementation

```python
def granulometry(image, max_size):
"""
Thực hiện granulometric analysis
"""
spectrum = []
for size in range(1, max_size+1):
opened = opening(image, size)
area = np.sum(opened)
spectrum.append(area)
return spectrum
```
## 6. Skeletonization

### 6.1 Medial Axis Transform
- Shape representation
- Thinning algorithms
- Pruning techniques

### 6.2 Implementation

```python
def skeletonize(image):
"""
Thực hiện skeletonization
"""
size = np.size(image)
skel = np.zeros(image.shape, np.uint8)
element = cv2.getStructuringElement(cv2.MORPH_CROSS, (3,3))
done = False
while not done:
eroded = cv2.erode(image, element)
temp = cv2.dilate(eroded, element)
temp = cv2.subtract(image, temp)
skel = cv2.bitwise_or(skel, temp)
image = eroded.copy()
zeros = size - cv2.countNonZero(image)
if zeros == size:
done = True
return skel
```                           

## 7. Applications

### 7.1 Medical Image Analysis
- Cell counting
- Tissue segmentation
- Feature extraction

### 7.2 Industrial Inspection
- Defect detection
- Quality control
- Pattern recognition

## 8. Advanced Techniques

### 8.1 Multi-scale Analysis
- Scale-space morphology
- Hierarchical segmentation
- Resolution pyramid

### 8.2 Color Morphology
- Vector ordering
- Multivariate operations
- Color space considerations

## 9. Exercises

1. **Advanced Operations**
   - Implement watershed segmentation
   - Create a skeletonization algorithm
   - Develop granulometric analysis

2. **Real-world Applications**
   - Cell counting in microscopy
   - Document analysis
   - Texture classification

[← Basic Operations] | [Back to Image Processing]