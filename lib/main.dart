import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Widgets Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AnimatedContainerExample(),
    );
  }
}

class AnimatedContainerExample extends StatefulWidget {
  const AnimatedContainerExample({Key? key}) : super(key: key);

  @override
  State<AnimatedContainerExample> createState() =>
      _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  // set the initial size of the container
  double height = 200;
  double width = 200;

  Color color = Colors.blue;
  var radius = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 500,
            width: 500,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: Center(
                child: AnimatedContainer(
                  decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(radius)),
                  // give the animation duration
                  duration: const Duration(milliseconds: 300),
                  // assign the height and width to the container
                  height: height,
                  width: width,
                  child: Center(
                    child: Text(
                      'Animate Me',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    // change the size of the container
                    height = 300;
                    width = 300;
                  });
                },
                child: const Text('Animate Size'),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    // change the size of the container
                    color = color == Colors.blue ? Colors.red : Colors.blue;
                  });
                },
                child: const Text('Animate Color'),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    // change the size of the container
                    radius = radius == 0 ? 50 : 0;
                  });
                },
                child: const Text('Animate Border radius'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
