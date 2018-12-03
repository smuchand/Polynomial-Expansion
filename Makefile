CXXFLAGS=-std=c++11 -O3 -fopenmp -march=native -mtune=native
LDFLAGS=-fopenmp 
CUDAFLAGS=-O3 -arch=sm_37 -std=c++11

polynomial: polynomial.cpp

polynomial_gpu: polynomial_gpu.cu
	nvcc $(CUDAFLAGS) polynomial_gpu.cu -o polynomial_gpu

bench_cpu: polynomial
	./queue_cpu.sh

bench_gpu: polynomial_gpu
	./queue_gpu.sh

test: polynomial_gpu
	./queue_test_gpu.sh

table:
	./table.sh

clean:
	-rm polynomial polynomial_gpu


