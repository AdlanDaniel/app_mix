import 'package:app_mix/app/core/rest_client/firebase.dart';
import 'package:app_mix/app/modules/register_users/controller/register_user_controller.dart';
import 'package:app_mix/app/modules/repositories/Session/session_repository.dart';
import 'package:app_mix/app/modules/repositories/Session/session_repository_impl.dart';
import 'package:flutter/material.dart';

class RegisterUsersView extends StatefulWidget {
  const RegisterUsersView({Key? key}) : super(key: key);

  @override
  State<RegisterUsersView> createState() => _RegisterUsersViewState();
}

class _RegisterUsersViewState extends State<RegisterUsersView> {
  SessionRepository sessionRepository = SessionRepositoryImpl(
      auth: FirebaseClient.auth(), db: FirebaseClient.db());
  late RegisterUserController registerUserController =
      RegisterUserController(repository: sessionRepository);
  final keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF7C4DFF),
          title: const Text('Registro de Usuarios'),
        ),
        body: Container(
          padding: EdgeInsets.only(left: 10, right: 10, top: 10),
          child: SingleChildScrollView(
            child: Form(
              key: keyForm,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: TextFormField(
                      validator: ((value) {
                        if (value!.isEmpty) {
                          return 'Campo obrigatório!';
                        }
                        return null;
                      }),
                      controller: registerUserController.nameEC,
                      decoration: InputDecoration(
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                BorderSide(color: Colors.red, width: 2)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                BorderSide(color: Colors.red, width: 2)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                BorderSide(color: Color(0xFF7C4DFF), width: 2)),
                        labelText: 'Nome',
                        labelStyle: TextStyle(color: Color(0xFF7C4DFF)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                BorderSide(color: Color(0xFF7C4DFF), width: 2)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: TextFormField(
                      validator: ((value) {
                        if (value!.isEmpty || !value.contains("@")) {
                          return 'Digite um email válido ';
                        } else {
                          return null;
                        }
                      }),
                      controller: registerUserController.emailEC,
                      decoration: InputDecoration(
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                BorderSide(color: Colors.red, width: 2)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                BorderSide(color: Colors.red, width: 2)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                BorderSide(color: Color(0xFF7C4DFF), width: 2)),
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Color(0xFF7C4DFF)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                BorderSide(color: Color(0xFF7C4DFF), width: 2)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: TextFormField(
                      controller: registerUserController.cpfEC,
                      validator: ((value) {
                        if (value!.isEmpty) {
                          return 'Digite um CPF válido ';
                        }
                      }),
                      decoration: InputDecoration(
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                BorderSide(color: Colors.red, width: 2)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                BorderSide(color: Colors.red, width: 2)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                BorderSide(color: Color(0xFF7C4DFF), width: 2)),
                        labelText: 'CPF',
                        labelStyle: TextStyle(color: Color(0xFF7C4DFF)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                BorderSide(color: Color(0xFF7C4DFF), width: 2)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: TextFormField(
                      controller: registerUserController.birthEC,
                      validator: ((value) {
                        if (value!.isEmpty) {
                          return 'Digite uma DATA válida ';
                        }
                      }),
                      onTap: () {
                        registerUserController.dateCalendario(context);
                      },
                      decoration: InputDecoration(
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                BorderSide(color: Colors.red, width: 2)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                BorderSide(color: Colors.red, width: 2)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                BorderSide(color: Color(0xFF7C4DFF), width: 2)),
                        labelText: 'Data de Nascimento',
                        labelStyle: TextStyle(color: Color(0xFF7C4DFF)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                BorderSide(color: Color(0xFF7C4DFF), width: 2)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: TextFormField(
                      controller: registerUserController.adressEC,
                      validator: ((value) {
                        if (value!.isEmpty) {
                          return 'Digite um endereco válido ';
                        }
                      }),
                      decoration: InputDecoration(
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                BorderSide(color: Colors.red, width: 2)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                BorderSide(color: Colors.red, width: 2)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                BorderSide(color: Color(0xFF7C4DFF), width: 2)),
                        labelText: 'Endereço',
                        labelStyle: TextStyle(color: Color(0xFF7C4DFF)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                BorderSide(color: Color(0xFF7C4DFF), width: 2)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: TextFormField(
                      controller: registerUserController.passwordEC,
                      validator: ((value) {
                        if (value!.isEmpty) {
                          return 'Digite uma senha válida ';
                        }
                      }),
                      decoration: InputDecoration(
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                BorderSide(color: Colors.red, width: 2)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                BorderSide(color: Colors.red, width: 2)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                BorderSide(color: Color(0xFF7C4DFF), width: 2)),
                        labelText: 'Senha',
                        labelStyle: TextStyle(color: Color(0xFF7C4DFF)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                BorderSide(color: Color(0xFF7C4DFF), width: 2)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xFF7C4DFF))),
                        child: Text('Cadastrar'),
                        onPressed: () {
                          if (keyForm.currentState?.validate() ?? false) {
                            registerUserController.registerDataUser(context);
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
