import 'package:flutter/material.dart';
import 'package:stream_deck/common/extensions/sizes.dart';

class AppSpacer extends StatelessWidget {
  final double height;
  final double width;

  const AppSpacer._({this.height = 0, this.width = 0});

  factory AppSpacer.smallH() {
    return const AppSpacer._(height: 8, width: 0);
  }

  factory AppSpacer.smallV() {
    return const AppSpacer._(height: 0, width: 8);
  }

  factory AppSpacer.mediumH() {
    return const AppSpacer._(height: 16, width: 0);
  }

  factory AppSpacer.mediumV() {
    return const AppSpacer._(height: 0, width: 16);
  }

  factory AppSpacer.largeH() {
    return const AppSpacer._(height: 32, width: 0);
  }

  factory AppSpacer.largeV() {
    return const AppSpacer._(height: 0, width: 32);
  }

  factory AppSpacer.extraLargeH() {
    return const AppSpacer._(height: 64, width: 0);
  }

  factory AppSpacer.extraLargeV() {
    return const AppSpacer._(height: 0, width: 64);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height.h, width: width.w);
  }
}
