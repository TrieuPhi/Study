---
title: "Python cơ bản cho Computer Vision"
description: "Kiến thức Python cần thiết cho Computer Vision"
date: 2024-03-21
tags: [programming, python, prerequisites]
---

# Python Programming cho Computer Vision

## 1. Python Fundamentals

### 1.1 Data Types
- Numbers (int, float)
- Lists, tuples, dictionaries
- NumPy arrays
- Image data types

### 1.2 Control Flow
- Conditionals
- Loops
- Functions
- List comprehensions

## 2. NumPy

### 2.1 Array Operations
- Array creation
- Indexing và slicing
- Broadcasting
- Vectorization

### 2.2 Mathematical Operations
- Linear algebra operations
- Statistical functions
- Random number generation

## 3. Image Processing với Python

### 3.1 PIL/Pillow
- Loading images
- Basic operations
- Color space conversion

### 3.2 Matplotlib
- Image display
- Plotting
- Visualization tools

## 4. File Operations

### 4.1 Image I/O
- Reading images
- Writing images
- Different formats

### 4.2 Data Handling
- CSV files
- JSON
- Binary files

## 5. Ví dụ thực tế

### 5.1 Basic Image Processing

```python
import numpy as np
from PIL import Image
import matplotlib.pyplot as plt
def basic_image_operations():
# Load image
img = Image.open('image.jpg')
# Convert to numpy array
img_array = np.array(img)
# Basic operations
grayscale = np.mean(img_array, axis=2)
normalized = img_array / 255.0
# Display
plt.imshow(grayscale, cmap='gray')
plt.show()
```
[← Signal Processing] | [OpenCV Introduction →]
