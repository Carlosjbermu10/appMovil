class User {
  String? tipo;
  String? numero;
  String? email;
  String? contrato;
  String? token;
  String? renewalToken;
  String? name;

  User(
      {this.tipo,
      this.numero,
      this.email,
      this.contrato,
      this.token,
      this.renewalToken,
      this.name});

  // now create converter

  factory User.fromJson(Map<String, dynamic> responseData) {
    return User(
      tipo: responseData['tipo'],
      numero: responseData['numero'],
      email: responseData['email'],
      contrato: responseData['contrato'],
      token: responseData['token'],
      renewalToken: responseData['token'],
      name: responseData['name'],
    );
  }
}
