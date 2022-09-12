class UserModel {
  String? name;
  String? email;
  String? password;
  String? adress;
  String? birth;
  String? cpf;

  UserModel(
      {this.name,
      this.email,
      this.adress,
      this.password,
      this.birth,
      this.cpf});

  UserModel.fromMap(Map<String, dynamic> map) {
    name = map['name'];
    email = map['email'];
    password = map['password'];
    adress = map['adress'];
    birth = map['birth'];
    cpf = map['cpf'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['email'] = email;

    data['password'] = password;
    data['adress'] = adress;
    data['birth'] = birth;
    data['cpf'] = cpf;
    return data;
  }
}
