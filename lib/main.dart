import 'dart:ui';
import 'package:dine_in_dia/config/theme.dart';
import 'package:dine_in_dia/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_strategy/url_strategy.dart';
import 'config/route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  setPathUrlStrategy();
  EasyLoading.init();
  runApp(const DineInDia());
}

class DineInDia extends StatelessWidget {
  const DineInDia({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      builder: (context, child) => Overlay(
        initialEntries: [
          OverlayEntry(
            builder: (context) => Material(
              child: FlutterEasyLoading(
                child: ResponsiveBreakpoints.builder(
                    breakpoints: [
                      const Breakpoint(start: 0, end: 390, name: MOBILE),
                      const Breakpoint(start: 801, end: 1920, name: DESKTOP),
                      const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
                    ],
                    child: MaxWidthBox(
                      maxWidth: 1921,
                      child: Builder(builder: (context) {
                        return ResponsiveScaledBox(
                            width: ResponsiveValue<double>(context, conditionalValues: [
                              Condition.between(start: 0, end: 400, value: 450),
                              Condition.between(start: 800, end: 1100, value: 1100),
                              Condition.between(start: 1000, end: 1200, value: 1000),
                            ]).value,
                            child: child ?? const Splash());
                      }),
                    )),
              ),
            ),
          ),
        ],
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: routerx,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch, PointerDeviceKind.stylus, PointerDeviceKind.unknown},
      ),
      title: 'DINE IN DIA',
      theme: AppTheme.getThemeData(ThemeMode.light),
    );
  }
}
