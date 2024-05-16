import 'package:asistencia_maestros/pages/home.dart';
import 'package:asistencia_maestros/widgets/botones.dart';
import 'package:asistencia_maestros/widgets/textfields.dart';
import 'package:camera/camera.dart';
import 'package:asistencia_maestros/pages/hora_page.dart';
import 'package:flutter/widgets.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final CameraDescription cameraDescription;
  const LoginPage({Key? key, required this.cameraDescription})
      : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var userKey = GlobalKey<FormState>();
  var passwordKey = GlobalKey<FormState>();
  FocusNode focusPassword = FocusNode();
  FocusNode focusUsuario = FocusNode();
  final LocalAuthentication _localAuth = LocalAuthentication();

  @override
  Widget build(BuildContext context) {
    var sizeScren = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('FIANS'),
      ),
      body: Container(
        constraints: BoxConstraints(
            maxHeight: sizeScren.height, maxWidth: sizeScren.width),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                textfieldsApp(
                  function: () {},
                  controller: userController,
                  formKey: userKey,
                  texto: 'Usuario',
                  tipoKeyboard: TextInputType.number,
                  icono: Icons.supervised_user_circle,
                ),
                const SizedBox(height: 20),
                textfieldsApp(
                    function: () {},
                    icono: Icons.password,
                    tipoKeyboard: TextInputType.visiblePassword,
                    controller: passwordController,
                    formKey: passwordKey,
                    texto: "Contraseña"),
                  const SizedBox(height: 20,),
                botones(
                    onPressed: () async {
                      if (userController.text == '1234') {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => HomePage(
                            cameraDescription: widget.cameraDescription,
                          ),
                        ));
                      } else {
                        await _authenticate(context);
                      }
                    },
                    texto: 'Ingresar')
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _authenticate(BuildContext context) async {
    bool isAuthenticated = false;
    try {
      isAuthenticated = await _localAuth.authenticate(
        options: const AuthenticationOptions(
          biometricOnly: true,
        ),
        localizedReason: 'Authenticate to open the app',
      );
    } catch (e) {
      print(e);
    }

    if (isAuthenticated) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => pageHoras(
          cameraDescription: widget.cameraDescription,
        ),
      ));
      // Navigate to the main screen or perform any other action
    } else {
      // Handle authentication failure
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Authentication failed.'),
        ),
      );
    }
  }
}
