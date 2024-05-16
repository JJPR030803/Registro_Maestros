import 'package:asistencia_maestros/pages/home.dart';
import 'package:asistencia_maestros/widgets/horas.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class pageHoras extends StatefulWidget {
  final CameraDescription cameraDescription;
  const pageHoras({super.key, required this.cameraDescription});

  @override
  State<pageHoras> createState() => _pageHorasState();
}

class _pageHorasState extends State<pageHoras> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
    return Scaffold(
      body: ListView(
        
        padding: EdgeInsets.all(8.0),
        children: [
          horasWidget(activado: true, texto: "209",hora: "9:00",materia: "Ingeniería de Software", cameraDescription: widget.cameraDescription,),
          const SizedBox(height: 10,),
          horasWidget(activado: false, texto: "210",hora: "10:00",materia: "Programación Avanzada", cameraDescription: widget.cameraDescription,),
          const SizedBox(height: 10,),
          horasWidget(activado: false, texto: "211",hora: "11:00",materia: "Ingeniería de Software", cameraDescription: widget.cameraDescription,),
          const SizedBox(height: 10,),
          horasWidget(activado: false, texto: "409",hora: "12:00",materia: "Base de Datos Avanzada", cameraDescription: widget.cameraDescription,),
          const SizedBox(height: 10,),
          horasWidget(activado: false, texto: "309",hora: "13:00",materia: "Tópicos de programación", cameraDescription: widget.cameraDescription,),
          const SizedBox(height: 10,),
          horasWidget(activado: false, texto: "410",hora: "14:00",materia: "Ingeniería de Software", cameraDescription: widget.cameraDescription,),
        ],
      ),
      appBar:  AppBar(
        actions: [Image.asset("lib/assets/images/imagenuat.png"),const SizedBox(width:10 ,)],
        title: const Text(
          "FIANS",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.orange,
      ),
    );
  }
}