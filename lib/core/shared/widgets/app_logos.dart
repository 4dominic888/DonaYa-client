import 'package:dona_ya/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LogoWidget extends StatelessWidget {

  final double? size;
  final BoxFit fit;
  final EdgeInsetsGeometry padding;
  final String lightSvgPath;
  final String darkSvgPath;

  const LogoWidget({
    super.key,
    this.size,
    this.fit = BoxFit.contain,
    this.padding = EdgeInsets.zero,
    required this.lightSvgPath,
    required this.darkSvgPath,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: padding,
        child: SvgPicture.asset(
          Theme.of(context).brightness == Brightness.light ? lightSvgPath : darkSvgPath,
          height: size,
          width: size,
          fit: fit,
        ),
      )
    );
  }
}

class DonaYaLogo extends LogoWidget {
  const DonaYaLogo({super.key, super.size, super.fit, super.padding}) :
    super(lightSvgPath: DonaYaConstants.logoSvgLight, darkSvgPath: DonaYaConstants.logoSvgDark);
}

class DefaultUserLogo extends LogoWidget {
  const DefaultUserLogo({super.key, super.size, super.fit, super.padding}) :
    super(lightSvgPath: DonaYaConstants.defaultUserAvatarLight, darkSvgPath: DonaYaConstants.defaultUserAvatarDark);
}