import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../helpers/Colors.dart';
import '../helpers/Icons.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: splashBackColor,
      child: Center(
        child: SvgPicture.asset(
          Theme.of(context).colorScheme.splashLogo,
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
