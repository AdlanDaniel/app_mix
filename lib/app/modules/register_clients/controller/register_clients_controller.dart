import 'package:app_mix/app/modules/repositories/Models/Clients_model.dart';
import 'package:app_mix/app/modules/repositories/Models/adress_client.dart';
import 'package:app_mix/app/modules/repositories/Session/session_repository.dart';
import 'package:app_mix/app/modules/repositories/Session/session_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class RegisterClientsController {
  SessionRepository sessionRepository;

  RegisterClientsController({required this.sessionRepository});

  TextEditingController nameClientEC = TextEditingController();
  TextEditingController statusClientEC = TextEditingController();
  TextEditingController birthClientEC = TextEditingController();
  TextEditingController cepClientEC = TextEditingController();

  TextEditingController logradouroClientEC = TextEditingController();
  TextEditingController bairroClientEC = TextEditingController();
  TextEditingController cidadeClientEC = TextEditingController();
  TextEditingController estadoClientEC = TextEditingController();
  TextEditingController complementoClientEC = TextEditingController();

  List<String> itemsCidade = [
    '< Escolher Cidade >',
    'Teresina',
    'Fortaleza',
    'Sao Luis'
  ];
  String valueInicialCidade = '< Escolher Cidade >';
  List<String> itemsEstado = [
    '< Escolher Estado >',
    'Piaui',
    'Ceara',
    'Maranhao'
  ];
  String valueInicialEstado = '< Escolher Estado >';
  late String? valueCidade;
  late String? valueEstado;

  Future<void> getAdressClient(context) async {
    try {
      AdressClient adressClient = AdressClient();
      adressClient.cep = cepClientEC.text;
      AdressClient? adressClientAPI =
          await sessionRepository.getAdressAPI(adressClient);
      logradouroClientEC.text = adressClientAPI?.logradouro ?? '';
      bairroClientEC.text = adressClientAPI?.bairro ?? '';
      // cidadeClientEC.text = adressClientAPI?.localidade ?? '';
      // estadoClientEC.text = adressClientAPI?.uf ?? '';
      complementoClientEC.text = adressClientAPI?.complemento ?? '';
    } on CepImcomplete {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Cep incompleto')));
    } on GenericError {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao buscar CEP Informado')));
    }
  }

  clearFields() {
    nameClientEC.clear();
    statusClientEC.clear();
    birthClientEC.clear();
    cepClientEC.clear();
    logradouroClientEC.clear();
    bairroClientEC.clear();
    complementoClientEC.clear();
    cidadeClientEC.clear();
    estadoClientEC.clear();
    
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
    AdressClient adressClient = AdressClient();
    ClientsModel clientsModel = ClientsModel();
    clientsModel.nameClient = nameClientEC.text;
    clientsModel.statusClient = statusClientEC.text;
    clientsModel.birthClient = birthClientEC.text;
    clientsModel.cepClient = cepClientEC.text;
    adressClient.cep = clientsModel.cepClient;
    adressClient.logradouro = logradouroClientEC.text;
    adressClient.bairro = bairroClientEC.text;
    adressClient.complemento = complementoClientEC.text;
    adressClient.localidade = valueCidade;
    adressClient.uf = valueEstado;
    clientsModel.adressClient = adressClient;

    clientsModel.idClient = sessionRepository.getIdClients();

    try {
      await sessionRepository.registerClients(clientsModel);

      clearFields();

      dialogSucess(context);
    } on GenericError {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Erro a cadastrar cliente')));
    }
  }

  registerClients(context) {
    dialogLoading(context);
    try {
      register(context);
    } on GenericError {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Erro a cadastrar cliente')));
    }
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
