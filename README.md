# MyMacro

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

<br>

#### DB
[Isar Database](https://isar.dev/)


#### API USAGE
[FatSecret Platform API OAuth 1.0 Protocol](https://platform.fatsecret.com/docs/guides)

#### State Management (일부)
[Provider](https://pub.dev/packages/provider)

#### Push Notification
[Local Push Notification](https://pub.dev/packages/flutter_local_notifications)

<br>

```
lib/
┣ models/
┃ ┣ food_model.dart
┃ ┣ isar_data.dart
┃ ┗ isar_data.g.dart
┣ providers/
┃ ┣ diet_provider.dart
┃ ┗ food_provider.dart
┣ screens/
┃ ┣ intro_screens/
┃ ┃ ┣ first_intro.dart
┃ ┃ ┣ manual_page.dart
┃ ┃ ┗ second_intro.dart
┃ ┣ date_page.dart
┃ ┣ diet_page.dart
┃ ┣ food_list_page.dart
┃ ┗ setting_page.dart
┣ services/
┃ ┣ api.service.dart
┃ ┣ isar.service.dart
┃ ┗ noti.service.dart
┣ ui/
┃ ┗ diet_page.dart
┣ utils/
┃ ┣ components/
┃ ┃ ┣ nutrition_tile.dart
┃ ┃ ┗ setting_card.dart
┃ ┣ logic/
┃ ┃ ┗ data_process.dart
┃ ┣ widgets/
┃ ┃ ┣ bottom_modal_sheet.dart
┃ ┃ ┣ bottom_navigation_bar.dart
┃ ┃ ┗ calendar.dart
┃ ┗ drawer.dart
┣ images/
┣ main.dart
┗ page_router.dart
┃ ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
┣ pubspec.yaml/
┃ ┣ < used packages/plugins >
┃ ┣ cupertino_icons: ^1.0.6
┃ ┣ shared_preferences: ^2.2.3
┃ ┣ is_first_run: ^1.0.0
┃ ┣ google_nav_bar: ^5.0.6
┃ ┣ table_calendar: ^3.1.2
┃ ┣ percent_indicator: ^4.2.3
┃ ┣ isar: ^3.1.0+1
┃ ┣ isar_flutter_libs: ^3.1.0+1
┃ ┣ path_provider: ^2.1.3
┃ ┣ intl: ^0.19.0
┃ ┣ url_launcher: ^6.3.0
┃ ┣ google_fonts: ^6.2.1
┃ ┣ lottie: ^3.1.2
┃ ┣ flutter_launcher_icons: ^0.13.1
┃ ┣ change_app_package_name: ^1.3.0
┃ ┣ provider: ^6.1.2
┃ ┣ http: ^1.2.2
┃ ┣ crypto: ^3.0.5
┃ ┣ flutter_staggered_grid_view: ^0.7.0
┃ ┣ shimmer: ^3.0.0
┃ ┣ flutter_local_notifications: ^17.2.3
┃ ┣ timezone: ^0.9.4
┃ ┣ flutter_animate: ^4.5.0
┃ ┗ flutter_timezone: ^3.0.1
```
