import 'dart:ui';

import 'package:app_mix/app/routes/routes.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool passworld = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.infinity,
          padding: EdgeInsets.only(left: 40, right: 40, bottom: 20),
          color: Color(0xFF7C4DFF),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 150),
                    child: Icon(
                      Icons.person_outline,
                      size: 90,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          prefixIcon:
                              Icon(Icons.person, color: Color(0xFF7C4DFF)),
                          contentPadding: EdgeInsets.only(bottom: 5),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Usuário..',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)))),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: TextFormField(
                      obscureText: passworld,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: 5),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  passworld = !passworld;
                                });
                              },
                              icon: passworld
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility)),
                          prefixIcon: Icon(
                            Icons.key,
                            color: Color(0xFF7C4DFF),
                          ),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Senha..'),
                    ),
                  ),
                  GestureDetector(
                    child: Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Esqueceu a senha?',
                            style: TextStyle(
                              color: Colors.white,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: SizedBox(
                      width: 150,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)))),
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.registerUsers);
                        },
                        child: Text(
                          'Entrar',
                          style: TextStyle(color: Color(0xFF7C4DFF)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: GestureDetector(
                      child: Text(
                        'Nao tem cadastro? Cadastre-se aqui!',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
