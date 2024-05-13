import 'package:asistencia_maestros/pages/home.dart';
import 'package:asistencia_maestros/widgets/listContainers.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class EstudiantesLista extends StatefulWidget {
  final CameraDescription cameraDescription;
  const EstudiantesLista({super.key, required this.cameraDescription});

  @override
  State<EstudiantesLista> createState() => _EstudiantesListaState();
}

class _EstudiantesListaState extends State<EstudiantesLista> {
   int currentIndex = 0;

  @override
  void initState() {
     currentIndex = 0;
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
   
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    List<String> listaDias = ['Lunes','Martes','Miercoles','Jueves','Viernes'];
    
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
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
      drawer: CustomDrawer(cameraDescription: widget.cameraDescription, scaffoldKey: _scaffoldKey),
      backgroundColor: Colors.white,
      body: ListView(padding: EdgeInsets.all(1.0),children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(onPressed: (){
              setState(() {
                print(currentIndex);
               currentIndex = currentIndex == 0 ? listaDias.length - 1 : currentIndex - 1;
                print(currentIndex);
                
              });
            }, icon: Icon(Icons.arrow_back,color: Colors.black,)),
            Text(listaDias[currentIndex],style: TextStyle(fontSize: 24),),
            IconButton(onPressed: (){
              setState(() {
                print(currentIndex);
                 currentIndex = (currentIndex + 1) % listaDias.length;
                print(currentIndex);
                
              });
            }, icon: Icon(Icons.arrow_forward,color: Colors.black,))
          ],
        ),
        listContainer(nombre: "Juan Paniagua",initialpaseLista: false,),
        listContainer(nombre: "Bruno Diaz", initialpaseLista: false),
        listContainer(nombre: "Tony Stark", initialpaseLista: false),
        listContainer(nombre: "Isaac Bleyt", initialpaseLista: false),
        listContainer(nombre: "Cesar Marin", initialpaseLista: false),
        listContainer(nombre: "Jorge Aquino", initialpaseLista: false),
        listContainer(nombre: "Fernando Saenz Rico", initialpaseLista: false),
        listContainer(nombre: "Emmanuel Mendez", initialpaseLista: false),
        listContainer(nombre: "Bruno Diaz", initialpaseLista: false),
        listContainer(nombre: "Barry Allen", initialpaseLista: false),
        listContainer(nombre: "Hal Jordan", initialpaseLista: false),
      ],) ,
    );
  }
}