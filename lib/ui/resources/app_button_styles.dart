import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppButtonStyles {
  static final ButtonStyle _abstractStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.pressed)) {
        return AppColors.lightSubActionButton;
      } else {
        return AppColors.subActionButton;
      }
    }),
    shadowColor: MaterialStateProperty.all(AppColors.subActionButton),
    overlayColor: MaterialStateProperty.resolveWith(
        (states) => AppColors.lightSubActionButton),
    shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(90))),
  );

  static final ButtonStyle subActionButton = _abstractStyle.copyWith(
    backgroundColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.pressed)) {
        return AppColors.lightSubActionButton;
      } else {
        return AppColors.subActionButton;
      }
    }),
    overlayColor: MaterialStateProperty.resolveWith(
        (states) => AppColors.lightSubActionButton),
  );

  static final ButtonStyle numButton = _abstractStyle.copyWith(
    backgroundColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.pressed)) {
        return AppColors.lightNumButton;
      } else {
        return AppColors.numButton;
      }
    }),
    overlayColor:
        MaterialStateProperty.resolveWith((states) => AppColors.lightNumButton),
  );

  static final ButtonStyle landNumButton = numButton.copyWith();

  static ButtonStyle bigOvalNum = numButton.copyWith();

  static final ButtonStyle actionButton = _abstractStyle.copyWith(
    backgroundColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.pressed)) {
        return AppColors.lightMainActionButton;
      } else {
        return AppColors.mainActionButton;
      }
    }),
    overlayColor: MaterialStateProperty.resolveWith(
        (states) => AppColors.lightMainActionButton),
  );

  static final ButtonStyle selectedActionButton = _abstractStyle.copyWith(
    backgroundColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.pressed)) {
        return AppColors.mainActionButton;
      } else {
        return AppColors.whiteText;
      }
    }),
    overlayColor: MaterialStateProperty.resolveWith(
        (states) => AppColors.lightMainActionButton),
  );

  static final ButtonStyle superActionButton = _abstractStyle.copyWith(
    backgroundColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.pressed)) {
        return AppColors.lightSuperActionButton;
      } else {
        return AppColors.superActionButton;
      }
    }),
    overlayColor: MaterialStateProperty.resolveWith(
        (states) => AppColors.lightSuperActionButton),
  );
}
