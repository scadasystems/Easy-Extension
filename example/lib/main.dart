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
    super.initState();

    _copyMapTest();
  }

  void _copyMapTest() {
    Map<String, dynamic> map = {'key': 'Value'};
    var cloneMap = map.deepCopy();

    cloneMap['key'] = 'Value2';

    debugPrint('Map (${map.hashCode}): $map');
    debugPrint('CloneMap (${cloneMap.hashCode}): $cloneMap');
    debugPrint('Same?: ${map == cloneMap}');
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
