import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/bloc/auth_bloc/auth_cubit.dart';
import '../../domain/dto/user_dto.dart';
import '../../main.dart';
import '../../utils/custom_scaffoldutils.dart';

class AuthScreenBackup extends StatefulWidget {
  const AuthScreenBackup({super.key});

  @override
  State<AuthScreenBackup> createState() => _AuthScreenBackupState();
}

class _AuthScreenBackupState extends State<AuthScreenBackup> with TickerProviderStateMixin {
  late final TabController _tabController;
  final List<String> tabs = ['Регистрация', 'Авторизация'];
  int _index = 0;
  bool _showPassword = false;
  final usernameController = TextEditingController(text: "");
  final emailController = TextEditingController(text: "");
  final passwordController = TextEditingController(text: "");

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _index = _tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    bool _keyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;
    return ScaffoldMessenger(
      key: GetIt.I<CustomScaffoldUtils>().key,
      child: Scaffold(
        // key: getIt<CustomScaffoldUtils>().key,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 1,
                child: Container(),
              ),
              Expanded(
                  flex: 1,
                  child: Text(
                    "IT_ABREK",
                    style: Theme.of(context).textTheme.displayLarge,
                  )),
              Expanded(
                  flex: 1,
                  child: TabBar(
                      controller: _tabController,
                      tabs: [Tab(text: tabs[0]), Tab(text: tabs[1])],
                      labelStyle: Theme.of(context).textTheme.bodyLarge,
                      unselectedLabelStyle:
                          Theme.of(context).textTheme.bodyMedium)),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: SingleChildScrollView(
                    child: AnimatedSize(
                      duration: const Duration(milliseconds: 200),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: TextField(
                                controller: usernameController,
                                decoration: const InputDecoration(
                                    hintText: "Введите никнейм",
                                    labelText: "Никнейм",
                                    border: OutlineInputBorder())),
                          ),
                          _index == 0
                              ? Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: TextField(
                                      controller: emailController,
                                      decoration: const InputDecoration(
                                          hintText: "Введите почту",
                                          labelText: "Почта",
                                          border: OutlineInputBorder())),
                                )
                              : Container(),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: TextField(
                                controller: passwordController,
                                obscureText: !_showPassword,
                                decoration: const InputDecoration(
                                    hintText: "Введите пароль",
                                    labelText: "Пароль",
                                    border: OutlineInputBorder())),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Checkbox(
                                    value: _showPassword,
                                    onChanged: (val) => togglePasswordVisible(
                                        val ?? false), //  <-- leading Checkbox
                                  ),
                                  Text('Показать пароль',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium)
                                ],
                              ),
                              _index == 1
                                  ? TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Забыли пароль?',
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium,
                                      ))
                                  : Container()
                            ],
                          ),
                          ElevatedButton(
                              onPressed: () {
                                _index == 0
                                    ? context.read<AuthCubit>().signUp(UserDto(
                                        username: usernameController.text,
                                        email: emailController.text,
                                        password: passwordController.text))
                                    : context.read<AuthCubit>().signIn(UserDto(
                                        username: usernameController.text,
                                        password: passwordController.text));
                              },
                              child: _index == 0
                                  ? const Text("Зарегистрироваться")
                                  : const Text("Войти"))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(flex: 1, child: Container())
            ],
          ),
        ),
      ),
    );
  }

  void togglePasswordVisible(bool val) => setState(() => _showPassword = val);
}
