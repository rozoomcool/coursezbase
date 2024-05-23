import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/bloc/auth_bloc/auth_cubit.dart';
import '../../domain/dto/user_dto.dart';
import '../../main.dart';
import '../../utils/custom_scaffoldutils.dart';

@RoutePage()
class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with TickerProviderStateMixin {
  bool _showPassword = false;
  final usernameController = TextEditingController(text: "");
  final emailController = TextEditingController(text: "");
  final passwordController = TextEditingController(text: "");

  @override
  void initState() {
    super.initState();
  }

  void toggleShowPassword() => setState(() => _showPassword = !_showPassword);

  void login() async {
    context.read<AuthCubit>().signIn(UserDto(
        username: usernameController.value.text,
        password: passwordController.value.text));
  }

  @override
  Widget build(BuildContext context) {
    bool _keyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;
    return ScaffoldMessenger(
      key: GetIt.I<CustomScaffoldUtils>().key,
      child: Scaffold(
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Text(
              "",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
        ),
        bottomSheet: BottomSheet(
          elevation: 4,
          enableDrag: false,
          onClosing: () {},
          builder: (BuildContext context) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 28.0, vertical: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 16,),
                  Text(
                    "Добро пожаловать",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                  TextField(
                    controller: usernameController,
                    decoration: const InputDecoration(
                        labelText: "Имя пользователя",
                        border: OutlineInputBorder()),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextField(
                    controller: passwordController,
                    obscureText: !_showPassword,
                    decoration: InputDecoration(
                      suffixIcon: InkWell(
                          child: IconButton(
                              onPressed: () => toggleShowPassword(),
                              icon: Icon(_showPassword
                                  ? Iconsax.eye_slash
                                  : Iconsax.eye))),
                      labelText: "Пароль",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                      onPressed: () => login(), child: Text("Войти")),
                  const SizedBox(
                    height: 48,
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void togglePasswordVisible(bool val) => setState(() => _showPassword = val);
}
