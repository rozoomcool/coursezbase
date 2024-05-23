import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../domain/bloc/auth_bloc/auth_state.dart';
import 'app_router.dart';

class AuthGuard extends AutoRouteGuard {
  final AuthState authState;

  AuthGuard({required this.authState});

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    // final context = router.navigatorKey.currentContext;
    // if (context != null) {
    //   final authState = BlocProvider.of<AuthCubit>(context).state;
    //
    //   var prefs = GetIt.I<SharedPreferences>();
    //   // String authState = prefs.getString("auth") ?? "";

    if (authState is! UnauthorizedAuthState && authState is! UnknownAuthState) {
      resolver.next();
    } else {
      resolver.redirect(const AuthRoute());
    }
  }
}
