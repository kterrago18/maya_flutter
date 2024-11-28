import 'package:flutter/material.dart';

class UIHelper {
  UIHelper._();

  static const double _verticalSpaceXSmall = 15;
  static const double _verticalSpaceSmall = 20;
  static const double _verticalSpaceMedium = 25;
  static const double _verticalSpaceLarge = 30;
  static const double _verticalSpaceXLarge = 40;

  static const double _horizontalSpaceXSmall = 15;
  static const double _horizontalSpaceSmall = 20;
  static const double _horizontalSpaceMedium = 25;
  static const double _horizontalSpaceLarge = 30;
  static const double _horizontalSpaceXLarge = 40;

  ///[paddingSpaceXSmall] 15
  static double paddingSpaceXSmall = 15;

  ///[paddingSpaceXSmall] 20
  static double paddingSpaceSmall = 20;

  ///[paddingSpaceXSmall] 25
  static double paddingSpaceMedium = 25;

  ///[paddingSpaceXSmall] 30
  static double paddingSpaceLarge = 30;

  ///[paddingSpaceXSmall] 40
  static double paddingSpaceXLarge = 40;

  ///[verticalSpaceXSmall] 15
  static Widget verticalSpaceXSmall() {
    return verticalSpace(_verticalSpaceXSmall);
  }

  ///[verticalSpaceSmall] 20
  static Widget verticalSpaceSmall() {
    return verticalSpace(_verticalSpaceSmall);
  }

  ///[verticalSpaceMedium] 25
  static Widget verticalSpaceMedium() {
    return verticalSpace(_verticalSpaceMedium);
  }

  ///[verticalSpaceLarge] 30
  static Widget verticalSpaceLarge() {
    return verticalSpace(_verticalSpaceLarge);
  }

  ///[verticalSpaceXLarge] 40
  static Widget verticalSpaceXLarge() {
    return verticalSpace(_verticalSpaceXLarge);
  }

  static Widget verticalSpace(double height) {
    return SizedBox(height: height);
  }

  ///[horizontalSpaceXSmall] 15
  static Widget horizontalSpaceXSmall() {
    return horizontalSpace(_horizontalSpaceXSmall);
  }

  ///[horizontalSpaceXSmall] 20
  static Widget horizontalSpaceSmall() {
    return horizontalSpace(_horizontalSpaceSmall);
  }

  ///[horizontalSpaceXSmall] 25
  static Widget horizontalSpaceMedium() {
    return horizontalSpace(_horizontalSpaceMedium);
  }

  ///[horizontalSpaceXSmall] 30
  static Widget horizontalSpaceLarge() {
    return horizontalSpace(_horizontalSpaceLarge);
  }

  ///[horizontalSpaceXSmall] 40
  static Widget horizontalSpaceXLarge() {
    return horizontalSpace(_horizontalSpaceXLarge);
  }

  static Widget horizontalSpace(double width) {
    return SizedBox(width: width);
  }
}
