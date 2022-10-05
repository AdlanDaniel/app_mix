import 'package:app_mix/app/core/rest_client/firebase.dart';
import 'package:app_mix/app/modules/login/controller/login_controller.dart';
import 'package:app_mix/app/modules/repositories/Session/session_repository.dart';
import 'package:app_mix/app/modules/repositories/Session/session_repository_impl.dart';
import 'package:app_mix/app/routes/routes.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  SessionRepository repository = SessionRepositoryImpl(
      auth: FirebaseClient.auth(), db: FirebaseClient.db());
  late LoginController loginController =
      LoginController(repository: repository);
  bool passworld = true;
  final keyForm = GlobalKey<FormState>();

  verificationUser()async  {
    var x = await loginController.isUserLoad();
    if (x != null) {
      Navigator.pushNamedAndRemoveUntil(context, Routes.home, (route) => false);
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      verificationUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.infinity,
          padding: EdgeInsets.only(left: 40, right: 40, bottom: 20),
          color: Color(0xFF7C4DFF),
          child: SingleChildScrollView(
            child: Form(
              key: keyForm,
              child: Center(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 150),
                      child: Icon(
                        Icons.person_outline,
                        size: 130,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: TextFormField(
                        controller: loginController.emailEC,
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return 'CAMPO OBRIGATÓRIO';
                          }
                          return null;
                        }),
                        decoration: InputDecoration(
                            errorStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(width: 3, color: Colors.red)),
                            prefixIcon:
                                Icon(Icons.person, color: Color(0xFF7C4DFF)),
                            contentPadding: EdgeInsets.all(20),
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Usuário..',
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)))),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: TextFormField(
                        controller: loginController.passwordEC,
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return 'CAMPO OBRIGATÓRIO';
                          }
                          return null;
                        }),
                        obscureText: passworld,
                        decoration: InputDecoration(
                            errorStyle: TextStyle(color: Colors.white),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(width: 3, color: Colors.red)),
                            contentPadding: EdgeInsets.all(20),
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
                        padding: EdgeInsets.only(top: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Esqueceu a senha?',
                              style: TextStyle(
                                  color: Colors.white,
                                  decoration: TextDecoration.underline,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 45),
                      child: SizedBox(
                        width: 190,
                        height: 45,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20)))),
                          onPressed: () {
                            if (keyForm.currentState?.validate() ?? false) {
                              loginController.loginUser(context);
                            }
                          },
                          child: Text(
                            'Entrar',
                            style: TextStyle(
                                color: Color(0xFF7C4DFF), fontSize: 17),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 25),
                      child: GestureDetector(
                        onTap: (() =>
                            Navigator.pushNamed(context, Routes.registerUsers)),
                        child: Text(
                          'Nao tem cadastro? Cadastre-se aqui!',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
