### Quick summary

This repo is a small Flutter UI project implementing a responsive Welcome / Login / Signup flow. The app is single-package, UI-first, and uses a small set of components under `lib/`.

### Big picture
- Entry: `lib/main.dart` — sets app theme and launches `WelcomeScreen`.
- Screens: `lib/Screens/*` — each screen (Welcome, Login, Signup) follows the same pattern: a top-level `<Screen>Screen` plus a `components/` folder for local widgets.
- Layout pattern: `lib/responsive.dart` provides breakpoints used throughout. Screens wrap content with `Background` (see `lib/components/background.dart`) and `Responsive` to provide mobile/desktop variants.
- Visual tokens: `lib/constants.dart` centralizes colors and `defaultPadding` used across UI.
- Assets: declared in `pubspec.yaml` under `assets/images/` and `assets/icons/`.

Key files to inspect:
- [README.md](README.md)
- [lib/main.dart](lib/main.dart)
- [lib/constants.dart](lib/constants.dart)
- [lib/responsive.dart](lib/responsive.dart)
- [lib/Screens/Welcome/welcome_screen.dart](lib/Screens/Welcome/welcome_screen.dart)

### Project-specific conventions and patterns
- Responsive breakpoints: `Responsive.isMobile` if width < 576, tablet 576–992, desktop > 992 — use these helpers when you need conditional layouts.
- Component structure: new screen → `lib/Screens/<Name>/<name>_screen.dart` + `lib/Screens/<Name>/components/` for related widgets.
- Theming: global button style and input style are defined in `ThemeData` inside `lib/main.dart`; prefer using the provided theme instead of hardcoding colors/sizes.
- Use `const` constructors where possible (the repo already favors `const`).
- Use `defaultPadding` and `kPrimaryColor` from `lib/constants.dart` for spacing/color consistency.

### Build, run, test, and debug (actionable commands)
- Run on default device: `flutter run`
- Run on Chrome (web): `flutter run -d chrome`
- Build APK: `flutter build apk`
- Analyze/lint: `flutter analyze`
- Run tests: `flutter test` (the repo includes a sample `test/widget_test.dart`)
- Hot reload while developing: press `r` in a `flutter run` session or use IDE hot reload.

Notes: this repo uses `flutter_lints` and depends on `flutter_svg` (see `pubspec.yaml`).

### Integration points and external dependencies
- No backend code in this repo. README mentions Serverpod as an optional backend but it's not integrated.
- External packages: `flutter_svg` (uses SVG assets in `assets/icons`).

### When editing or adding features
- Add new assets: place files under `assets/images/` or `assets/icons/` and add the path to `pubspec.yaml`.
- Follow the screen/component layout pattern and wrap the page with `Background` and `Responsive` to match existing UX.
- Keep UI token usage consistent: use `kPrimaryColor`, `kPrimaryLightColor`, and `defaultPadding`.

### Helpful code examples (copy-edit friendly)
- Create a new screen skeleton:

```dart
// lib/Screens/Foo/foo_screen.dart
import 'package:flutter/material.dart';
import '../../components/background.dart';
import '../../responsive.dart';

class FooScreen extends StatelessWidget {
  const FooScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => const Background(
    child: Responsive(mobile: MobileFoo(), desktop: DesktopFoo()),
  );
}
```

### What to avoid / gotchas
- Do not assume server integration exists — this repo is UI-only.
- Keep breakpoint logic aligned to `lib/responsive.dart` to avoid inconsistent behavior across screens.

If anything here is unclear or you want additional examples (e.g., how forms are structured or how to add unit/widget tests), tell me which area to expand.
