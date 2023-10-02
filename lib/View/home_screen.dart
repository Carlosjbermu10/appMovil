import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:oficina_datalink/providers/name_provider.dart';
import 'package:provider/provider.dart';
import '../providers/logout_provider.dart';
import '../responsive.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    NameProvider namePro = Provider.of<NameProvider>(context, listen: false);
    String name = "";
    namePro.getName().then((value) => name = value!);
    print(name);

    final Responsive responsive = Responsive.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.3,
          toolbarHeight: responsive.hp(8),
          automaticallyImplyLeading: false,
          title: Image.asset('assets/logonav.png'),
          centerTitle: true,
          actions: [
            IconButton(
                color: const Color.fromRGBO(0, 136, 206, 1),
                onPressed: () {
                  _logout(context);
                },
                icon: const Icon(Icons.logout_outlined))
          ],
        ),
        body: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Container(
              height: responsive.hp(15),
              color: Colors.white,
              padding: const EdgeInsets.only(left: 30, right: 50),
              child: Row(
                children: [
                  Icon(
                    Icons.account_box_rounded,
                    size: responsive.ip(10),
                  ),
                  Flexible(
                    child: ListTile(
                      title: Text('Maria', //estos deben ser datos recibidos por API
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: responsive.ip(2.5)),
                      ),
                      subtitle: Text(
                        'En linea', // dato constante o tal vez no hace falta
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: responsive.ip(1.2)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // TODO: hace falta añadir el resumen que quieren, mas como son datos traidos de api no comprendo como colocarlo
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
              height: responsive.hp(80),
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(0, 136, 206, 1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  )),
              child: GridView.count(
                //physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: responsive.ip(2),
                mainAxisSpacing: responsive.ip(1.5),
                children: [
                  GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, '/servicios'), //rutas
                    child: dashboardItems(
                        'Mis Servicios', Icons.assignment, responsive),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/'), //rutas
                    child: dashboardItems(
                        'Deudas', Icons.monetization_on_rounded, responsive),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/'), //rutas
                    child: dashboardItems('Historial de Pagos',
                        Icons.restore_rounded, responsive),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/'), //rutas
                    child: dashboardItems(
                        'Reportar pago', Icons.payment_rounded, responsive),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/'), //rutas
                    child: dashboardItems('Contratos adicionales',
                        Icons.add_home_work_rounded, responsive),
                  ),
                  GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, '/contactInfo'), //rutas
                    child: dashboardItems('Contacto', Icons.chat, responsive),
                  ),
                  GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, '/passwordChange'),
                    child: dashboardItems(
                        'Cambiar Contraseña', Icons.lock_rounded, responsive),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _logout(BuildContext context) {
    LogoutProvider logout = Provider.of<LogoutProvider>(context, listen: false);
    logout.logout().then((response) {
      dynamic? responsee = response;
      print(responsee);
      if (responsee['status']) {
        String mensaje = responsee['message'].toString();
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Cambio realizado'),
                content: SingleChildScrollView(
                  child: Text(mensaje),
                ),
                actions: [
                  TextButton(
                    child: const Text('Aceptar'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/welcome');
                    },
                  )
                ],
              );
            });
      } else {
        Flushbar(
          title: "No se puede cerrar sesion",
          message: responsee['data']['detalles'].toString(),
          duration: const Duration(seconds: 5),
        ).show(context);
      }
    });
  }

  dashboardItems(String title, IconData iconData, Responsive responsive) =>
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              child: Icon(iconData,
                  color: const Color.fromRGBO(255, 102, 0, 1),
                  size: responsive.ip(6)),
            ),
            Flexible(
              child: Text(title,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: responsive.ip(1.6))),
            )
          ],
        ),
      );
}
