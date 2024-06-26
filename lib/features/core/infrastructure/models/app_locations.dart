enum AppLocations {
  main,
  welcome,
  map,
  territories,
  fieldService,
  settings,
  settingsAboutApp,
}

extension AppLocationsExtension on AppLocations {
  String get href {
    switch (this) {
      case AppLocations.main:
        return '/';
      case AppLocations.welcome:
        return '/welcome';
      case AppLocations.map:
        return '/map';
      case AppLocations.fieldService:
        return '/field-service';
      case AppLocations.territories:
        return '/territories';
      case AppLocations.settings:
        return '/settings';
      case AppLocations.settingsAboutApp:
        return '/settings/about-app';
      default:
        return "/";
    }
  }
}
