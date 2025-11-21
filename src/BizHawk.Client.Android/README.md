# BizHawk.Client.Android

Android client for BizHawk Rafaelia emulator.

## Overview

This is the Android port of BizHawk Rafaelia, providing multi-system emulation on Android devices (ARM64).

## Requirements

- Android 5.0 (API 21) or higher
- ARM64 (aarch64) processor
- Minimum 2GB RAM (4GB recommended)
- OpenGL ES 2.0 support

## Building

### Prerequisites

1. Install .NET SDK 8.0 or higher
2. Install Android workload:
   ```bash
   dotnet workload install android
   ```
3. Install Android SDK and NDK via Android Studio or command line tools

### Build Commands

**Debug Build:**
```bash
dotnet build -c Debug -f net8.0-android
```

**Release Build:**
```bash
dotnet build -c Release -f net8.0-android
```

**Publish APK (Unsigned):**
```bash
dotnet publish -c Release -f net8.0-android -o ./publish
```

**Publish APK (Signed):**
```bash
dotnet publish -c Release -f net8.0-android \
  -p:AndroidSigningKeyStore=path/to/keystore.keystore \
  -p:AndroidSigningKeyAlias=your_alias \
  -p:AndroidSigningKeyPass=your_password \
  -p:AndroidSigningStorePass=your_storepass
```

### Output

APK files will be generated in:
- Debug: `bin/Debug/net8.0-android/`
- Release: `bin/Release/net8.0-android/`

## Installation

### Via ADB
```bash
adb install -r path/to/BizHawk.Client.Android.apk
```

### Manual
Transfer the APK to your Android device and install it directly.

## Current Status

🔄 **Alpha - Under Development**

### Implemented
- [x] Basic Android project structure
- [x] AndroidManifest.xml configuration
- [x] Main Activity with UI placeholder
- [x] Native library integration (ARM64)
- [x] Build configuration for APK generation

### In Progress
- [ ] Emulation core initialization
- [ ] Touch controls UI
- [ ] ROM file browser
- [ ] Savestate management
- [ ] Virtual gamepad overlay
- [ ] Audio output
- [ ] Graphics rendering (OpenGL ES)

### Future Features
- [ ] Cloud save support
- [ ] Achievement system
- [ ] Netplay support
- [ ] Controller support (Bluetooth)
- [ ] Screen recording
- [ ] Customizable controls

## Performance Optimization

This build includes several optimizations for mobile devices:

1. **Code Trimming**: Removes unused code to reduce APK size
2. **Per-ABI APKs**: Separate APKs for different architectures
3. **R8 Optimization**: Android-specific bytecode optimization
4. **Large Heap**: Enabled for memory-intensive emulation

## Known Issues

1. Full emulation UI is not yet implemented
2. Touch controls are placeholder only
3. Some emulation cores may not work on ARM64
4. Performance varies by device and emulated system

## Contributing

See [ARM64_MOBILE_SUPPORT.md](../../ARM64_MOBILE_SUPPORT.md) in the repository root for detailed information about Android development for BizHawk.

## License

Same as the main BizHawk project. See [LICENSE](../../LICENSE) in repository root.

## Credits

- **Original BizHawk**: [TASEmulators/BizHawk](https://github.com/TASEmulators/BizHawk)
- **BizHawk Rafaelia**: Rafael Melo Reis
- **Contributors**: See [CONTRIBUTORS.md](../../CONTRIBUTORS.md)
