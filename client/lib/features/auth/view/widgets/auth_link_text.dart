import 'package:flutter/material.dart';

import '../../../../core/responsiveness/size_config.dart';
import '../../../../core/theme/app_palette.dart';
import '../../../../core/theme/sizes.dart';

class AuthLinkText extends StatelessWidget {
  const AuthLinkText({
    super.key,
    required this.s,
    required this.leadingText,
    required this.text,
    required this.onTap,
  });

  final SizeConfig s;
  final String leadingText;
  final String text;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: RichText(
        text: TextSpan(
          style: TextStyle(
            fontSize: s.sp(FontSize.SM),
          ),
          text: leadingText,
          children: [
            TextSpan(
              text: text,
              style: const TextStyle(
                color: AppPalette.gradient2,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}