#include <stdio.h>
#include <cuda.h>
#include <cuda_runtime.h>

__global__ void hello_world(){
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    printf("block id = [ %d ], thread id = [ %d ] hello cuda\n", blockIdx.x, idx);
}

int main() {
    hello_world<<<2,2>>>();
    cudaDeviceSynchronize(); // 用于同步cpu，实测关闭后不会输出
    return 0;
}