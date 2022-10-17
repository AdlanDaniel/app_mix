import 'package:app_mix/app/core/rest_client/firebase.dart';
import 'package:app_mix/app/modules/register_clients/controller/register_clients_controller.dart';
import 'package:app_mix/app/modules/repositories/Models/Clients_model.dart';
import 'package:app_mix/app/modules/repositories/Session/session_repository.dart';
import 'package:app_mix/app/modules/repositories/Session/session_repository_impl.dart';
import 'package:flutter/material.dart';

class RegisterClientsView extends StatefulWidget {
  const RegisterClientsView({Key? key}) : super(key: key);

  @override
  State<RegisterClientsView> createState() => _RegisterClientsViewState();
}

class _RegisterClientsViewState extends State<RegisterClientsView> {
  SessionRepository repository = SessionRepositoryImpl(
      auth: FirebaseClient.auth(), db: FirebaseClient.db());
  late RegisterClientsController registerClientsController =
      RegisterClientsController(sessionRepository: repository);

  final keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF7C4DFF),
        title: const Text('Cadastro de Clientes'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Form(
            key: keyForm,
            child: Column(
              children: [
                TextFormField(
                    controller: registerClientsController.nameClientEC,
                    validator: ((value) {
                      if (value!.isEmpty) {
                        return 'Campo Obrigatório';
                      }
                      return null;
                    }),
                    decoration: InputDecoration(
                      labelText: 'Nome',
                      labelStyle: TextStyle(
                        color: Color(0xFF7C4DFF),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2.5, color: Colors.red)),
                      errorBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2.5, color: Colors.red)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        width: 2.5,
                        color: Color(0xFF7C4DFF),
                      )),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        width: 2.5,
                        color: Color(0xFF7C4DFF),
                      )),
                    )),
                // Padding(
                //   padding: const EdgeInsets.only(top: 10.0),
                //   child: TextFormField(
                //       controller: registerClientsController.statusClientEC,
                //       validator: ((value) {
                //         if (value!.isEmpty) {
                //           return 'Campo Obrigatório';
                //         }
                //         return null;
                //       }),
                //       decoration: InputDecoration(
                //         labelText: 'Status',
                //         labelStyle: TextStyle(
                //           color: Color(0xFF7C4DFF),
                //         ),
                //         focusedErrorBorder: OutlineInputBorder(
                //             borderSide:
                //                 BorderSide(width: 2.5, color: Colors.red)),
                //         errorBorder: OutlineInputBorder(
                //             borderSide:
                //                 BorderSide(width: 2.5, color: Colors.red)),
                //         enabledBorder: OutlineInputBorder(
                //             borderSide: BorderSide(
                //           width: 2.5,
                //           color: Color(0xFF7C4DFF),
                //         )),
                //         focusedBorder: OutlineInputBorder(
                //             borderSide: BorderSide(
                //           width: 2.5,
                //           color: Color(0xFF7C4DFF),
                //         )),
                //       )),
                // ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: TextFormField(
                      controller: registerClientsController.birthClientEC,
                      onTap: () {
                        registerClientsController.dateBirthClient(context);
                      },
                      validator: ((value) {
                        if (value!.isEmpty) {
                          return 'Campo Obrigatório';
                        }
                        return null;
                      }),
                      decoration: InputDecoration(
                        labelText: 'Data de Nascimento',
                        labelStyle: TextStyle(
                          color: Color(0xFF7C4DFF),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2.5, color: Colors.red)),
                        errorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2.5, color: Colors.red)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          width: 2.5,
                          color: Color(0xFF7C4DFF),
                        )),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          width: 2.5,
                          color: Color(0xFF7C4DFF),
                        )),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                            controller: registerClientsController.cepClientEC,
                            validator: ((value) {
                              if (value!.isEmpty && value.length <= 8) {
                                return 'Campo Obrigatório';
                              }
                              return null;
                            }),
                            maxLength: 8,
                            decoration: InputDecoration(
                              labelText: 'CEP',
                              labelStyle: TextStyle(
                                color: Color(0xFF7C4DFF),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2.5, color: Colors.red)),
                              errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2.5, color: Colors.red)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                width: 2.5,
                                color: Color(0xFF7C4DFF),
                              )),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                width: 2.5,
                                color: Color(0xFF7C4DFF),
                              )),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, bottom: 20),
                        child: SizedBox(
                          height: 55,
                          width: 120,
                          child: ElevatedButton(
                            onPressed: () {
                              registerClientsController
                                  .getAdressClient(context);
                            },
                            child: Icon(
                              Icons.search,
                              size: 30,
                            ),
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0xFF7C4DFF))),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: TextFormField(
                      controller: registerClientsController.logradouroClientEC,
                      validator: ((value) {
                        if (value!.isEmpty) {
                          return 'Campo Obrigatório';
                        }
                        return null;
                      }),
                      decoration: InputDecoration(
                        labelText: 'Logradouro',
                        labelStyle: TextStyle(
                          color: Color(0xFF7C4DFF),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2.5, color: Colors.red)),
                        errorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2.5, color: Colors.red)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          width: 2.5,
                          color: Color(0xFF7C4DFF),
                        )),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          width: 2.5,
                          color: Color(0xFF7C4DFF),
                        )),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: TextFormField(
                      controller: registerClientsController.bairroClientEC,
                      validator: ((value) {
                        if (value!.isEmpty) {
                          return 'Campo Obrigatório';
                        }
                        return null;
                      }),
                      decoration: InputDecoration(
                        labelText: 'Bairro',
                        labelStyle: TextStyle(
                          color: Color(0xFF7C4DFF),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2.5, color: Colors.red)),
                        errorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2.5, color: Colors.red)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          width: 2.5,
                          color: Color(0xFF7C4DFF),
                        )),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          width: 2.5,
                          color: Color(0xFF7C4DFF),
                        )),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: TextFormField(
                      controller: registerClientsController.complementoClientEC,
                      decoration: InputDecoration(
                        labelText: 'Complemento',
                        labelStyle: TextStyle(
                          color: Color(0xFF7C4DFF),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2.5, color: Colors.red)),
                        errorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2.5, color: Colors.red)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          width: 2.5,
                          color: Color(0xFF7C4DFF),
                        )),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          width: 2.5,
                          color: Color(0xFF7C4DFF),
                        )),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: DropdownButtonFormField(
                    style: TextStyle(color: Color(0xFF7C4DFF)),
                    iconSize: 30,
                    decoration: InputDecoration(
                      labelText: 'Cidade',
                      labelStyle: TextStyle(
                        color: Color(0xFF7C4DFF),
                      ),
                      contentPadding: EdgeInsets.only(
                        top: 15,
                        bottom: 15,
                        left: 10,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2.5,
                            color: Color(0xFF7C4DFF),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2.5,
                          color: Color(0xFF7C4DFF),
                        ),
                      ),
                    ),
                    items: registerClientsController.itemsCidade
                        .map((item) => DropdownMenuItem<String>(
                            value: item, child: Text(item)))
                        .toList(),
                    value: registerClientsController.valueInicialCidade,
                    onChanged: (String? item) {
                      registerClientsController.valueCidade = item;
                      print(item);
                      setState(() {
                        registerClientsController.valueInicialCidade = item!;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: DropdownButtonFormField(
                    style: TextStyle(color: Color(0xFF7C4DFF)),
                    iconSize: 30,
                    decoration: InputDecoration(
                      labelText: 'Estado',
                      labelStyle: TextStyle(
                        color: Color(0xFF7C4DFF),
                      ),
                      contentPadding: EdgeInsets.only(
                        top: 15,
                        bottom: 15,
                        left: 10,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2.5,
                            color: Color(0xFF7C4DFF),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2.5,
                          color: Color(0xFF7C4DFF),
                        ),
                      ),
                    ),
                    items: registerClientsController.itemsEstado
                        .map((item) => DropdownMenuItem<String>(
                            value: item, child: Text(item)))
                        .toList(),
                    value: registerClientsController.valueInicialEstado,
                    onChanged: (String? item) {
                      registerClientsController.valueEstado = item;
                      setState(() {
                        registerClientsController.valueInicialEstado = item!;
                      });
                    },
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 10.0),
                //   child: TextFormField(
                //       controller: registerClientsController.cidadeClientEC,
                //       validator: ((value) {
                //         if (value!.isEmpty) {
                //           return 'Campo Obrigatório';
                //         }
                //         return null;
                //       }),
                //       decoration: InputDecoration(
                //         labelText: 'Cidade',
                //         labelStyle: TextStyle(
                //           color: Color(0xFF7C4DFF),
                //         ),
                //         focusedErrorBorder: OutlineInputBorder(
                //             borderSide:
                //                 BorderSide(width: 2.5, color: Colors.red)),
                //         errorBorder: OutlineInputBorder(
                //             borderSide:
                //                 BorderSide(width: 2.5, color: Colors.red)),
                //         enabledBorder: OutlineInputBorder(
                //             borderSide: BorderSide(
                //           width: 2.5,
                //           color: Color(0xFF7C4DFF),
                //         )),
                //         focusedBorder: OutlineInputBorder(
                //             borderSide: BorderSide(
                //           width: 2.5,
                //           color: Color(0xFF7C4DFF),
                //         )),
                //       )),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 10.0),
                //   child: TextFormField(
                //       controller: registerClientsController.estadoClientEC,
                //       validator: ((value) {
                //         if (value!.isEmpty) {
                //           return 'Campo Obrigatório';
                //         }
                //         return null;
                //       }),
                //       decoration: InputDecoration(
                //         labelText: 'UF',
                //         labelStyle: TextStyle(
                //           color: Color(0xFF7C4DFF),
                //         ),
                //         focusedErrorBorder: OutlineInputBorder(
                //             borderSide:
                //                 BorderSide(width: 2.5, color: Colors.red)),
                //         errorBorder: OutlineInputBorder(
                //             borderSide:
                //                 BorderSide(width: 2.5, color: Colors.red)),
                //         enabledBorder: OutlineInputBorder(
                //             borderSide: BorderSide(
                //           width: 2.5,
                //           color: Color(0xFF7C4DFF),
                //         )),
                //         focusedBorder: OutlineInputBorder(
                //             borderSide: BorderSide(
                //           width: 2.5,
                //           color: Color(0xFF7C4DFF),
                //         )),
                //       )),
                // ),

                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: SizedBox(
                    width: 200,
                    height: 45,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                          Color(0xFF7C4DFF),
                        )),
                        onPressed: () {
                          if (keyForm.currentState!.validate()) {
                            registerClientsController.registerClients(context);
                          }
                        },
                        child: Text('Cadastrar')),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
