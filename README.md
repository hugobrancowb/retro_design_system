# Retro Design System

## How to install
After adding `retro_design_system` to the app's package list, import the fonts used adding the following code to the `fonts` section of `pubspec.yml`:

```yaml
  fonts:
    - family: Ubuntu Mono
      fonts:
        - asset: packages/retro_design_system/assets/fonts/Ubuntu_Mono/UbuntuMono-Regular.ttf
        - asset: packages/retro_design_system/assets/fonts/Ubuntu_Mono/UbuntuMono-Bold.ttf
          weight: 700
        - asset: packages/retro_design_system/assets/fonts/Ubuntu_Mono/UbuntuMono-Italic.ttf
          style: italic
        - asset: packages/retro_design_system/assets/fonts/Ubuntu_Mono/UbuntuMono-BoldItalic.ttf
          weight: 700
          style: italic
```