import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ESP32 Car Control App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Mode'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/car3.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LoadingButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          CameraControlPage(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        var begin = Offset(1.0, 0.0);
                        var end = Offset.zero;
                        var curve = Curves.easeInOut;
                        var tween = Tween(begin: begin, end: end)
                            .chain(CurveTween(curve: curve));
                        var offsetAnimation = animation.drive(tween);
                        return SlideTransition(
                          position: offsetAnimation,
                          child: child,
                        );
                      },
                    ),
                  );
                },
                text: 'Camera Control',
              ),
              SizedBox(width: 20),
              LoadingButton(
                onPressed: () {
                  // Simulate loading
                  Future.delayed(Duration(seconds: 2), () {
                    // Navigate to the second mode page
                  });
                },
                text: 'Mode 2',
              ),
              SizedBox(width: 20),
              LoadingButton(
                onPressed: () {
                  // Simulate loading
                  Future.delayed(Duration(seconds: 2), () {
                    // Navigate to the third mode page
                  });
                },
                text: 'Mode 3',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoadingButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String text;

  const LoadingButton({
    required this.onPressed,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  _LoadingButtonState createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.yellow,
        textStyle: TextStyle(color: Colors.black),
      ),
      onPressed: () async {
        setState(() {
          _isLoading = true;
        });
        widget.onPressed();
        setState(() {
          _isLoading = false;
        });
      },
      child: _isLoading
          ? CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
            )
          : Text(widget.text),
    );
  }
}

class CameraControlPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera Control Mode'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "assets/car2.jpg"), // Replace with your image asset path
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: Image.asset(
                  'assets/.jpg', // Replace with your image asset path
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 255, 182, 98),
                          textStyle: TextStyle(color: Colors.black),
                        ),
                        onPressed: () {
                          // Implement the control for the car (e.g., forward)
                        },
                        child: Icon(Icons.arrow_left),
                      ),
                    ],
                  ),
                  SizedBox(width: 20),
                  Column(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 255, 182, 98),
                          textStyle: TextStyle(color: Colors.black),
                        ),
                        onPressed: () {
                          // Implement the control for the car (e.g., left)
                        },
                        child: Icon(Icons.arrow_drop_up),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 255, 182, 98),
                          textStyle: TextStyle(color: Colors.black),
                        ),
                        onPressed: () {
                          // Implement the control for the car (e.g., right)
                        },
                        child: Icon(Icons.arrow_drop_down),
                      ),
                    ],
                  ),
                  SizedBox(width: 20),
                  Column(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 255, 182, 98),
                          textStyle: TextStyle(color: Colors.black),
                        ),
                        onPressed: () {
                          // Implement the control for the car (e.g., backward)
                        },
                        child: Icon(Icons.arrow_right),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
