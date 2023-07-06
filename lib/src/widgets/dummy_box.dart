// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class DummyBox extends StatelessWidget {
  final Size fallbackSize;

  DummyBox({
    Key? key,
    this.fallbackSize = const Size(1, 150),
  }) : super(key: key);

  final ValueNotifier<Size> _size = ValueNotifier(const Size(0, 0));

  void _getSize(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final RenderBox rb = context.findRenderObject() as RenderBox;
      _size.value = rb.size;
    });
  }

  @override
  Widget build(BuildContext context) {
    _getSize(context);

    return NotificationListener<SizeChangedLayoutNotification>(
      onNotification: (notification) {
        _getSize(context);

        return true;
      },
      child: SizeChangedLayoutNotifier(
        child: SizedBox(
          width: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Placeholder(
                fallbackWidth: fallbackSize.width,
                fallbackHeight: fallbackSize.height,
                color: Colors.grey,
                strokeWidth: 1,
              ),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(8.0),
                child: ValueListenableBuilder(
                  valueListenable: _size,
                  builder: (context, Size? size, child) => Text(
                    (size != null) ? '${size.width.toStringAsFixed(1)} x ${size.height.toStringAsFixed(1)}' : '',
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
