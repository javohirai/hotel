import 'package:flutter/material.dart';
import 'package:hotel/domain/navigation/main_navigation.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hotel',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      initialRoute: MainNavigationRoutes.initialRoute,
      routes: MainNavigation.routes,
      onGenerateRoute: MainNavigation.onGenerateRoute,
    );
  }
}
