import 'package:app_mix/app/modules/repositories/Models/Clients_model.dart';
import 'package:flutter/material.dart';

class InfoClientsView extends StatefulWidget {
  const InfoClientsView({Key? key}) : super(key: key);

  @override
  State<InfoClientsView> createState() => _InfoClientsViewState();
}

class _InfoClientsViewState extends State<InfoClientsView> {
  @override
  Widget build(BuildContext context) {
    final clientsModel =
        ModalRoute.of(context)!.settings.arguments as ClientsModel;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informacoes de Cliente'),
      ),
      body: Container(
          child: Column(
        children: [Text(clientsModel.nameClient ?? '')],
      )),
    );
  }
}
