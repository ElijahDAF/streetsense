import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'dart:io'; // Import for File class

void main() async {
  // Ensure that plugin services are initialized before running the app.
  WidgetsFlutterBinding.ensureInitialized();

  // Get the list of available cameras.
  final cameras = await availableCameras();

  // Use the first camera in the list (usually the rear camera).
  final firstCamera = cameras.first;

  runApp(MyApp(camera: firstCamera));
}

class MyApp extends StatelessWidget {
  final CameraDescription camera;

  const MyApp({super.key, required this.camera});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Recognition Using AI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MyHomePage(title: 'Image Recognition Using AI', camera: camera),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  final CameraDescription camera;

  const MyHomePage({super.key, required this.title, required this.camera});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late CameraController _cameraController;
  late Future<void> _initializeControllerFuture;
  bool _isRecognizing = false; // Track if recognition is running

  @override
  void initState() {
    super.initState();

    // Initialize the camera controller.
    _cameraController = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );

    // Initialize the controller asynchronously.
    _initializeControllerFuture = _cameraController.initialize();
  }

  @override
  void dispose() {
    // Dispose of the camera controller when the widget is disposed.
    _cameraController.dispose();
    super.dispose();
  }

  // Start image recognition
  void _startRecognition() {
    setState(() {
      _isRecognizing = true;
    });

    // TODO: Add your image recognition logic here.
    // For example, continuously analyze the camera feed.
    print("Image recognition started!");
  }

  // Stop image recognition
  void _stopRecognition() {
    setState(() {
      _isRecognizing = false;
    });

    // TODO: Stop the image recognition process.
    print("Image recognition stopped!");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the camera preview.
            return Stack(
              children: [
                CameraPreview(_cameraController),
                if (_isRecognizing)
                  Center(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      color: Colors.black54,
                      child: const Text(
                        "Recognizing your surroundings",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
              ],
            );
          } else {
            // Otherwise, display a loading indicator.
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 16), // Add padding at the bottom
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // Center the buttons horizontally
          children: [
            SizedBox(
              width: 80, // Set button width
              height: 80, // Set button height
              child: FloatingActionButton(
                onPressed: _isRecognizing ? null : _startRecognition,
                tooltip: 'Start Recognition',
                child: const Icon(Icons.play_arrow, size: 40), // Increase icon size
              ),
            ),
            const SizedBox(width: 25), // Add spacing between buttons
            SizedBox(
              width: 80, // Set button width
              height: 80, // Set button height
              child: FloatingActionButton(
                onPressed: _isRecognizing ? _stopRecognition : null,
                tooltip: 'Stop Recognition',
                child: const Icon(Icons.stop, size: 40), // Increase icon size
              ),
            ),
          ],
        ),
      ),
    );
  }
}