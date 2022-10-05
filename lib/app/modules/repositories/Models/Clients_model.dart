class ClientsModel {
  String? nameClient;
  String? statusClient;
  String? birthClient;
  String? cepClient;
  String? adressClient;
  String? idClient;

  ClientsModel(
      {this.nameClient,
      this.statusClient,
      this.birthClient,
      this.cepClient,
      this.adressClient,
      this.idClient});

  ClientsModel.fromMap(Map<String, dynamic> map) {
    nameClient = map['Nome'];
    statusClient = map['Status'];
    birthClient = map['Data de Nascimento'];
    cepClient = map['CEP'];
    adressClient = map['Endereco'];
    idClient = map['ID'];
  }
  Map<String, dynamic> ToMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Nome'] = nameClient;
    data['Status'] = statusClient;
    data['Data de Nascimento'] = birthClient;
    data['CEP'] = cepClient;
    data['Endereco'] = adressClient;
    data['ID'] = idClient;
    return data;
  }
}
