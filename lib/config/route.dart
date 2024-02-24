import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../helpers/constants.dart';
import 'dia_route_enums.dart';
import '../helpers/dia_scaffold.dart';
import '../splash.dart';

final GoRouter routerx = GoRouter(
  initialLocation: "/",
  redirectLimit: 3,
  errorBuilder: (context, state) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Page not found'),
            ElevatedButton(
              onPressed: () => context.go("/"),
              child: const Text("Go to home page"),
            ),
          ],
        ),
      ),
    );
  },
  navigatorKey: ConstanceData.navigatorKey,
  routes: _buildRoutes(),
);
List<RouteBase> _buildRoutes() {
  return [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return FutureBuilder<bool>(
          future: login(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData && snapshot.data == true) {
                return const DiaScaffold();
              } else {
                return const Splash();
              }
            } else {
              return Scaffold(
                body: Center(
                  child: SizedBox(
                    child: Image.asset(
                      'assets/images/screl.png',
                    ),
                  ),
                ),
              );
            }
          },
        );

        // },
        // );
      },
      routes: [
        ..._staticRoutes(),
      ],
    ),
  ];
}

Future<bool> login() async {
  return true;
}

List<GoRoute> _staticRoutes() {
  return [
    
    GoRoute(
        path: RoutePathDia.splash.name,
        name: RoutePathDia.splash.name,
        builder: (BuildContext context, GoRouterState state) => const Splash()),
    // GoRoute(
    //     path: RoutePathDia.login.name,
    //     name: RoutePathDia.login.name,
    //     builder: (BuildContext context, GoRouterState state) => const LoginScreen()),
    GoRoute(
        path: RoutePathDia.scaffold.name,
        name: RoutePathDia.scaffold.name,
        builder: (BuildContext context, GoRouterState state) => const DiaScaffold()),
  ];
}

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text("Error Screen"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go("/"),
          child: const Text("Go to home page"),
        ),
      ),
    );
  }
}
