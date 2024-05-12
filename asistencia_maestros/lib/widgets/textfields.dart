import 'package:flutter/material.dart';
import 'package:asistencia_maestros/colors.dart';
class textfieldsApp extends StatefulWidget {
  final Function function;
  final IconData icono;
  final TextInputType tipoKeyboard;
  final GlobalKey<FormState> formKey;
  final TextEditingController controller;
  final String texto;
  const textfieldsApp(
      {super.key,
      required this.function,
      required this.icono,
      required this.tipoKeyboard,
      required this.controller,
      required this.formKey,
      required this.texto});

  @override
  State<textfieldsApp> createState() => _textfieldsAppState();
}

class _textfieldsAppState extends State<textfieldsApp> {
   FocusNode focusNode = FocusNode();
  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var sizeScreen = MediaQuery.of(context).size;
    return AnimatedContainer(
      padding: const EdgeInsets.all(2.0),
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: focusNode.hasFocus ? 5 : 2.5,
              color: focusNode.hasFocus ? AppColors.azulOscuro : AppColors.claro)),
      duration: const Duration(milliseconds: 200),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        

        children: [
          SizedBox(width: 25,child: Icon(widget.icono,color: focusNode.hasFocus ? AppColors.azulOscuro : AppColors.claro,))
          ,SizedBox(
            width: sizeScreen.width*.6,
            child: TextFormField(
              cursorHeight: 30,
              style: TextStyle(color: AppColors.azulOscuro,fontSize: 20),
            cursorColor: AppColors.azulOscuro,
            keyboardType: widget.tipoKeyboard,
            focusNode: focusNode,
            onTapOutside: (event) {
              setState(() {
                focusNode.unfocus();
              });
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              label: Text(
                widget.texto,
                style: TextStyle(
                  fontSize: focusNode.hasFocus ? 10:20,
                    color: focusNode.hasFocus ? Colors.transparent : AppColors.claro),
              ),
            ),
            controller: widget.controller,
            key: widget.key,
            onEditingComplete: () => setState(() => focusNode.unfocus()),
            onTap: (){
              setState(() {
                focusNode.requestFocus();
              });
            },
            validator: (value) {
             widget.function;
            },
                    ),
          )
        ],
      ),
    );
  }
}
