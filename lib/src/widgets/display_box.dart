// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class DisplayBox extends StatelessWidget {
  final Size fallbackSize;
  final Color lineColor;
  final Color backgroundColor;
  final Color textColor;
  final TextStyle? textStyle;
  final AlignmentGeometry alignment;
  final EdgeInsetsGeometry? margin;

  /// Shows the pixel size for the area it occupies.
  ///
  DisplayBox({
    super.key,
    this.fallbackSize = const Size(1, 150),
    this.lineColor = Colors.grey,
    this.backgroundColor = Colors.white,
    this.textColor = Colors.black,
    this.textStyle,
    this.alignment = Alignment.center,
    this.margin,
  });

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
            children: [
              Placeholder(
                fallbackWidth: fallbackSize.width,
                fallbackHeight: fallbackSize.height,
                color: lineColor,
                strokeWidth: 1,
              ),
              Positioned.fill(
                child: Align(
                  alignment: alignment,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: backgroundColor,
                    ),
                    margin: margin,
                    child: ValueListenableBuilder(
                      valueListenable: _size,
                      builder: (context, Size? size, child) => Text(
                        (size != null) //
                            ? '${size.width.toStringAsFixed(1)} x ${size.height.toStringAsFixed(1)}'
                            : '',
                        style: textStyle ?? TextStyle(color: textColor),
                      ),
                    ),
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
