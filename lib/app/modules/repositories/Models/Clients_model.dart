import 'package:app_mix/app/modules/repositories/Models/adress_client.dart';

class ClientsModel {
  String? nameClient;
  String? statusClient;
  String? birthClient;
  String? cepClient;
  AdressClient? adressClient;

  String? idClient;

  ClientsModel(
      {this.nameClient,
      this.statusClient,
      this.birthClient,
      this.cepClient,
      this.adressClient,
      this.idClient});

  ClientsModel.fromMap(Map<String, dynamic> map) {
    nameClient = map['nome'];
    statusClient = map['status'];
    birthClient = map['dataNascimento'];
    cepClient = map['cep'];
    adressClient = AdressClient.fromMap(map['endereco']);

    idClient = map['id'];
  }
  Map<String, dynamic> ToMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = nameClient;
    data['status'] = statusClient;
    data['dataNascimento'] = birthClient;
    data['cep'] = cepClient;
    data['endereco'] = adressClient?.toMap();

    data['id'] = idClient;
    return data;
  }
}
