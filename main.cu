#include <iostream>
#include <chrono>
#include <cuda.h>
#include <cuda_runtime.h>

__global__ void addVectors(float *vec1, float *vec2, float *result) {
    int index = threadIdx.x;
    result[index] = vec1[index] + vec2[index];
}

int main() {
    const int N = 25 * 32;
    float *vec1_device;
    float *vec2_device;
    float *result_device;

    float *vec1_host = new float[25 * 32];
    float *vec2_host = new float[25 * 32];
    float *result_host = new float[25 * 32];

    cudaMalloc(&vec1_device, 25 * 32 * sizeof(float));
    cudaMalloc(&vec2_device, 25 * 32 * sizeof(float));
    cudaMalloc(&result_device, 25 * 32 * sizeof(float));

    for (int i = 0; i < N; i++) {
        vec1_host[i] = 1.0f;
        vec2_host[i] = 2.0f;
    }

    if (vec1_device == nullptr || vec2_device == nullptr || result_device == nullptr) {
        std::cerr << "Memory allocation failed" << std::endl;
        return 1;
    }

    cudaMemcpy(vec1_device, vec1_host, 25 * 32 * sizeof(float), cudaMemcpyHostToDevice);
    cudaMemcpy(vec2_device, vec2_host, 25 * 32 * sizeof(float), cudaMemcpyHostToDevice);

    auto start =     std::chrono::high_resolution_clock::now();

    dim3 num_of_blocks(25);
    dim3 threads_per_block(32);
    addVectors<<<num_of_blocks, threads_per_block>>>(vec1_device, vec2_device, result_device);

    auto end = std::chrono::high_resolution_clock::now();

    std::chrono::duration<float, std::milli> duration_ms = end - start;
    std::cout << "GPU time: " << duration_ms.count() << " ms" << std::endl;

    cudaMemcpy(result_device, result_host, 25 * 32 * sizeof(float), cudaMemcpyDeviceToHost);

    cudaFree(vec1_device);
    cudaFree(vec2_device);
    cudaFree(result_device);

    return 0;
}
