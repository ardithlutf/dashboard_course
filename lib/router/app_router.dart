import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_absen/features/absen/absen_page.dart';
import 'package:simple_absen/features/homepage/ui/home_page.dart';
import 'package:simple_absen/features/login/login_page.dart';

class AppRouter {
  AppRouter._();

  static const String home = '/home';
  static const String absen = '/absen';

  static GoRouter get router => _router;
  static final _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: home,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: absen,
        builder: (context, state) => const AbsenPage(),
      ),
    ],
  );
}
