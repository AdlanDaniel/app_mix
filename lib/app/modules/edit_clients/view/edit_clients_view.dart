import 'package:app_mix/app/core/rest_client/firebase.dart';
import 'package:app_mix/app/core/widgets/custom_elevated_button.dart';
import 'package:app_mix/app/core/widgets/custom_text_form_fields.dart';
import 'package:app_mix/app/modules/edit_clients/controller/edit_clients_controller.dart';
import 'package:app_mix/app/modules/repositories/Session/session_repository.dart';
import 'package:app_mix/app/modules/repositories/Session/session_repository_impl.dart';
import 'package:flutter/material.dart';

import '../../repositories/Models/Clients_model.dart';

class EditClientsView extends StatefulWidget {
  final ClientsModel clientsModel;
  const EditClientsView({
    Key? key,
    required this.clientsModel,
  }) : super(key: key);

  @override
  State<EditClientsView> createState() => _EditClientsViewState();
}

class _EditClientsViewState extends State<EditClientsView> {
  SessionRepository repository = SessionRepositoryImpl(
      auth: FirebaseClient.auth(), db: FirebaseClient.db());
  late EditClientsController editClientsController =
      EditClientsController(repository: repository);
  final formsKey = GlobalKey<FormState>();

  getInf() {
    editClientsController.nameClientEC.text =
        widget.clientsModel.nameClient ?? '';
    editClientsController.statusClientEC.text =
        widget.clientsModel.statusClient ?? '';
    editClientsController.birthClientEC.text =
        widget.clientsModel.birthClient ?? '';
    editClientsController.logradouroClientEC.text =
        widget.clientsModel.adressClient?.logradouro ?? '';
    editClientsController.bairroClientEC.text =
        widget.clientsModel.adressClient?.bairro ?? '';
    editClientsController.complementoClientEC.text =
        widget.clientsModel.adressClient?.complemento ?? '';
    editClientsController.cidadeClientEC.text =
        widget.clientsModel.adressClient?.localidade ?? '';
    editClientsController.cidadeClientEC.text =
        widget.clientsModel.adressClient?.localidade ?? '';
    editClientsController.estadoClientEC.text =
        widget.clientsModel.adressClient?.uf ?? '';
    editClientsController.cepClientEC.text =
        widget.clientsModel.cepClient ?? '';
    editClientsController.idClient = widget.clientsModel.idClient!;
  }

  @override
  void initState() {
    getInf();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.clientsModel.nameClient);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF7C4DFF),
        title: const Text('Editar Clientes'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Form(
          key: formsKey,
          child: Column(
            children: [
              CustomTextFormFields(
                  validator: ((value) {
                    if (value!.isEmpty) {
                      return 'Campo Obrigatorio';
                    }
                    return null;
                  }),
                  labelText: 'Nome',
                  controller: editClientsController.nameClientEC),
              SizedBox(height: 15),
              CustomTextFormFields(
                  validator: ((value) {
                    if (value!.isEmpty) {
                      return 'Campo Obrigatorio';
                    }
                    return null;
                  }),
                  labelText: 'Status',
                  controller: editClientsController.statusClientEC),
              SizedBox(height: 15),
              CustomTextFormFields(
                  validator: ((value) {
                    if (value!.isEmpty) {
                      return 'Campo Obrigatorio';
                    }
                    return null;
                  }),
                  labelText: 'Data de nascimento',
                  controller: editClientsController.birthClientEC),
              SizedBox(height: 10),
              CustomTextFormFields(
                  validator: ((value) {
                    if (value!.isEmpty) {
                      return 'Campo Obrigatorio';
                    }
                    return null;
                  }),
                  labelText: 'Logradouro',
                  controller: editClientsController.logradouroClientEC),
              SizedBox(height: 10),
              CustomTextFormFields(
                  validator: ((value) {
                    if (value!.isEmpty) {
                      return 'Campo Obrigatorio';
                    }
                    return null;
                  }),
                  labelText: 'Bairro',
                  controller: editClientsController.bairroClientEC),
              SizedBox(height: 10),
              CustomTextFormFields(
                  labelText: 'Complemento',
                  controller: editClientsController.complementoClientEC),
              SizedBox(height: 10),
              CustomTextFormFields(
                  validator: ((value) {
                    if (value!.isEmpty) {
                      return 'Campo Obrigatorio';
                    }
                    return null;
                  }),
                  labelText: 'Cidade',
                  controller: editClientsController.cidadeClientEC),
              SizedBox(height: 10),
              CustomTextFormFields(
                  validator: ((value) {
                    if (value!.isEmpty) {
                      return 'Campo Obrigatorio';
                    }
                    return null;
                  }),
                  labelText: 'Estado',
                  controller: editClientsController.estadoClientEC),
              SizedBox(height: 10),
              CustomTextFormFields(
                  validator: ((value) {
                    if (value!.isEmpty) {
                      return 'Campo Obrigatorio';
                    }
                    return null;
                  }),
                  labelText: 'CEP',
                  controller: editClientsController.cepClientEC),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: SizedBox(
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: 
                  CustomElevatedButton(
                    onPressed: () {
                      if (formsKey.currentState?.validate() ?? false) {
                        editClientsController
                            .editClient(widget.clientsModel.idClient!,context);
                      }
                    },
                    buttonText: 'Salvar',
                    //     if (formsKey.currentState?.validate() ?? false) {}
                    //   }, ),
                    // child: ElevatedButton(
                    //   onPressed: () {
                    //     if (formsKey.currentState?.validate() ?? false) {}
                    //   },
                    //   child: Text(
                    //     'Salvar',
                    //     style: TextStyle(fontSize: 17),
                    //   ),
                    //   style: ButtonStyle(
                    //       backgroundColor:
                    //           MaterialStateProperty.all(Color(0xFF7C4DFF))),
                    // ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
