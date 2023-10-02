import 'package:flutter/material.dart';
import '../responsive.dart';
import 'package:oficina_datalink/Widgets/button_widget.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

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
              height: responsive.hp(12),
              color: Colors.white,
              alignment: Alignment.center,
              child: Flexible(
                child: Text(
                  'CONTACTO',
                  style: TextStyle(
                    fontSize: (responsive.ip(3.2)),
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
                )
              ),
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'NÚMEROS DE CONTACTO',
                                style: TextStyle(
                                  fontSize: (responsive.ip(2.6)),
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                              ),
                              const SizedBox(height: 15),
                              Row(
                                children: [
                                  const SizedBox(width: 6,),
                                  const Icon(Icons.phone_rounded),
                                  const SizedBox(width: 5,),
                                  Text(
                                    'Central Telefónica: +58 295 774 03 50',
                                    style: TextStyle(
                                      fontSize: (responsive.ip(1.9)),
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  const SizedBox(width: 6,),
                                  const Icon(Icons.chat),
                                  const SizedBox(width: 6,),
                                  Text(
                                    'Atención al cliente: +58 424 895 34 71',
                                    style: TextStyle(
                                      fontSize: (responsive.ip(1.9)),
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  const SizedBox(width: 6,),
                                  const Icon(Icons.chat),
                                  const SizedBox(width: 6,),
                                  Text(
                                    'Facturación y Cobranza: +58 424 800 29 31',
                                    style: TextStyle(
                                      fontSize: (responsive.ip(1.8)),
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(width: 6,),
                                  const Icon(Icons.chat),
                                  const SizedBox(width: 6,),
                                  Text(
                                    'Soporte Técnico:',
                                    style: TextStyle(
                                      fontSize: (responsive.ip(1.9)),
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black),
                                  ),
                                ],
                              ),
                              Text(
                                '+58 424 800 29 31',
                                style: TextStyle(
                                  fontSize: (responsive.ip(1.9)),
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black),
                              ),
                              Text(
                                '+58 424 895 34 94',
                                style: TextStyle(
                                  fontSize: (responsive.ip(1.9)),
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black),
                              ),
                            ]
                          ),
                        ),
                      ),
                      const SizedBox(height: 35),
                      SizedBox(
                        height: responsive.hp(15),
                        width: responsive.wp(85),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'REDES SOCIALES',
                                style: TextStyle(
                                  fontSize: (responsive.ip(2.6)),
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                              ),
                              const SizedBox(height: 15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(width: 6,),
                                  const Icon(Icons.photo_camera),
                                  const SizedBox(width: 6,),
                                  Text(
                                    'Instagram: @datalink.com.ve',
                                    style: TextStyle(
                                      fontSize: (responsive.ip(1.9)),
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black),
                                  ),
                                ],
                              ),
                            ]
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: responsive.hp(3)),
                        child: CustomButton(
                            text: 'Regresar',
                            prueba: 1,
                            onTap: () => Navigator.pop(context)
                        ),
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
