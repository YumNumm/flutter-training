import 'package:flutter/material.dart';
import 'package:flutter_training/features/home/screen/home_screen.dart';
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

@TypedGoRoute<HomeRoute>(path: '/')
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomeScreen();
}

final router = GoRouter(
  routes: $appRoutes,
  initialLocation: const HomeRoute().location,
);
