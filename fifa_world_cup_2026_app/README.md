# fifa_world_cup_2026_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Code Generation

Run this after changing Freezed DTOs, Json Serializable models, Hive models, or other generated Dart sources:

```bash
dart run build_runner build --delete-conflicting-outputs
```

## Backend API

The dev app environment points Dio at the FastAPI backend proxy:

```text
http://localhost:8020/
```

Swagger docs are available while the backend is running:

```text
http://localhost:8020/docs
```

Run the app in the default dev environment with:

```bash
flutter run --dart-define=ENV=dev
```
