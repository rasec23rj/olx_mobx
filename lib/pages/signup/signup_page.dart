import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:olx_mobx/pages/sign_in/sign_in.dart';
import 'package:olx_mobx/pages/signup/signup_store.dart';
import 'package:olx_mobx/widgets/custom_text_filed.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  SignupStore signupStore = SignupStore();

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Scaffold(
            appBar: AppBar(title: const Text('Cadastrar')),
            body: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Center(
                  child: SizedBox(
                    width: constraints.maxWidth < 600 ? 375 : 360,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.all(20),
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Observer(
                              builder: (_) {
                                return CustomTextFiled(
                                  label: 'Apelido',
                                  onChanged: signupStore.setName,
                                  errorText: signupStore.nameError,
                                  enabled: !signupStore.loading,
                                );
                              },
                            ),
                            Observer(
                              builder: (_) {
                                return CustomTextFiled(
                                  label: 'E-mail',
                                  keyBoardType: TextInputType.emailAddress,
                                  onChanged: signupStore.setEmail,
                                  errorText: signupStore.emailError,
                                  enabled: !signupStore.loading,
                                );
                              },
                            ),
                            Observer(
                              builder: (_) {
                                return CustomTextFiled(
                                  label: 'Celular',
                                  hintText: '21 9999-9999',
                                  keyBoardType: TextInputType.phone,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    TelefoneInputFormatter(),
                                  ],
                                  onChanged: signupStore.setCelular,
                                  errorText: signupStore.celularError,
                                  enabled: !signupStore.loading,
                                );
                              },
                            ),
                            Observer(
                              builder: (_) {
                                return CustomTextFiled(
                                  label: 'Senha',
                                  onChanged: signupStore.setSenha,
                                  errorText: signupStore.senhaError,
                                  enabled: !signupStore.loading,
                                );
                              },
                            ),
                            Observer(
                              builder: (_) {
                                return CustomTextFiled(
                                  label: 'Confirma Senha',
                                  onChanged: signupStore.setComfirmaSenha,
                                  errorText: signupStore.comfirmaSenhaError,
                                  enabled: !signupStore.loading,
                                );
                              },
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
                                    onPressed: signupStore.sinUpPress,
                                    child: signupStore.loading
                                        ? CircularProgressIndicator(
                                            color: Colors.white,
                                          )
                                        : Text('Cadastre-se'),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 20),
                            Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Já tem uma conta?'),

                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (_) => SignIn(),
                                      ),
                                    );
                                  },
                                  child: Text('Entrar'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
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
