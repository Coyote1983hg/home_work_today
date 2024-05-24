import 'package:flutter/material.dart';


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    debugPrint('initState() called');
  }

  @override
  void dispose() {
    super.dispose();
   debugPrint('dispose() called');
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('build() called');
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Counter App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$_counter',
                style: TextStyle(fontSize: 48),
              ),
              SizedBox(height: 16),
              OutlinedButton(
                onPressed: () {
                  setState(() {
                    _counter += 2;
                  });
                },
                child: Text('Increment by 2'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
