import 'package:app_mix/app/modules/repositories/Session/session_repository.dart';
import 'package:flutter/material.dart';

class InfoClientsController {
  SessionRepository repository;

  InfoClientsController({required this.repository});

  TextEditingController nameEC = TextEditingController();
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
