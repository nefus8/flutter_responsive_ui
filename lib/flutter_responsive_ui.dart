library flutter_responsive_ui;

import 'package:flutter/material.dart';

class ResponsiveSize {
  /// Here are the default values for the mobile size limit
  /// It means the limit amount of points where we stop considering it as a mobile, small tablet etc...
  static double _mobileSizeLimit = 450;
  static double _smallTabletSizeLimit = 850;
  static double _largeTabletSizeLimit = 1200;

  /// Here are the default values for the normal scale factor
  static double _mobileScaleFactor = 1.0;
  static double _smallTabletScaleFactor = 1.4;
  static double _largeTabletScaleFactor = 1.7;
  static double _desktopScaleFactor = 2;

  /// Here are the default values for the smaller scale factor
  static double _mobileSmallerScaleFactor = 1.0;
  static double _smallTabletSmallerScaleFactor = 1.15;
  static double _largeTabletSmallerScaleFactor = 1.4;
  static double _desktopSmallerScaleFactor = 1.65;

  static void initValues({
    /// All values can be set and they don't NEED to be set
    double mobileSizeLimit = 450,
    double smallTabletSizeLimit = 850,
    double largeTabletSizeLimit = 1200,
    double mobileScaleFactor = 1.0,
    double smallTabletScaleFactor = 1.4,
    double largeTabletScaleFactor = 1.7,
    double desktopScaleFactor = 2,
    double mobileSmallerScaleFactor = 1.0,
    double smallTabletSmallerScaleFactor = 1.15,
    double largeTabletSmallerScaleFactor = 1.4,
    double desktopSmallerScaleFactor = 1.65,
  }) {

    /// The initValues function is used to set the default values when the app stars
    _mobileSizeLimit = mobileSizeLimit;
    _smallTabletSizeLimit = smallTabletSizeLimit;
    _largeTabletSizeLimit = largeTabletSizeLimit;

    _mobileScaleFactor = mobileScaleFactor;
    _smallTabletScaleFactor = smallTabletScaleFactor;
    _largeTabletScaleFactor = largeTabletScaleFactor;
    _desktopScaleFactor = desktopScaleFactor;

    _mobileSmallerScaleFactor = mobileSmallerScaleFactor;
    _smallTabletSmallerScaleFactor = smallTabletSmallerScaleFactor;
    _largeTabletSmallerScaleFactor = largeTabletSmallerScaleFactor;
    _desktopSmallerScaleFactor = desktopSmallerScaleFactor;
  }

  /// The function that return whether or not it's a mobile
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.shortestSide < _mobileSizeLimit;
  }

  /// The function that return whether or not it's a tablet (small and large)
  static bool isTablet(BuildContext context) {
    double shortestSide = MediaQuery.of(context).size.shortestSide;
    return (shortestSide >= _mobileSizeLimit && shortestSide < _largeTabletSizeLimit);
  }

  /// The function that return whether or not it's a small tablet
  static bool isSmallTablet(BuildContext context) {
    double shortestSide = MediaQuery.of(context).size.shortestSide;
    return (shortestSide >= _mobileSizeLimit && shortestSide < _smallTabletSizeLimit);
  }

  /// The function that return whether or not it's a large tablet
  static bool isLargeTablet(BuildContext context) {
    double shortestSide = MediaQuery.of(context).size.shortestSide;
    return (shortestSide >= _smallTabletSizeLimit && shortestSide < _largeTabletSizeLimit);
  }

  /// The function that return whether or not it's a desktop
  static bool isDesktop(BuildContext context) {
    return (MediaQuery.of(context).size.shortestSide >= _largeTabletSizeLimit);
  }
  
  /// The function that return the responsive size
  static double getResponsiveSize(BuildContext context, double size) {
    double shortestSideSize = MediaQuery.of(context).size.shortestSide;
    if (shortestSideSize < _mobileSizeLimit) {
      return size*_mobileScaleFactor;
    } else if (shortestSideSize >= _mobileSizeLimit && shortestSideSize < _smallTabletSizeLimit) {
      return size*_smallTabletScaleFactor;
    } else if (shortestSideSize >= _smallTabletSizeLimit && shortestSideSize < _largeTabletSizeLimit) {
      return size*_largeTabletScaleFactor;
    } else {
      return size*_desktopScaleFactor;
    }
  }

  /// The function that return the smaller responsive size
  static double getSmallerResponsiveSize(BuildContext context, double size) {
    double shortestSideSize = MediaQuery.of(context).size.shortestSide;
    if (shortestSideSize < _mobileSizeLimit) {
      return size*_mobileSmallerScaleFactor;
    } else if (shortestSideSize >= _mobileSizeLimit && shortestSideSize < _smallTabletSizeLimit) {
      return size*_smallTabletSmallerScaleFactor;
    } else if (shortestSideSize >= _smallTabletSizeLimit && shortestSideSize < _largeTabletSizeLimit) {
      return size*_largeTabletSmallerScaleFactor;
    } else {
      return size*_desktopSmallerScaleFactor;
    }
  }

  /// The function that return the responsive grid item. You can choose the starting column count.
  static int responsiveGridColumnCount(BuildContext context, {int startColCount = 2}) {
    double shortestSideSize = MediaQuery.of(context).size.shortestSide;
    if (shortestSideSize < _mobileSizeLimit) {
      return startColCount;
    } else if (shortestSideSize >= _mobileSizeLimit && shortestSideSize < _smallTabletSizeLimit) {
      return startColCount+1;
    } else if (shortestSideSize >= _smallTabletSizeLimit && shortestSideSize < _largeTabletSizeLimit) {
      return startColCount+2;
    } else {
      return startColCount+3;
    }
  }
}
