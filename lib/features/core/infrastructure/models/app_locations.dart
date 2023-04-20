enum AppLocations {
  welcome,
  main,
  territories,
  fieldService,
  settings,
}

extension AppLocationsExtension on AppLocations {
  String get href {
    switch (this) {
      case AppLocations.main:
        return '/';
      case AppLocations.welcome:
        return '/welcome';
      case AppLocations.fieldService:
        return '/field-service';
      case AppLocations.territories:
        return '/territories';
      case AppLocations.settings:
        return '/settings';
      default:
        return "/";
    }
  }
}
