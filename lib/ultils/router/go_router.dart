import 'package:attatchments_downloader/screens/login_screen.dart';
import 'package:attatchments_downloader/ultils/router/routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final router = GoRouter(
    debugLogDiagnostics: kDebugMode,
    initialLocation: AppRoutes.loginScreen,
    routes: [
      GoRoute(
        name: AppRoutes.loginScreen,
        path: AppRoutes.loginScreen,
        pageBuilder: (context, state) => LoginScreen.page(),
      ),
    ],
  );
}
