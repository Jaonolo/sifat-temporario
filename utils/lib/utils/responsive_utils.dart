import 'dart:ui';

import 'package:flutter/cupertino.dart';

class ResponsiveUtils {
  static double responsiveSize({
    required Size appSize,
    required double baseValue,
    double? minValue,
    double? maxValue,
  }) {
    var mediaWidth = (1 / 480) * appSize.width;
    var mediaHeight = (1 / 853.3) * appSize.height;

    var mediaFinal = (mediaWidth + mediaHeight) / 2;

    var finalValue = baseValue * mediaFinal;

    if (maxValue != null && finalValue > maxValue) return maxValue;

    if (minValue != null && finalValue < minValue) return minValue;

    return finalValue;
  }
}
