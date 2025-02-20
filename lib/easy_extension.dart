// ignore_for_file: unused_import, depend_on_referenced_packages

library easy_extension;

import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'dart:math' as math;
import 'dart:math';
import 'dart:ui' as ui show BoxHeightStyle, BoxWidthStyle;

import 'package:characters/characters.dart' as characters;
import 'package:collection/collection.dart' as collection;
import 'package:crypto/crypto.dart' as crypto;
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart' as intl;
import 'package:path/path.dart' as path_helper;
import 'package:pigment/pigment.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'src/utils/hsl_color.dart';
import 'src/utils/pair.dart';

export 'src/utils/handler.dart';
export 'src/utils/log.dart';
export 'src/widgets/dimension_box.dart';

part 'src/extensions/byte_converter.dart';
part 'src/extensions/checker.dart';
part 'src/extensions/color.dart';
part 'src/extensions/comparator.dart';
part 'src/extensions/date_time.dart';
part 'src/extensions/duration.dart';
part 'src/extensions/file.dart';
part 'src/extensions/global_key.dart';
part 'src/extensions/iterable.dart';
part 'src/extensions/list.dart';
part 'src/extensions/map.dart';
part 'src/extensions/num.dart';
part 'src/extensions/scroll_controller.dart';
part 'src/extensions/string.dart';
part 'src/extensions/string_buffer.dart';
part 'src/extensions/time_of_day.dart';
part 'src/extensions/uint8_list.dart';
part 'src/extensions/widget.dart';
part 'src/utils/easy_color.dart';
part 'src/utils/math_util.dart';
part 'src/utils/ntp/easy_ntp.dart';
part 'src/utils/ntp/easy_ntp_msg.dart';
part 'src/utils/range.dart';
part 'src/widgets/auto_size_text/auto_size_group.dart';
part 'src/widgets/auto_size_text/auto_size_group_builder.dart';
part 'src/widgets/auto_size_text/auto_size_text.dart';
part 'src/widgets/stateful_wrapper.dart';
