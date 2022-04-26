import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ios_calculator/cubit/calculator/calculator_cubit.dart';
import 'package:ios_calculator/cubit/calculator/calculator_state.dart';
import 'package:ios_calculator/ui/resources/app_lists.dart';

import '../../../button_type.dart';
import '../../../resources/app_button_styles.dart';
import '../../../resources/app_text_styles.dart';
import '../../calculator_button.dart';

class SuperBloc extends StatelessWidget {
  const SuperBloc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _cubit = context.read<CalculatorCubit>();
    var heightPart = (MediaQuery.of(context).size.height - 50) / 6;
    var widthPart = (MediaQuery.of(context).size.width - 50)/10;
    return SizedBox(
      height: heightPart,
      width: widthPart * 3,
      child: Row(children: [
        BlocBuilder<CalculatorCubit, CalculatorState>(
            builder: (context, state) {
              return SizedBox(
                height: heightPart,
                width: widthPart,
                child: CalculatorButton(
                  type: OvalButton(),
                  buttonStyle: AppButtonStyles.superActionButton,
                  action: _cubit.currentExpression=='0'
                      ? _cubit.clearCompleteExpression
                      : _cubit.clearCurrentExpression,
                  title: _cubit.currentExpression=='0'
                      ? AppLists.superActionButtons[0]
                      : AppLists.superActionButtons[1],
                  textStyle: AppTextStyles.landBlackText,
                  parameter: null,
                ),
              );
            }),
        SizedBox(
          height: heightPart,
          width: widthPart,
          child: CalculatorButton(
            type: OvalButton(),
            buttonStyle: AppButtonStyles.superActionButton,
            action: _cubit.invertCurrentExpression,
            title: AppLists.superActionButtons[2],
            textStyle: AppTextStyles.landBlackText,
            parameter: null,
          ),
        ),
        SizedBox(
          height: heightPart,
          width: widthPart,
          child: CalculatorButton(
            type: OvalButton(),
            buttonStyle: AppButtonStyles.superActionButton,
            action: _cubit.getPercent,
            title: AppLists.superActionButtons[3],
            textStyle: AppTextStyles.landBlackText,
            parameter: null,
          ),
        ),
      ]),
    );
  }
}
