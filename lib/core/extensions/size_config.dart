import 'package:flutter/material.dart';
// import 'package:sahibi/core/helper/language_cache_helper.dart';

extension SizeConfig on dynamic {
  static late BuildContext context;
  static late double originalWidth;
  static late double originalHeight;
  static late double width;
  static late double height;
  static late double scale;
  static late double textScaleFactor;
  static late double ratioSizeHorizontal;
  static late double ratioSizeVertical;

  void init(
      {required double originalW,
      required double originalH,
      required BuildContext newContext}) {
    context = newContext;
    originalWidth = originalW;
    originalHeight = originalH;
    width = MediaQuery.of(newContext).size.width > 600
        ? 600.0
        : MediaQuery.of(newContext).size.width;
    height = MediaQuery.of(newContext).size.height;
    scale = originalWidth / width;
    textScaleFactor = width / originalWidth;
    ratioSizeHorizontal = width / originalWidth;
    ratioSizeVertical = height / originalHeight;
  }

  double get w {
    return double.parse((ratioSizeHorizontal * this).toString());
  }

  double get h {
    return double.parse((ratioSizeVertical * this).toString());
  }

  double get sp {
    return
        // LanguageCacheHelper.lanCode == 'ar'?
        double.parse(toString());
    // : double.parse(toString()) * 0.9;
  }

  bool get isTablet {
    return MediaQuery.of(context).size.width > 500 &&
        MediaQuery.of(context).size.height > 500;
  }

  bool get isLandscape {
    return MediaQuery.of(context).orientation == Orientation.landscape;
  }
}
