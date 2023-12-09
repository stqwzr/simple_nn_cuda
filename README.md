# CUDA Tutorials

This repository contains the source code for a simple CUDA project demonstrating vector addition on a GPU. The code is written using C++ and CUDA, making use of the NVIDIA CUDA Toolkit.

## Prerequisites

Before building and running the project, ensure you have the following installed:

- NVIDIA GPU with CUDA Compute Capability
- NVIDIA CUDA Toolkit
- CMake (version 3.8 or later)

## Installation

1. **Clone the Repository**  
   Use Git to clone this repository onto your local machine. ```git clone https://github.com/stqwzr/simple_nn_cuda```

2. **Navigate to the Project Directory**  
   Change to the project directory in your terminal.
3. **Build the Project**  
   Use CMake to build the project. Run these commands from within the project directory.

```
mkdir build
cd build
cmake ..
make
```

4. **Run the Executable**  
   After building, you can run the executable created.
``./cuda_tuts``


## Project Structure

- `main.cu`: Main CUDA source file containing both the host and device (GPU) code for vector addition.
- `CMakeLists.txt`: CMake configuration file to build the project.

## CMake Configuration

The `CMakeLists.txt` file is configured as follows:

- Minimum CMake version set to 3.8
- Project named `cuda_tuts`
- NVIDIA's `nvcc` compiler is used for CUDA files
- The CUDA language is enabled in the project
- An executable named `cuda_tuts` is created from `main.cu`

## Contributing

Contributions to this project are welcome. Please ensure to update tests as appropriate.

## License

[MIT License](LICENSE.md) - see the `LICENSE.md` file for details.
