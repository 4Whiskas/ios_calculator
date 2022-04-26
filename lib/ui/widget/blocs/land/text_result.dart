import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ios_calculator/cubit/calculator/calculator_cubit.dart';
import 'package:ios_calculator/cubit/calculator/calculator_state.dart';
import 'package:ios_calculator/ui/resources/app_colors.dart';
import 'package:ios_calculator/ui/resources/app_text_styles.dart';
import 'package:ios_calculator/utils.dart';

class TextResult extends StatelessWidget {
  const TextResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculatorCubit, CalculatorState>(
        builder: (context, state) {
      var _cubit = context.read<CalculatorCubit>();
      return GestureDetector(
        onHorizontalDragEnd: (DragEndDetails details) {
          if (details.primaryVelocity! > 0) {
            // User swiped Left
            _cubit.clearLastCurrentExpression();
          } else if (details.primaryVelocity! < 0) {
            // User swiped Right
          }
        },
        onLongPress: () async {
          String? res = await showMenu<String>(
              context: context,
              color: AppColors.subActionButton,
              position: RelativeRect.fromLTRB(
                  MediaQuery.of(context).size.width / 100 * 80,
                  100.0,
                  15.0,
                  0.0),
              items: [
                PopupMenuItem(
                    value: _cubit.currentExpression,
                    child: Text(
                      'Скопировать',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.whiteText.copyWith(fontSize: 15),
                    )),
                PopupMenuItem(
                    value: 'input',
                    child: (await Clipboard.getData('text/plain'))
                            .toString()
                            .isNotEmpty
                        ? Text(
                            'Вставить',
                            textAlign: TextAlign.center,
                            style:
                                AppTextStyles.whiteText.copyWith(fontSize: 15),
                          )
                        : const SizedBox.shrink())
              ]);
          if (res == null) {
            return;
          }
          if (res == _cubit.currentExpression) {
            Clipboard.setData(ClipboardData(text: res));
          } else if (res == 'input') {
            Clipboard.getData('text/plain').then((value) => _cubit.paste(value!.text!));
          }
        },
        child: SizedBox(
          height: (MediaQuery.of(context).size.height - 50) / 6,
          width: (MediaQuery.of(context).size.width - 50),
          child: Text(
            _cubit.currentExpression,
            textAlign: TextAlign.end,
            style: AppTextStyles.whiteText.copyWith(fontSize: 40),
          ),
        ),
      );
    });
  }
}
