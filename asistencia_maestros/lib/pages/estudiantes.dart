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
      drawer: CustomDrawer(cameraDescription: widget.cameraDescription, scaffoldKey: _scaffoldKey),
      backgroundColor: Colors.white,
      body: ListView(padding: const EdgeInsets.all(1.0),children: [
        Row(

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(onPressed: (){
              setState(() {
                print(currentIndex);
               currentIndex = currentIndex == 0 ? listaDias.length - 1 : currentIndex - 1;
                print(currentIndex);
                
              });
            }, icon: const Icon(Icons.arrow_back,color: Colors.blue,size: 35,)),
            Text(listaDias[currentIndex],style: const TextStyle(fontSize: 24),),
            IconButton(onPressed: (){
              setState(() {
                print(currentIndex);
                 currentIndex = (currentIndex + 1) % listaDias.length;
                print(currentIndex);
                
              });
            }, icon: const Icon(Icons.arrow_forward,color: Colors.blue,size: 35,))
          ],
        ),
        const listContainer(nombre: "Juan Paniagua",initialpaseLista: false,),
        const listContainer(nombre: "Bruno Diaz", initialpaseLista: false),
        const listContainer(nombre: "Tony Stark", initialpaseLista: false),
        const listContainer(nombre: "Isaac Bleyt", initialpaseLista: false),
        const listContainer(nombre: "Cesar Marin", initialpaseLista: false),
        const listContainer(nombre: "Pocoyo", initialpaseLista: false),
        const listContainer(nombre: "Cazquin Andres", initialpaseLista: false),
        const listContainer(nombre: "Thor", initialpaseLista: false),
        const listContainer(nombre: "Jorge Aquino", initialpaseLista: false),
        const listContainer(nombre: "Fernando Saenz Rico", initialpaseLista: false),
        const listContainer(nombre: "Emmanuel Mendez", initialpaseLista: false),
        const listContainer(nombre: "Bruno Diaz", initialpaseLista: false),
        const listContainer(nombre: "Barry Allen", initialpaseLista: false),
        const listContainer(nombre: "Hal Jordan", initialpaseLista: false),
      ],) ,
    );
  }
}