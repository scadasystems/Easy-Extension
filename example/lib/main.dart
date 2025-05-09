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
    Map<String, dynamic> map = {
      'key1': 'Value',
      'key2': 'Value2',
      'key4': 'Value4',
      'key5': 'Value5',
      'key3': 'Value3',
    };
    var cloneMap = map.deepCopy();

    cloneMap['key'] = 'Value2';

    debugPrint('Map (${map.hashCode}): $map');
    debugPrint('CloneMap (${cloneMap.hashCode}): $cloneMap');
    debugPrint('Same?: ${map == cloneMap}');

    debugPrint(map.sortedByKey().toString());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Easy Extension\nCreated by Lulz_M'),
              Text('Time Ago: ${DateTime.now().add(-1.toMinute).toTimeAgo()}'),
            ],
          ),
        ),
      ),
    );
  }
}
