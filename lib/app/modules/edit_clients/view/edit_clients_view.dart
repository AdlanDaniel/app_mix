import 'package:app_mix/app/core/rest_client/firebase.dart';
import 'package:app_mix/app/modules/edit_clients/controller/edit_clients_controller.dart';
import 'package:app_mix/app/modules/repositories/Session/session_repository.dart';
import 'package:app_mix/app/modules/repositories/Session/session_repository_impl.dart';
import 'package:flutter/material.dart';

import '../../repositories/Models/Clients_model.dart';

class EditClientsView extends StatefulWidget {
  const EditClientsView({Key? key}) : super(key: key);

  @override
  State<EditClientsView> createState() => _EditClientsViewState();
}

class _EditClientsViewState extends State<EditClientsView> {
  SessionRepository repository = SessionRepositoryImpl(
      auth: FirebaseClient.auth(), db: FirebaseClient.db());
  late EditClientsController editClientsController =
      EditClientsController(repository: repository);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final clientsModel =
        ModalRoute.of(context)!.settings.arguments as ClientsModel;
    editClientsController.nameClientEC.text = clientsModel.nameClient ?? '';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Clientes'),
      ),
      body: Container(
        child: Column(
          children: [
            TextFormField(
              controller: editClientsController.nameClientEC,
            )
          ],
        ),
      ),
    );
  }
}
