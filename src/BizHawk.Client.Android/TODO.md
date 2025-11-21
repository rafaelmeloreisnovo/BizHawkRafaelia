# Android Client - Future Improvements

This document tracks improvements and enhancements for the Android client.

## High Priority

### Storage Access (Android 11+)
- **Issue**: Current implementation uses legacy storage permissions (maxSdkVersion=29)
- **Impact**: File access limited on Android 11+ (API 30+)
- **Solution**: Implement scoped storage APIs
  - Use MediaStore API for media files
  - Use app-specific directories for internal files
  - Implement Storage Access Framework (SAF) for user-selected files
- **References**: 
  - https://developer.android.com/training/data-storage
  - https://developer.android.com/about/versions/11/privacy/storage

### Emulation Core Integration
- Implement proper emulation core initialization
- Add core selection logic
- Handle platform-specific optimizations for ARM64
- Test each emulation core on real devices

### Touch Controls
- Design virtual gamepad overlay
- Implement multi-touch support
- Add haptic feedback
- Allow customizable button layouts
- Support gesture controls (swipe, pinch-to-zoom)

### Graphics Rendering
- Port rendering to OpenGL ES 2.0/3.0
- Optimize for mobile GPUs
- Implement proper frame pacing
- Add display scaling options
- Support different screen orientations

## Medium Priority

### ROM Management
- File browser for ROM selection
- Recent files list
- Favorites/bookmarks system
- ROM metadata display
- Cover art support

### Savestate System
- Savestate creation and loading
- Quick save/load shortcuts
- Savestate preview thumbnails
- Cloud backup integration

### Audio System
- Audio output via OpenSL ES or AAudio
- Audio latency optimization
- Volume controls
- Audio buffer size configuration

### Settings UI
- General settings screen
- Per-system configuration
- Control mapping interface
- Display settings (filters, shaders)
- Performance settings

## Low Priority / Nice to Have

### Performance
- Profile performance on various devices
- Implement frame skip for lower-end devices
- Add performance overlay (FPS counter)
- Battery optimization modes

### Networking
- Netplay support
- Cloud save synchronization
- Achievement system integration
- Leaderboards

### User Experience
- Onboarding tutorial
- In-app help/documentation
- Crash reporting
- Usage analytics (opt-in)

### Controller Support
- Bluetooth controller detection
- Controller mapping UI
- Support multiple controllers
- Controller button prompts

### Additional Features
- Screen recording
- Screenshot functionality
- Cheat code support
- Fast forward / slow motion
- Rewind functionality
- Frame advance

### Localization
- Multi-language support
- RTL language support
- Translated UI strings

## Technical Debt

### Code Quality
- Add unit tests for Android-specific code
- Implement proper error handling
- Add logging framework
- Document Android-specific APIs

### Build System
- Optimize APK size further
- Implement proper ProGuard/R8 rules
- Add automated testing in CI/CD
- Generate signed APKs automatically

### Performance Monitoring
- Add performance benchmarks
- Implement memory profiling
- Track battery usage
- Monitor thermal throttling

## Documentation Needed

- User guide for Android app
- Developer guide for Android contributions
- Performance optimization guide
- Troubleshooting guide
- Architecture documentation

## Known Issues

1. **MainActivity.cs**: Currently only shows placeholder UI
2. **Native Libraries**: Need to verify all native libraries work on ARM64
3. **Memory Management**: Need to implement Android lifecycle properly
4. **Permissions**: Need to handle runtime permissions for Android 6+
5. **Background Execution**: Need to handle app backgrounding during emulation

## Testing Requirements

- [ ] Test on various Android versions (5.0 - 14+)
- [ ] Test on different device manufacturers (Samsung, Google, Xiaomi, etc.)
- [ ] Test on different screen sizes and resolutions
- [ ] Test on different chipsets (Snapdragon, MediaTek, Exynos)
- [ ] Performance testing on low-end devices
- [ ] Battery life testing
- [ ] Thermal testing under sustained load
- [ ] Controller compatibility testing
- [ ] Network connectivity testing

## Release Checklist

Before public release:
- [ ] Implement core emulation functionality
- [ ] Add proper app icon and branding
- [ ] Complete touch controls
- [ ] Implement file browser
- [ ] Add savestate support
- [ ] Test on 10+ different devices
- [ ] Create user documentation
- [ ] Set up crash reporting
- [ ] Implement privacy policy
- [ ] Complete Google Play Store listing
- [ ] Prepare marketing materials
- [ ] Set up support channels

---

**Note**: This is a living document. Update as features are implemented or priorities change.

**Last Updated**: 2025-11-21  
**Maintained By**: Rafael Melo Reis
