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

Run this after changing Freezed DTOs, Json Serializable models, Hive models, Riverpod generated providers, or other generated Dart sources:

```bash
dart run build_runner build --delete-conflicting-outputs
```

## Riverpod State Management

Shared dependencies are centralized under `lib/shared/providers/`:

- `service_providers.dart` exposes core infrastructure providers such as Dio, API service, cache, connectivity, logger, repositories, and use cases.
- `repository_providers.dart` wires data sources to repository implementations.
- `usecase_providers.dart` wires repositories to domain use cases.

Feature providers live beside each feature presentation layer and expose `AsyncValue` for API-driven state. Widgets should watch providers and call notifier methods such as `refresh()` or `forceRefresh()` instead of constructing services or calling repositories directly.

Useful provider test command:

```bash
flutter test test/features test/shared/state
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
