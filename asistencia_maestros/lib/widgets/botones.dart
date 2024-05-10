import 'package:asistencia_maestros/colors.dart';
import 'package:flutter/material.dart';

class botones extends StatefulWidget {
  final IconData? icono;
  final String texto;
  GestureTapCallback onPressed;
  botones(
      {super.key,
      required this.onPressed,
       this.icono,
      required this.texto});

  @override
  State<botones> createState() => _botonesState();
}

class _botonesState extends State<botones> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: widget.onPressed,
      child: AnimatedContainer(
        height: 40,
        width: 140,
        decoration: BoxDecoration(
          color: AppColors.verde,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            border: Border.all(
              color:AppColors.claro ,
              width: 2.5,
            )),
        duration: const Duration(milliseconds: 200),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.texto,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.claro
              ),
            )
          ],
        ),
      ),
    );
  }
}



class botonesMenu extends StatefulWidget {
  final IconData? icono;
  final String texto;
  GestureTapCallback onPressed;
  botonesMenu(
      {super.key,
      required this.onPressed,
       this.icono,
      required this.texto});

  @override
  _botonesMenuState createState() => _botonesMenuState();
}

class _botonesMenuState extends State<botonesMenu> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: widget.onPressed,
      child: AnimatedContainer(
        height: 40,
        width: 140,
        decoration: BoxDecoration(
          color: AppColors.verde,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            border: Border.all(
              color:AppColors.claro ,
              width: 2.5,
            )),
        duration: const Duration(milliseconds: 200),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.texto,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.claro
              ),
            )
          ],
        ),
      ),
    );
  }
}


