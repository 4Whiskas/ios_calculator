import 'package:flutter/cupertino.dart';

import 'app_colors.dart';

class AppTextStyles {
  static const TextStyle whiteText = TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.w900,
      color: AppColors.whiteText,
      fontFamily: 'SF');
  static final TextStyle landWhiteText = whiteText.copyWith(
    fontSize: 18,
  );
  static const TextStyle orangeText = TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.w900,
      color: AppColors.mainActionButton,
      fontFamily: 'SF');
  static final TextStyle landOrangeText = orangeText.copyWith(
    fontSize: 18,
  );
  static const TextStyle blackText = TextStyle(
    fontSize: 25,
    color: AppColors.blackText,
    fontFamily: 'SF',
    fontWeight: FontWeight.w900,
  );
  static final TextStyle landBlackText = blackText.copyWith(
    fontSize: 18,
  );
}
