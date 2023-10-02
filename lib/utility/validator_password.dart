String? validatePassword(String? value) {
  String? msg = "";
  if (value!.isEmpty) {
    msg = "Ingresar su contraseña";
  } else if (value.length < 6) {
    msg = "La contraseña tiene que tener un minimo de 6 digitos";
  } else {
    msg = null;
  }
  return msg;
}
