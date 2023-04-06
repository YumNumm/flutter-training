import 'package:flutter/material.dart';
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

final router = GoRouter(
  routes: $appRoutes,
  initialLocation: const WeatherRoute().location,
);
