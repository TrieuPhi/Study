---
title: "Xác suất và Thống kê cho Computer Vision"
description: "Kiến thức xác suất và thống kê cần thiết cho Computer Vision"
date: 2024-03-21
tags: [mathematics, probability, statistics, prerequisites]
---

# Xác suất và Thống kê trong Computer Vision

## 1. Cơ bản về Xác suất

### 1.1 Không gian xác suất
- Events và sample spaces
- Probability axioms
- Conditional probability
- Independence

### 1.2 Ứng dụng trong CV
- Object detection confidence scores
- Classification probabilities
- Uncertainty estimation

## 2. Phân phối xác suất

### 2.1 Discrete Distributions
- Bernoulli distribution
- Binomial distribution
- Poisson distribution

### 2.2 Continuous Distributions
- Normal distribution
- Gaussian mixture models
- Multivariate distributions

### 2.3 Ứng dụng trong CV
- Noise modeling
- Background subtraction
- Color distributions

## 3. Thống kê mô tả

### 3.1 Measures of Central Tendency
- Mean, median, mode
- Weighted averages
- Moving averages

### 3.2 Measures of Dispersion
- Variance và standard deviation
- Range và IQR
- Covariance matrices

## 4. Bayesian Inference

### 4.1 Bayes' Theorem
- Prior probability
- Likelihood
- Posterior probability

### 4.2 Ứng dụng trong CV
- Object tracking
- Image segmentation
- Pattern recognition

## 5. Statistical Learning

### 5.1 Parameter Estimation
- Maximum likelihood estimation
- Maximum a posteriori estimation
- Expectation-maximization

### 5.2 Hypothesis Testing
- Null hypothesis
- p-values
- Confidence intervals

## 6. Ví dụ thực tế

### 6.1 Gaussian Mixture Model
```python
def fit_gaussian_mixture(data, n_components):
# Initialize parameters
means = initialize_means(data, n_components)
covs = initialize_covariances(data, n_components)
weights = np.ones(n_components) / n_components
# EM algorithm
for i in range(max_iterations):
# E-step
responsibilities = compute_responsibilities(data, means, covs, weights)
# M-step
means, covs, weights = update_parameters(data, responsibilities)
```

## 7. Bài tập thực hành

1. **Basic Probability**
   - Calculate image histogram probabilities
   - Implement basic Bayesian classifier
   - Compute statistical moments of images

2. **Advanced Topics**
   - Implement Gaussian Mixture Model
   - Create probabilistic segmentation
   - Design statistical feature detectors

[← Linear Algebra] | [Signal Processing →]
