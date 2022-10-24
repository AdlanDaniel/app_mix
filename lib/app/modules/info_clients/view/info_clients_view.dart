import 'package:app_mix/app/core/rest_client/firebase.dart';
import 'package:app_mix/app/modules/info_clients/controller/info_clients_controller.dart';
import 'package:app_mix/app/modules/repositories/Models/Clients_model.dart';
import 'package:app_mix/app/modules/repositories/Session/session_repository.dart';
import 'package:app_mix/app/modules/repositories/Session/session_repository_impl.dart';
import 'package:flutter/material.dart';

class InfoClientsView extends StatefulWidget {
  const InfoClientsView({Key? key}) : super(key: key);

  @override
  State<InfoClientsView> createState() => _InfoClientsViewState();
}

class _InfoClientsViewState extends State<InfoClientsView> {
  SessionRepository repository = SessionRepositoryImpl(
      auth: FirebaseClient.auth(), db: FirebaseClient.db());
  late InfoClientsController infoClientsController =
      InfoClientsController(repository: repository);

  @override
  Widget build(BuildContext context) {
    final clientsModel =
        ModalRoute.of(context)!.settings.arguments as ClientsModel;
    infoClientsController.nameClientEC.text = clientsModel.nameClient ?? '';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informacoes de Cliente'),
        backgroundColor: Color(0xFF7C4DFF),
      ),
      body: Container(
          color: Color.fromARGB(255, 173, 202, 251),
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Card(
                  elevation: 21,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Column(
                      children: [
                        Center(
                          child: CircleAvatar(
                            backgroundColor: Color(0xFF7C4DFF),
                            radius: MediaQuery.of(context).size.width * 0.2,
                            child: Text(
                              clientsModel.nameClient
                                  .toString()
                                  .characters
                                  .first,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.2),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25.0),
                          child: Text(
                            'NOME:',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(clientsModel.nameClient ?? '',
                              style: TextStyle(
                                fontSize: 17,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Text(
                            'STATUS:',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(clientsModel.statusClient ?? '',
                              style: TextStyle(
                                fontSize: 17,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Text(
                            'DATA DE NASCIMENTO:',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(clientsModel.birthClient ?? '',
                              style: TextStyle(
                                fontSize: 17,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Text(
                            'ENDERECO:',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Logradouro: '),
                                Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    Text(
                                        clientsModel.adressClient?.logradouro ??
                                            '',
                                        style: TextStyle(
                                          fontSize: 17,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Bairro: '),
                              Text(clientsModel.adressClient?.bairro ?? '',
                                  style: TextStyle(
                                    fontSize: 17,
                                  )),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Complemento: '),
                                Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    Text(
                                        clientsModel
                                                .adressClient?.complemento ??
                                            '',
                                        style: TextStyle(
                                          fontSize: 17,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Cidade: '),
                              Text(clientsModel.adressClient?.localidade ?? '',
                                  style: TextStyle(
                                    fontSize: 17,
                                  )),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Estado: '),
                              Text(clientsModel.adressClient?.uf ?? '',
                                  style: TextStyle(
                                    fontSize: 17,
                                  )),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('CEP: '),
                              Text(clientsModel.adressClient?.cep ?? '',
                                  style: TextStyle(
                                    fontSize: 17,
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          )),
    );
  }
}
