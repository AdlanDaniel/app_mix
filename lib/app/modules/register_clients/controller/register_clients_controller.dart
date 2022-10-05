import 'package:app_mix/app/modules/repositories/Models/Clients_model.dart';
import 'package:app_mix/app/modules/repositories/Session/session_repository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RegisterClientsController {
  SessionRepository sessionRepository;

  RegisterClientsController({required this.sessionRepository});

  TextEditingController nameClientEC = TextEditingController();
  TextEditingController statusClientEC = TextEditingController();
  TextEditingController birthClientEC = TextEditingController();
  TextEditingController cepClientEC = TextEditingController();
  TextEditingController adressClientEC = TextEditingController();

  clearFields() {
    nameClientEC.clear();
    statusClientEC.clear();
    birthClientEC.clear();
    cepClientEC.clear();
    adressClientEC.clear();
  }

  dialogLoading(context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
    Navigator.pop(context);
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
                'Cliente cadastrado com sucesso',
                style: TextStyle(
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          );
        });
  }

  Future register(context) async {
    ClientsModel clientsModel = ClientsModel();
    clientsModel.nameClient = nameClientEC.text;
    clientsModel.statusClient = statusClientEC.text;
    clientsModel.birthClient = birthClientEC.text;
    clientsModel.cepClient = cepClientEC.text;
    clientsModel.adressClient = adressClientEC.text;
    clientsModel.idClient = sessionRepository.getIdClients();

    try {
      await sessionRepository.registerClients(clientsModel);
      clearFields();
      dialogSucess(context);
    } catch (e) {
      throw Exception();
    }
  }

  registerClients(context) {
    dialogLoading(context);
    register(context);
  }

  Future dateBirthClient(context) async {
    DateTime? dateBirthClient = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1991),
        lastDate: DateTime(2023));

    if (dateBirthClient != null) {
      birthClientEC.text = DateFormat('dd-MM-yyyy').format(dateBirthClient);
    }
  }
}
