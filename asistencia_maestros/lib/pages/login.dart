import 'package:asistencia_maestros/pages/maestros.dart';
import 'package:asistencia_maestros/widgets/botones.dart';
import 'package:asistencia_maestros/widgets/textfields.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var userKey = GlobalKey<FormState>();
  FocusNode focusUsuario = FocusNode();
  final LocalAuthentication _localAuth = LocalAuthentication();

  @override
  Widget build(BuildContext context) {
    var sizeScren = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
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
                  function: (){
                    
                  },
                  controller: userController,
                  formKey: userKey,
                  texto: 'PIN',
                  tipoKeyboard: TextInputType.number,
                  icono: Icons.password,
                ),
                const SizedBox(height: 20),
                botones(
                    onPressed: () async {
                      if(userController.text == '1234'){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => maestrosHome(),));
                    }else{
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
        options: AuthenticationOptions(
            biometricOnly: true, stickyAuth: isAuthenticated),
        localizedReason: 'Authenticate to open the app',
      );
    } catch (e) {
      print(e);
    }

    if (isAuthenticated) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => maestrosHome(),
      ));
      // Navigate to the main screen or perform any other action
    } else {
      // Handle authentication failure
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Authentication failed.'),
        ),
      );
    }
  }
}
