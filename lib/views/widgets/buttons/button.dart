import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

import '../../../common/extensions/extensions.dart';
import '../../../common/constants/constants.dart';

class Button extends StatelessWidget {
  final double size;
  final String? asset;
  final String? image;
  final IconData? icon;
  final VoidCallback onPressed;

  static const double factor = .5;

  const Button._({
    required this.size,
    required this.onPressed,
    this.asset,
    this.image,
    this.icon,
  });

  factory Button.small({
    required VoidCallback onPressed,
    IconData? icon,
    String? image,
    String? asset,
  }) {
    return Button._(
      size: 82.h,
      icon: icon,
      image: image,
      asset: asset,
      onPressed: onPressed,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        height: size,
        width: size,
        child: Stack(
          children: [
            SvgPicture.asset(
              Assets.backgroundButton,
              height: size,
            ),
            _content(),
          ],
        ),
      ),
    );
  }

  Widget _content() {
    if (icon != null) {
      return Center(
        child: Icon(
          icon,
          size: size * factor,
        ),
      );
    }
    if (asset != null) {
      return Center(
        child: SvgPicture.asset(
          asset!,
          height: size * factor,
        ),
      );
    }
    if (image != null) {
      return Center(
        child: Image.asset(
          image!,
          height: size * factor,
        ),
      );
    }

    return const SizedBox.shrink();
  }
}
