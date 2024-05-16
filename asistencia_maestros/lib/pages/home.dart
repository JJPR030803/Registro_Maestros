import 'package:asistencia_maestros/colors.dart';
import 'package:asistencia_maestros/pages/estudiantes.dart';
import 'package:asistencia_maestros/widgets/camera.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  final CameraDescription cameraDescription;
  const HomePage({super.key, required this.cameraDescription});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        actions: [Image.asset("lib/assets/images/imagenuat.png"),const SizedBox(width:10 ,)],
        title: const Text(
          "FIANS",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.orange,
        leading: IconButton.filled(
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          icon: const Icon(
            Icons.menu,
            color: Colors.blue,
            fill: 1,
          ),
          color: Colors.blue,
        ),
      ),
      drawer: CustomDrawer(scaffoldKey: _scaffoldKey,cameraDescription: cameraDescription,),
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(8.0),
        //width: widthScreen,
        //height: heightScreen/3,
        child: 
            Center(child: TakePictureScreen(camera: cameraDescription))
      ) ,
    );
  }
}

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
    required this.cameraDescription,
    required GlobalKey<ScaffoldState> scaffoldKey,
  }) : _scaffoldKey = scaffoldKey;
  final CameraDescription cameraDescription;
  final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Drawer(
    
      child: ListView(
        children: [
          DrawerHeader(

            decoration: const BoxDecoration(
              color: Colors.orange,
            ),
            duration: const Duration(milliseconds: 300),
            child: Column(
              
              children: [
                const SizedBox(height: 20,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      scale: 5,
                        "lib/assets/images/imagenuat.png"),
                  ],
                ),
                    const SizedBox(height: 50,),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //Text(
                      //"Menu:",
                      //style: TextStyle(fontSize: 25, color: Colors.white),
                    //),
                    SizedBox(
                      width: 150,
                    ),
                    
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 0,),
           BotonesMenu(texto: "Maestros",onTap:() {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage(cameraDescription: cameraDescription ),));
            
          },),
           BotonesMenu(texto: "Estudiantes",onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> EstudiantesLista(cameraDescription: cameraDescription,)));
           },),
           BotonesMenu(onTap: (){

           }, texto: "Historial"),
          const SizedBox(height: 400,),
        ],
      ),
    );
  }
}
class BotonesMenu extends StatelessWidget {
  final String texto;
  final GestureTapCallback onTap;

  const BotonesMenu({
    Key? key,
    required this.onTap,
    required this.texto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 75,
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 5, color: Colors.black),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(Icons.book),
            Text(
              texto,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
