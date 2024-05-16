import 'package:asistencia_maestros/pages/home.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class horasWidget extends StatefulWidget {
  final CameraDescription cameraDescription;
  final String hora;
  final String materia;
  final bool activado;
  final String texto;
  const horasWidget({super.key, required this.activado, required this.texto, required this.hora, required this.materia, required this.cameraDescription});

  @override
  State<horasWidget> createState() => _horasWidgetState();
}

class _horasWidgetState extends State<horasWidget> {
  
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(cameraDescription: widget.cameraDescription),));
      },
      child: AnimatedContainer(
        height: height*0.15,
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
            color: widget.activado ? Colors.lightBlue : Colors.white,
            border: Border.all(width: 2,color: widget.activado ? Colors.black : Colors.black ),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            
            Text(
              widget.texto,
              style: TextStyle(
                  fontSize: 24,
                  color: widget.activado ? Colors.white : Colors.grey),
            ),
            Text(widget.hora,style: TextStyle(fontSize: 20,color: widget.activado ? Colors.white : Colors.grey),),
            Text(widget.materia,style: TextStyle(fontSize: 20,color: widget.activado ? Colors.white : Colors.grey),)
          ],
        ),
      ),
    );
  }
}
