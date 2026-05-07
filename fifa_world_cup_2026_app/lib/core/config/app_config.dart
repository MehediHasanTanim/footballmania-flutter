import 'package:flutter/foundation.dart';

import 'app_environment.dart';

@immutable
class AppConfig {
  const AppConfig({
    required this.appName,
    required this.baseApiUrl,
    required this.footballApiBaseUrl,
    required this.newsApiBaseUrl,
    required this.loggingEnabled,
    required this.apiTimeout,
  });

  final String appName;
  final String baseApiUrl;
  final String footballApiBaseUrl;
  final String newsApiBaseUrl;
  final bool loggingEnabled;
  final Duration apiTimeout;

  static AppConfig get current {
    return switch (AppEnvironment.current) {
      AppEnvironment.dev => dev,
      AppEnvironment.staging => staging,
      AppEnvironment.production => production,
    };
  }

  static const dev = AppConfig(
    appName: 'FIFA World Cup 2026 Dev',
    baseApiUrl: 'http://localhost:8020/',
    footballApiBaseUrl:
        'https://dev-football-api.fifa-world-cup-2026.example.com',
    newsApiBaseUrl: 'https://dev-news-api.fifa-world-cup-2026.example.com',
    loggingEnabled: true,
    apiTimeout: Duration(seconds: 30),
  );

  static const staging = AppConfig(
    appName: 'FIFA World Cup 2026 Staging',
    baseApiUrl: 'https://staging-api.fifa-world-cup-2026.example.com',
    footballApiBaseUrl:
        'https://staging-football-api.fifa-world-cup-2026.example.com',
    newsApiBaseUrl: 'https://staging-news-api.fifa-world-cup-2026.example.com',
    loggingEnabled: true,
    apiTimeout: Duration(seconds: 30),
  );

  static const production = AppConfig(
    appName: 'FIFA World Cup 2026',
    baseApiUrl: 'https://api.fifa-world-cup-2026.example.com',
    footballApiBaseUrl: 'https://football-api.fifa-world-cup-2026.example.com',
    newsApiBaseUrl: 'https://news-api.fifa-world-cup-2026.example.com',
    loggingEnabled: false,
    apiTimeout: Duration(seconds: 20),
  );
}
