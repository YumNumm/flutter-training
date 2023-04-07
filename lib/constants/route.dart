import 'package:flutter/material.dart';
import 'package:flutter_training/features/splash/screen/splash_screen.dart';
import 'package:flutter_training/features/weather/screen/weather_screen.dart';
import 'package:go_router/go_router.dart';

part 'route.g.dart';

@TypedGoRoute<WeatherRoute>(path: '/weather')
class WeatherRoute extends GoRouteData {
  const WeatherRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const WeatherScreen();
}

@TypedGoRoute<SplashRoute>(path: '/')
class SplashRoute extends GoRouteData {
  const SplashRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SplashScreen();
}

final router = GoRouter(
  routes: $appRoutes,
  initialLocation: const SplashRoute().location,
);
