import 'dart:ui' as ui;
import 'package:camera/camera.dart';
import 'package:asistencia_maestros/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main()  async {

  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();

// Get a specific camera from the list of available cameras.
  final firstCamera = cameras.first;
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(LoginApp(cameraDescription: firstCamera,));
}

class LoginApp extends StatelessWidget {
  final CameraDescription cameraDescription;

  const LoginApp({super.key, required this.cameraDescription});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: 'Login Demo',
      debugShowCheckedModeBanner: false,
      home: LoginPage(
        cameraDescription: cameraDescription,
      ),
    );
  }
}
