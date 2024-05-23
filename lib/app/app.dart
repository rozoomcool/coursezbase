import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../domain/bloc/auth_bloc/auth_cubit.dart';
import '../domain/bloc/auth_bloc/auth_state.dart';
import '../router/app_router.dart';
import '../router/loggeer_observer.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => AuthCubit()..init())],
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          AppRouter appRouter = AppRouter(authState: state);

          return MaterialApp.router(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              textTheme: GoogleFonts.manropeTextTheme(),
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
              useMaterial3: true,
            ),
            routerConfig:
                appRouter.config(navigatorObservers: () => [LoggerObserver()]),
          );
        },
      ),
    );
  }
}
