import 'package:dona_ya/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DonaYaLogo extends StatelessWidget {
  final double? size;
  final BoxFit fit;
  final EdgeInsetsGeometry padding;

  const DonaYaLogo({
    super.key,
    this.size,
    this.fit = BoxFit.contain,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: padding,
        child: SvgPicture.asset(
          Theme.of(context).brightness == Brightness.light ? DonaYaConstants.logoSvgLight : DonaYaConstants.logoSvgDark,
          height: size,
          width: size,
          fit: fit,
        ),
      ),
    );
  }
}
