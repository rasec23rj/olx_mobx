import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:olx_mobx/pages/sign_in/sign_in.dart';
import 'package:olx_mobx/widgets/custom_text_filed.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Scaffold(
            appBar: AppBar(title: const Text('Cadastrar')),
            body: SingleChildScrollView(
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
                          CustomTextFiled(label: 'Apelido'),
                          CustomTextFiled(
                            label: 'E-mail',
                            keyBoardType: TextInputType.emailAddress,
                          ),
                          CustomTextFiled(
                            label: 'Celular',
                            hintText: '21 9999-9999',
                            keyBoardType: TextInputType.phone,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              TelefoneInputFormatter(),
                            ],
                          ),
                          CustomTextFiled(label: 'Senha'),
                          CustomTextFiled(label: 'Confirma Senha'),

                          const SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context).primaryColor,
                                foregroundColor: Colors.white,
                              ),
                              onPressed: () {},
                              child: Text('Cadastre-se'),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Já tem uma conta?'),

                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (_) => SignIn()),
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
          );
        },
      ),
    );
  }
}
