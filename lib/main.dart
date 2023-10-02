import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oficina_datalink/View/home_screen.dart';
import 'package:oficina_datalink/providers/auth_provider.dart';
import 'package:oficina_datalink/providers/change_password_provider.dart';
import 'package:oficina_datalink/providers/logout_provider.dart';
import 'package:oficina_datalink/providers/name_provider.dart';
import 'package:oficina_datalink/providers/recovery_password_provider.dart';
import 'package:oficina_datalink/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:oficina_datalink/View/password_screen.dart';
import 'View/recovery_screen.dart';
import 'View/login_screen.dart';
import 'View/register_screen.dart';
import 'View/welcome_screen.dart';
import 'View/contact_screen.dart';
import 'View/services_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => ChangePasswordProvider()),
        ChangeNotifierProvider(create: (_) => RecoveryPasswordProvider()),
        ChangeNotifierProvider(create: (_) => LogoutProvider()),
        ChangeNotifierProvider(create: (_) => NameProvider()),
      ],
      child: MaterialApp(
        title: 'Datalink',
        debugShowCheckedModeBanner: false, //para quitar el debug
        initialRoute: "/welcome",
        routes: {
          "/welcome": (context) => const WelcomeScreen(),
          "/login": (context) => const LoginScreen(),
          "/register": (context) => const RegisterScreen(),
          "/recovery": (context) => const RecoveryScreen(),
          "/home": (context) => const HomeScreen(),
          "/passwordChange": (context) => const PasswordScreen(),
          "/contactInfo": (context) => const ContactScreen(),
          "/servicios": (context) => const ServiceScreen(),
        },
      ),
    );
  }
}

//https://test-oficina.datalink.com.ve/api/app-movil/login
//https://test-oficina.datalink.com.ve/api/app-movil/register
