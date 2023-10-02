import 'package:flutter/material.dart';
import '../responsive.dart';
import 'package:oficina_datalink/Widgets/button_widget.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({super.key});

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
        ),
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Container(
              height: responsive.hp(15),
              color: Colors.white,
              alignment: Alignment.center,
              child: Flexible(
                  child: Text(
                'MIS SERVICIOS',
                style: TextStyle(
                    fontSize: (responsive.ip(3.5)),
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              )),
            ),
            Flexible(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                height: responsive.hp(80),
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(0, 136, 206, 1),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35),
                    )),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 15),
                      SizedBox(
                        height: responsive.hp(30),
                        width: responsive.wp(85),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 10),
                                Text(
                                  'Foto', // Aqui va la foto que cambia con el tipo_producto
                                  style: TextStyle(
                                      fontSize: (responsive.ip(2)),
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black),
                                ),
                                Text(
                                  'Contrato:', // valor api nro_contrato
                                  style: TextStyle(
                                      fontSize: (responsive.ip(2)),
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  'Suscripción:', // detalle_suscripcion
                                  style: TextStyle(
                                      fontSize: (responsive.ip(2)),
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black),
                                ),
                                Text(
                                  'Servicio:', //servicio_general
                                  style: TextStyle(
                                      fontSize: (responsive.ip(2)),
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black),
                                ),
                                Text(
                                  'Tipo cliente:', // tipo_cliente_srv
                                  style: TextStyle(
                                      fontSize: (responsive.ip(2)),
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black),
                                ),
                                Text(
                                  'aqui valor de suscripcion', // suscripcion
                                  style: TextStyle(
                                      fontSize: (responsive.ip(2)),
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black),
                                ),
                                Text(
                                  'Aqui va status', // status_contrato
                                  style: TextStyle(
                                      fontSize: (responsive.ip(2)),
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black),
                                ),
                                Text(
                                  'Aqui va deuda', // deuda_usd
                                  style: TextStyle(
                                      fontSize: (responsive.ip(2)),
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black),
                                ),
                              ]),
                        ),
                      ),
                      const SizedBox(height: 90),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: responsive.hp(3)),
                        child: CustomButton(
                            text: 'Regresar',
                            prueba: 1,
                            onTap: () => Navigator.pop(context)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
