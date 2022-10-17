class AdressClient {
  String? cep;
  String? logradouro;
  String? complemento;
  String? bairro;
  String? localidade;
  String? uf;
  String? ibge;
  String? gia;
  String? ddd;
  String? siafi;

  AdressClient(
      {this.cep,
      this.logradouro,
      this.complemento,
      this.bairro,
      this.localidade,
      this.uf,
      this.ibge,
      this.gia,
      this.ddd,
      this.siafi});

  AdressClient.fromMap(Map<String, dynamic> map) {
    cep = map['cep'];
    logradouro = map['logradouro'];
    complemento = map['complemento'];
    bairro = map['bairro'];
    localidade = map['localidade'];
    uf = map['uf'];
    ibge = map['ibge'];
    gia = map['gia'];
    ddd = map['ddd'];
    siafi = map['siafi'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cep'] = cep;
    data['logradouro'] = logradouro;
    data['complemento'] = complemento;
    data['bairro'] = bairro;
    data['localidade'] = localidade;
    data['uf'] = uf;
    data['ibge'] = ibge;
    data['gia'] = gia;
    data['ddd'] = ddd;
    data['siafi'] = siafi;

    return data;
  }
}
