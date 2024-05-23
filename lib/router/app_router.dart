import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../domain/bloc/auth_bloc/auth_state.dart';
import '../features/auth/auth_screen.dart';
import '../features/chat/chat_screen.dart';
import '../features/chat_room/chat_room_screen.dart';
import '../features/dash/dash_screen.dart';
import '../features/home/home_screen.dart';
import '../features/maps/maps_screen.dart';
import '../features/root/root_screen.dart';
import '../features/settings/settings_screen.dart';
import 'auth_route_guard.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  final AuthState authState;

  AppRouter({required this.authState});

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          page: RootRoute.page,
          guards: [AuthGuard(authState: authState)],
          children: [
            RedirectRoute(path: '', redirectTo: 'home'),
            AutoRoute(path: 'home', page: HomeRoute.page),
            AutoRoute(path: 'chat', page: ChatRoute.page),
            AutoRoute(path: 'dash', page: DashRoute.page),
            AutoRoute(path: 'settings', page: SettingsRoute.page),
          ],
        ),
        AutoRoute(path: '/auth', page: AuthRoute.page),
        AutoRoute(path: '/maps', page: MapsRoute.page),
        AutoRoute(path: '/room', page: ChatRoomRoute.page)
      ];
}
