import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:olx_mobx/core/session/session_store_user.dart';
import 'package:olx_mobx/home_page.dart';

import 'package:olx_mobx/pages/sign_in/sign_in_store.dart';
import 'package:olx_mobx/pages/signup/signup_page.dart';
import 'package:olx_mobx/widgets/custom_text_filed.dart';
import 'package:olx_mobx/widgets/error_box.dart';

class SignIn extends StatefulWidget {
  SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  SignInStore signIn = SignInStore();
  SessionStoreUser sessionStoreUser = GetIt.I<SessionStoreUser>();

  @override
  Future<void> initState() async {
    await sessionStoreUser.getCurrentUser();

    if (sessionStoreUser.user.name.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (_) => HomePage()));
      });
    }
    super.initState();
  }

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
    await sessionStoreUser.getCurrentUser();

    if (sessionStoreUser.user.name.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (_) => HomePage()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Scaffold(
            appBar: AppBar(title: const Text('Sign In')),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 100,
                  horizontal: 20,
                ),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.all(20),
                    width: constraints.maxWidth < 600 ? 375 : 360,

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                              horizontal: 50,
                              vertical: 18,
                            ),
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {},
                          child: Text('Entrar com Facebook'),
                        ),
                        const SizedBox(height: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(child: Text('ou')),

                            Text('Acessar com E-mail:'),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Observer(
                          builder: (_) {
                            return signIn.error != null ||
                                    signIn.error != '' ||
                                    signIn.error!.isEmpty
                                ? ErrorBox(message: signIn.error.toString())
                                : SizedBox();
                          },
                        ),
                        const SizedBox(height: 20),
                        Observer(
                          builder: (_) {
                            return CustomTextFiled(
                              label: 'E-mail',
                              errorText: signIn.emailError,
                              onChanged: signIn.setEmail,
                            );
                          },
                        ),

                        Observer(
                          builder: (_) {
                            return CustomTextFiled(
                              label: 'Password',
                              obscureText: signIn.obscuretxt,
                              errorText: signIn.senhaError,
                              onChanged: signIn.setSenha,
                              suffixIcon: IconButton(
                                onPressed: () => signIn.setObscuretxt(),
                                icon: signIn.obscuretxt
                                    ? Icon(Icons.visibility_off)
                                    : Icon(Icons.visibility),
                              ),
                            );
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Text('Esqueceu a senha?'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Observer(
                          builder: (_) {
                            return SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Theme.of(
                                    context,
                                  ).primaryColor,
                                  foregroundColor: Colors.white,
                                ),
                                onPressed: signIn.loginPressed,
                                child: signIn.loading
                                    ? CircularProgressIndicator(
                                        valueColor: AlwaysStoppedAnimation(
                                          Colors.white,
                                        ),
                                      )
                                    : Text('Entrar'),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 20),
                        Divider(),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Não tem uma conta?'),

                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (_) => SignupPage(),
                                  ),
                                );
                              },
                              child: Text('Cadastre-se'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
