#!/bin/bash
# Build script for Android APK generation

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$SCRIPT_DIR/../src/BizHawk.Client.Android"
OUTPUT_DIR="$SCRIPT_DIR/../apk-output"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN}BizHawk Rafaelia - Android APK Builder${NC}"
echo -e "${GREEN}========================================${NC}"
echo ""

# Check if .NET SDK is installed
if ! command -v dotnet &> /dev/null; then
    echo -e "${RED}Error: .NET SDK is not installed${NC}"
    echo "Please install .NET SDK 8.0 or higher from https://dotnet.microsoft.com/download"
    exit 1
fi

echo -e "${GREEN}✓ .NET SDK found:${NC} $(dotnet --version)"

# Check if Android workload is installed
if ! dotnet workload list | grep -E "^android\\s"; then
    echo -e "${YELLOW}Android workload not found. Installing...${NC}"
    dotnet workload install android --skip-manifest-update
    if [ $? -ne 0 ]; then
        echo -e "${RED}Error: Failed to install Android workload${NC}"
        exit 1
    fi
    echo -e "${GREEN}✓ Android workload installed${NC}"
else
    echo -e "${GREEN}✓ Android workload found${NC}"
fi

# Parse command line arguments
BUILD_TYPE="Release"
CLEAN=false

while [[ $# -gt 0 ]]; do
    case $1 in
        --debug|-d)
            BUILD_TYPE="Debug"
            shift
            ;;
        --clean|-c)
            CLEAN=true
            shift
            ;;
        --help|-h)
            echo "Usage: $0 [OPTIONS]"
            echo ""
            echo "Options:"
            echo "  --debug, -d     Build debug version (default is release)"
            echo "  --clean, -c     Clean before building"
            echo "  --help, -h      Show this help message"
            exit 0
            ;;
        *)
            echo -e "${RED}Unknown option: $1${NC}"
            echo "Use --help for usage information"
            exit 1
            ;;
    esac
done

echo ""
echo -e "${GREEN}Build Configuration:${NC}"
echo "  Type: $BUILD_TYPE"
echo "  Clean: $CLEAN"
echo ""

# Clean if requested
if [ "$CLEAN" = true ]; then
    echo -e "${YELLOW}Cleaning previous build...${NC}"
    dotnet clean "$PROJECT_DIR/BizHawk.Client.Android.csproj" -c "$BUILD_TYPE"
    rm -rf "$OUTPUT_DIR"
    echo -e "${GREEN}✓ Clean complete${NC}"
    echo ""
fi

# Create output directory
mkdir -p "$OUTPUT_DIR"

# Restore dependencies
echo -e "${YELLOW}Restoring dependencies...${NC}"
dotnet restore "$PROJECT_DIR/BizHawk.Client.Android.csproj"
if [ $? -ne 0 ]; then
    echo -e "${RED}Error: Failed to restore dependencies${NC}"
    exit 1
fi
echo -e "${GREEN}✓ Dependencies restored${NC}"
echo ""

# Build APK
echo -e "${YELLOW}Building $BUILD_TYPE APK...${NC}"
dotnet publish "$PROJECT_DIR/BizHawk.Client.Android.csproj" \
    -c "$BUILD_TYPE" \
    -f net8.0-android \
    -o "$OUTPUT_DIR"

if [ $? -ne 0 ]; then
    echo -e "${RED}Error: Build failed${NC}"
    exit 1
fi

echo -e "${GREEN}✓ Build complete${NC}"
echo ""

# Find generated APK files
APK_FILES=$(find "$OUTPUT_DIR" -name "*.apk" 2>/dev/null)
AAB_FILES=$(find "$OUTPUT_DIR" -name "*.aab" 2>/dev/null)

if [ -n "$APK_FILES" ] || [ -n "$AAB_FILES" ]; then
    echo -e "${GREEN}========================================${NC}"
    echo -e "${GREEN}Build Summary${NC}"
    echo -e "${GREEN}========================================${NC}"
    
    if [ -n "$APK_FILES" ]; then
        echo -e "${GREEN}APK files generated:${NC}"
        for apk in $APK_FILES; do
            SIZE=$(ls -lh "$apk" | awk '{print $5}')
            echo "  📦 $(basename "$apk") ($SIZE)"
        done
    fi
    
    if [ -n "$AAB_FILES" ]; then
        echo -e "${GREEN}AAB files generated:${NC}"
        for aab in $AAB_FILES; do
            SIZE=$(ls -lh "$aab" | awk '{print $5}')
            echo "  📦 $(basename "$aab") ($SIZE)"
        done
    fi
    
    echo ""
    echo -e "${GREEN}Output directory:${NC} $OUTPUT_DIR"
    echo ""
    echo -e "${GREEN}Installation:${NC}"
    echo "  adb install -r $OUTPUT_DIR/<apk-file>"
    echo ""
else
    echo -e "${YELLOW}Warning: No APK or AAB files found in output directory${NC}"
    echo "Build may have completed but output format might be different."
    echo "Check $OUTPUT_DIR for build artifacts."
fi

echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN}Build process complete!${NC}"
echo -e "${GREEN}========================================${NC}"
