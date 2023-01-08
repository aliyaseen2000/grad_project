import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/services.dart';

import 'pages/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((_) => runApp(LoginUiApp()));
}

class LoginUiApp extends StatelessWidget {
  Color _primaryColor = Color.fromARGB(255, 181, 217, 240);
  Color _accentColor = Color.fromARGB(255, 159, 198, 223);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hemoglobin',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: _primaryColor,
        accentColor: _accentColor,
        scaffoldBackgroundColor: Colors.grey.shade100,
        primarySwatch: Colors.grey,
      ),
      home: SplashScreen(title: 'Hemoglobin'),
    );
  }
}
