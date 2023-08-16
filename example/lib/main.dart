import 'package:easy_extension/easy_extension.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    var map = {
      'Key': 'Value',
    };

    var cloneMap = map.deepCopy();

    cloneMap['Key'] = 'Value2';

    debugPrint('Map (${map.hashCode}): $map');
    debugPrint('Clone Map (${cloneMap.hashCode}): $cloneMap');
    debugPrint('Same ?: ${map == cloneMap}');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Easy Extension'),
              Text('Created by Lulz_M'),
            ],
          ),
        ),
      ),
    );
  }
}
