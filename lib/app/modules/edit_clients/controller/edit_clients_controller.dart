import 'package:app_mix/app/modules/repositories/Models/Clients_model.dart';
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
}
