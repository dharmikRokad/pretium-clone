enum AppRoutes {
  splash,
  onborad,
  login,
  signup,
  codeVerification,
  home;
}

extension RoutePathExtension on AppRoutes {
  String get path => switch (this) { AppRoutes.home => "/", _ => "/$name"}; 
}