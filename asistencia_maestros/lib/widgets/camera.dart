import 'dart:io';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class TakePictureScreen extends StatefulWidget {
  const TakePictureScreen({
    super.key,
    required this.camera,
  });

  final CameraDescription camera;

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          decoration: BoxDecoration(border: Border.all(color: Colors.orange,width: 5),borderRadius: BorderRadius.circular(10)),
          height: heightScreen*0.4,
          width: widthScreen*0.8,
          child: FutureBuilder<void>(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                // If the Future is complete, display the preview.
                return AspectRatio(aspectRatio: _controller.value.aspectRatio,child: CameraPreview(_controller));
              } else {
                // Otherwise, display a loading indicator.
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
        const SizedBox(height: 20,),
        TextButton.icon(
          style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.green),),
          label: const Text("Registrar entrada",style: TextStyle(fontSize: 20,color: Colors.white),),
         icon: const Icon(Icons.add_a_photo,color: Colors.white,) ,
      // Provide an onPressed callback.
      onPressed: () async {
        // Take the Picture in a try / catch block. If anything goes wrong,
        // catch the error.
        try {
          // Ensure that the camera is initialized.
          await _initializeControllerFuture;
    
          // Attempt to take a picture and get the file `image`
          // where it was saved.
          final image = await _controller.takePicture();
    
          if (!context.mounted) return;
    
          // If the picture was taken, display it on a new screen.
          // Displaying the material dialog
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Registro Exitoso'),
                    content: Text('Has sido registrado exitosamente'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('OK'),
                      ),
                    ],
                  ),
                );
        } catch (e) {
          // If an error occurs, log the error to the console.
          print(e);
        }
      },
      
    ),
      ],
    );
  }
}

// A widget that displays the picture taken by the user.
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Image.file(File(imagePath)),
    );
  }
}