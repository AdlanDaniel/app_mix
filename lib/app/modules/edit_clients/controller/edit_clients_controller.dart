import 'package:app_mix/app/modules/repositories/Models/Clients_model.dart';
import 'package:app_mix/app/modules/repositories/Models/adress_client.dart';
import 'package:app_mix/app/modules/repositories/Session/session_repository.dart';
import 'package:flutter/material.dart';

class EditClientsController {
  SessionRepository repository;

  EditClientsController({required this.repository});

  ClientsModel clientsModel = ClientsModel();

  TextEditingController nameClientEC = TextEditingController();
  TextEditingController statusClientEC = TextEditingController();
  TextEditingController birthClientEC = TextEditingController();
  TextEditingController cepClientEC = TextEditingController();

  TextEditingController logradouroClientEC = TextEditingController();
  TextEditingController bairroClientEC = TextEditingController();
  TextEditingController cidadeClientEC = TextEditingController();
  TextEditingController estadoClientEC = TextEditingController();
  TextEditingController complementoClientEC = TextEditingController();
  late String idClient;

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
                'Cliente editado com sucesso',
                style: TextStyle(
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          );
        });
  }

  Future<void> editClient(String id, context) async {
     dialogLoading(context);
    ClientsModel clientsEdit = ClientsModel();
    AdressClient adressClientEdit = AdressClient();
    clientsEdit.nameClient = nameClientEC.text;
    clientsEdit.statusClient = statusClientEC.text;
    clientsEdit.birthClient = birthClientEC.text;
    adressClientEdit.logradouro = logradouroClientEC.text;
    adressClientEdit.bairro = bairroClientEC.text;
    adressClientEdit.complemento = complementoClientEC.text;
    adressClientEdit.localidade = cidadeClientEC.text;
    adressClientEdit.uf = estadoClientEC.text;
    clientsEdit.adressClient = adressClientEdit;
    clientsEdit.cepClient = cepClientEC.text;
    clientsEdit.idClient = idClient;

   
    try {
      repository.editClients(id, clientsEdit);
      dialogSucess(context);
    } catch (e) {
      throw Exception();
    }
  }
}
