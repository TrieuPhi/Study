---
title: "Đại số tuyến tính cho Computer Vision"
description: "Kiến thức đại số tuyến tính cần thiết cho Computer Vision"
date: 2024-03-21
tags: [mathematics, linear-algebra, prerequisites]
---

# Đại số tuyến tính trong Computer Vision

## 1. Vector và Ma trận

### 1.1 Vector
- **Định nghĩa**: Vector là một mảng các số, có thể biểu diễn điểm ảnh hoặc đặc trưng của ảnh
- **Ứng dụng trong CV**:
  - Biểu diễn pixel values
  - Feature vectors trong object detection
  - Encoding của ảnh

### 1.2 Ma trận
- **Định nghĩa**: Ma trận là một mảng 2 chiều của các số
- **Ứng dụng trong CV**:
  - Biểu diễn ảnh dưới dạng ma trận pixel
  - Biến đổi hình học (rotation, scaling)
  - Convolution kernels

### 1.3 Phép toán cơ bản
- Cộng/trừ vector và ma trận
- Nhân ma trận
- Chuyển vị ma trận
- Tích vô hướng và tích có hướng

## 2. Không gian vector và cơ sở

### 2.1 Không gian vector
- Linear independence
- Span và basis
- Dimension

### 2.2 Ứng dụng trong CV
- Color spaces (RGB, HSV)
- Feature spaces
- Dimensionality reduction

## 3. Eigenvalues và Eigenvectors

### 3.1 Khái niệm cơ bản
- Định nghĩa eigenvalues và eigenvectors
- Cách tính
- Diagonalization

### 3.2 Ứng dụng trong CV
- Principal Component Analysis (PCA)
- Face recognition (Eigenfaces)
- Image compression
- Covariance matrices trong feature detection

## 4. Singular Value Decomposition (SVD)

### 4.1 Lý thuyết SVD
- Phân tích ma trận thành U, Σ, V^T
- Properties của SVD
- Reduced SVD

### 4.2 Ứng dụng trong CV
- Image compression
- Noise reduction
- Background subtraction
- Feature extraction

## 5. Transformations

### 5.1 Linear Transformations
- Rotation matrices
- Scaling matrices
- Shear matrices

### 5.2 Affine Transformations
- Translation
- Perspective transformations
- Homogeneous coordinates

## 6. Optimization

### 6.1 Least Squares
- Linear least squares
- Normal equations
- Regularization

### 6.2 Gradient Descent
- Gradient computation
- Learning rate
- Convergence

## 7. Ví dụ thực tế

### 7.1 Image Transformation

```python
import numpy as np
def rotate_image(image, angle):
# Create rotation matrix
theta = np.radians(angle)
c, s = np.cos(theta), np.sin(theta)
R = np.array(((c, -s), (s, c)))
# Apply rotation
return np.dot(image, R)
```

### 7.2 PCA cho Face Recognition

```python
def compute_eigenfaces(faces):
# Center the data
mean_face = np.mean(faces, axis=0)
centered_faces = faces - mean_face
# Compute covariance matrix
cov_matrix = np.dot(centered_faces.T, centered_faces)
# Compute eigenvalues and eigenvectors
eigenvalues, eigenvectors = np.linalg.eig(cov_matrix)
return eigenvalues, eigenvectors, mean_face
```


## 8. Bài tập thực hành

1. **Basic Operations**
   - Implement matrix multiplication from scratch
   - Compute inverse of transformation matrices
   - Implement image rotation using matrices

2. **Advanced Topics**
   - Implement PCA for dimensionality reduction
   - Create an SVD-based image compressor
   - Implement affine transformations

## 9. Tài liệu tham khảo

1. **Sách**
   - Linear Algebra and Its Applications (Gilbert Strang)
   - Mathematics for Computer Vision (Joan Lasenby)

2. **Online Courses**
   - MIT OpenCourseWare Linear Algebra
   - Khan Academy Linear Algebra

3. **Tools**
   - NumPy for linear algebra operations
   - SciPy for advanced matrix operations
   - OpenCV for image transformations

## 10. Kiểm tra kiến thức

### 10.1 Câu hỏi ôn tập
1. Tại sao eigenvalues và eigenvectors quan trọng trong CV?
2. SVD được sử dụng như thế nào trong image compression?
3. Giải thích vai trò của ma trận trong biến đổi hình học?

### 10.2 Mini-project
Tạo một ứng dụng nhỏ sử dụng linear algebra để:
- Compress ảnh using SVD
- Implement face recognition using eigenfaces
- Create image filters using convolution matrices

[← Quay lại Prerequisites] | [Tiếp theo: Probability and Statistics →]