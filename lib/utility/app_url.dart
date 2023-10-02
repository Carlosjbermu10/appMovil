class AppUrl {
  static const String baseUrl =
      'https://test-oficina.datalink.com.ve/api/app-movil';

  //post
  static const String login = baseUrl + '/login';

  //post
  static const String register = baseUrl + '/register';

  //get
  static const String deudas = baseUrl + '/deudas';

  //get
  static const String servicios = baseUrl + '/servicios';

  //post
  static const String reportar = baseUrl + '/reporte/reportar';

  //get
  static const String historial = baseUrl + '/reporte/historial';

  //get
  static const String tasa = baseUrl + '/tasa';

  //post
  static const String cambiar_password = baseUrl + '/user/password';

  //post
  static const String asociar_rifs = baseUrl + '/user/rifs/asociar';

  //post
  static const String eliminar_rifs = baseUrl + '/user/rifs/eliminar';

  //post
  static const String recuperar_password = baseUrl + '/password/email';

  //post
  static const String logout = baseUrl + '/logout';
}
