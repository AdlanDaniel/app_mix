import 'package:app_mix/app/modules/repositories/Models/User_model.dart';
import 'package:app_mix/app/modules/repositories/Session/session_repository.dart';
import 'package:app_mix/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RegisterUserController {
  SessionRepository repository;

  RegisterUserController({required this.repository});

  dialogLoading(context) {
    showDialog(
        context: context,
        builder: (context) {
          return Container(
            child: SizedBox(
              width: 5,
              child: AlertDialog(
                  title: Center(
                child: CircularProgressIndicator(
                  color: Color(0xFF7C4DFF),
                ),
              )),
            ),
          );
        });
  }

  Future<void> register(UserModel userModel, context) async {
    try {
      dialogLoading(context);
      await repository.registerUSer(userModel);

      Navigator.pop(context);
      dialogSucess(context);
      clearFields();
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("erro  ao cadsstrar")));
    }
  }

  dialogSucess(context) {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: AlertDialog(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.check_box,
                    color: Colors.green,
                    size: 50,
                  )
                ],
              ),
              content: Text(
                'Usuário cadastrado com sucesso',
                style: TextStyle(
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          );
        });
  }

  clearFields() {
    nameEC.clear();
    emailEC.clear();
    cpfEC.clear();
    birthEC.clear();
    adressEC.clear();
    passwordEC.clear();
  }

  TextEditingController nameEC = TextEditingController();
  TextEditingController emailEC = TextEditingController();
  TextEditingController cpfEC = TextEditingController();
  TextEditingController birthEC = TextEditingController();
  TextEditingController adressEC = TextEditingController();
  TextEditingController passwordEC = TextEditingController();

  registerDataUser(context) {
    UserModel user = UserModel();
    user.name = nameEC.text;
    user.email = emailEC.text;
    user.cpf = cpfEC.text;
    user.birth = birthEC.text;
    user.adress = adressEC.text;
    user.password = passwordEC.text;

    register(user, context);
  }

  Future dateCalendario(context) async {
    DateTime? dateBirth = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1990),
        lastDate: DateTime(2023));

    if (dateBirth != null) {
      birthEC.text = DateFormat('dd-MM-yyyy').format(dateBirth);
    } else {
      return null;
    }
  }
}
