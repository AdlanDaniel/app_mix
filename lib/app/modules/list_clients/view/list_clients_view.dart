import 'package:app_mix/app/core/rest_client/firebase.dart';
import 'package:app_mix/app/modules/list_clients/controller/list_clients_controller.dart';
import 'package:app_mix/app/modules/repositories/Session/session_repository.dart';
import 'package:app_mix/app/modules/repositories/Session/session_repository_impl.dart';
import 'package:app_mix/app/routes/routes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../repositories/Models/Clients_model.dart';

class ListClientsView extends StatefulWidget {
  const ListClientsView({Key? key}) : super(key: key);

  @override
  State<ListClientsView> createState() => _ListClientsViewState();
}

class _ListClientsViewState extends State<ListClientsView> {
  SessionRepository repository = SessionRepositoryImpl(
      auth: FirebaseClient.auth(), db: FirebaseClient.db());
  late ListClientsController listClientsController =
      ListClientsController(repository: repository);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(
            child: Text('Teste do metodo'),
            onPressed: () {
              listClientsController.getDocsClients();
            },
          ),
        ],
        title: const Text('Lista de Clientes'),
        backgroundColor: Color(0xFF7C4DFF),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: listClientsController.streamClients(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Erro ao buscar informacoes'),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              List<QueryDocumentSnapshot> queryDocumentSnapshot =
                  snapshot.data!.docs;
              return ListView.builder(
                  itemCount: queryDocumentSnapshot.length,
                  itemBuilder: (context, i) {
                    List<ClientsModel> listClients = [];
                    for (DocumentSnapshot item in queryDocumentSnapshot) {
                      var dados = item.data() as Map<String, dynamic>;
                      ClientsModel dadosClients = ClientsModel.fromMap(dados);
                      listClients.add(dadosClients);
                    }

                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.infoClients,
                            arguments: listClients[i]);
                      },
                      child: Card(
                        child: ListTile(
                          title: Text(listClients[i].nameClient!),
                          subtitle: Text(listClients[i].statusClient!),
                          leading: CircleAvatar(
                            child: Text(listClients[i]
                                .nameClient!
                                .characters
                                .first
                                .toUpperCase()),
                            radius: 35,
                            backgroundColor: Color(0xFF7C4DFF),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 25,
                          ),
                        ),
                      ),
                    );
                  });
            }
          }),
    );
  }
}
