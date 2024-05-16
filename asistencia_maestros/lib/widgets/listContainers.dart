import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class listContainer extends StatefulWidget {
  const listContainer({super.key, required this.nombre, required this.initialpaseLista});
  final String nombre;
  final bool initialpaseLista;

  @override
  State<listContainer> createState() => _listContainerState();
}

class _listContainerState extends State<listContainer> {
  late bool paseLista;
  @override
  void initState() {
    paseLista = widget.initialpaseLista;
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
   double width = MediaQuery.of(context).size.width;
   double height = MediaQuery.of(context).size.height;
    return Container(
      width: width *0.9 ,
      height: height*0.075,
      decoration: BoxDecoration(
        border: Border.all(width: 2.5,color: Colors.black),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: height*0.1,
            width: width*0.755,child: Row(children: [Text(widget.nombre,style: TextStyle(fontSize: 16,),)])),
           Container(
            height: height*0.1,
            color: Colors.black,
            width: 5,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                paseLista =  !paseLista;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              decoration: BoxDecoration(
                color: paseLista ? Colors.blue : Colors.white,
                border: Border.all(color: Colors.transparent,width: 0)
              ),
              width: width*0.22,
              height: height*0.1,
              child: Icon(Icons.check,color: paseLista ? Colors.black : Colors.transparent,),

            ),
          )
        ],
      ),
    );
  }
}
