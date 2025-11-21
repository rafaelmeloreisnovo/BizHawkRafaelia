# Android Icon Resources

The following icon files are needed for the Android app. These should be placed in the respective directories:

## Required Icons

### Launcher Icons (PNG format)

- `Resources/mipmap-mdpi/ic_launcher.png` - 48x48 px
- `Resources/mipmap-hdpi/ic_launcher.png` - 72x72 px
- `Resources/mipmap-xhdpi/ic_launcher.png` - 96x96 px
- `Resources/mipmap-xxhdpi/ic_launcher.png` - 144x144 px
- `Resources/mipmap-xxxhdpi/ic_launcher.png` - 192x192 px

### Round Launcher Icons (Optional, PNG format)

- `Resources/mipmap-mdpi/ic_launcher_round.png` - 48x48 px
- `Resources/mipmap-hdpi/ic_launcher_round.png` - 72x72 px
- `Resources/mipmap-xhdpi/ic_launcher_round.png` - 96x96 px
- `Resources/mipmap-xxhdpi/ic_launcher_round.png` - 144x144 px
- `Resources/mipmap-xxxhdpi/ic_launcher_round.png` - 192x192 px

## Icon Design Guidelines

1. **Content**: Should represent BizHawk emulator (e.g., a hawk icon with gaming controller elements)
2. **Colors**: Use brand colors from the main BizHawk project
3. **Background**: Consider using adaptive icons for modern Android versions
4. **Format**: PNG with transparency
5. **Style**: Flat design with clear visibility at small sizes

## Generating Icons

You can generate Android icons from a single high-resolution source image (512x512px or larger) using:

1. **Android Studio**: Image Asset Studio (Tools > Resource Manager > + > Image Asset)
2. **Online Tools**: 
   - https://romannurik.github.io/AndroidAssetStudio/icons-launcher.html
   - https://icon.kitchen/
3. **Command Line**: Using ImageMagick or similar tools

## Temporary Solution

For now, the build will use a default Android icon. Replace these with proper BizHawk branding before public release.

## Source Image Location

Consider using the BizHawk logo from: `src/BizHawk.Client.EmuHawk/images/logo.ico`

Convert this to PNG format and resize appropriately for each density.
