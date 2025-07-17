# Makefile for Pixeltovoxelprojector
# Builds ray_voxel executable from ray_voxel.cpp

# Compiler and flags
CXX = g++
CXXFLAGS = -std=c++17 -O2 -Wall -Wextra
TARGET = ray_voxel
SOURCE = ray_voxel.cpp

# Default metadata and image folder paths
METADATA_FILE = motionimages/metadata.json
IMAGE_FOLDER = motionimages
OUTPUT_FILE = voxel_grid.bin

# Default target
all: $(TARGET)

# Build the executable
$(TARGET): $(SOURCE)
	@echo "[Info] Compiling $(SOURCE)..."
	$(CXX) $(CXXFLAGS) $(SOURCE) -o $(TARGET)
	@echo "[Info] Compilation succeeded."

# Run the program with default parameters
run: $(TARGET)
	@echo "[Info] Running $(TARGET)..."
	./$(TARGET) $(METADATA_FILE) $(IMAGE_FOLDER) $(OUTPUT_FILE)

# Run with custom parameters
# Usage: make run-custom METADATA=path/to/metadata.json IMAGES=path/to/images OUTPUT=output.bin
run-custom: $(TARGET)
	@echo "[Info] Running $(TARGET) with custom parameters..."
	./$(TARGET) $(METADATA) $(IMAGES) $(OUTPUT)

# Clean build artifacts
clean:
	@echo "[Info] Cleaning build artifacts..."
	rm -f $(TARGET)

# Build and run in one command
build-and-run: $(TARGET) run

# Install dependencies (if needed)
install-deps:
	@echo "[Info] Installing dependencies..."
	@echo "Make sure you have nlohmann/json and stb_image headers available"
	@echo "For Ubuntu/Debian: sudo apt-get install nlohmann-json3-dev"
	@echo "For other systems, please install manually or use package manager"

# Help target
help:
	@echo "Available targets:"
	@echo "  all          - Build the ray_voxel executable (default)"
	@echo "  run          - Build and run with default parameters"
	@echo "  run-custom   - Build and run with custom parameters"
	@echo "  clean        - Remove build artifacts"
	@echo "  build-and-run - Build and run in one command"
	@echo "  install-deps - Show dependency installation instructions"
	@echo "  help         - Show this help message"
	@echo ""
	@echo "Example usage:"
	@echo "  make                    # Build the project"
	@echo "  make run                # Build and run with default parameters"
	@echo "  make run-custom METADATA=my/metadata.json IMAGES=my/images OUTPUT=my_output.bin"
	@echo "  make clean              # Clean build artifacts"

# Phony targets
.PHONY: all run run-custom clean build-and-run install-deps help
