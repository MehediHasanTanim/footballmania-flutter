enum AppEnvironment {
  dev,
  staging,
  production;

  static const _environmentKey = 'ENV';

  static AppEnvironment get current {
    const environment = String.fromEnvironment(
      _environmentKey,
      defaultValue: 'dev',
    );

    return switch (environment.toLowerCase()) {
      'dev' => AppEnvironment.dev,
      'staging' => AppEnvironment.staging,
      'prod' || 'production' => AppEnvironment.production,
      _ => AppEnvironment.dev,
    };
  }
}
