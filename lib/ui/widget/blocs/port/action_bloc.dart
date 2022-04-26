import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ios_calculator/cubit/calculator/calculator_cubit.dart';
import 'package:ios_calculator/cubit/calculator/calculator_state.dart';
import 'package:ios_calculator/ui/button_type.dart';
import 'package:ios_calculator/ui/resources/app_button_styles.dart';
import 'package:ios_calculator/ui/resources/app_lists.dart';
import 'package:ios_calculator/ui/resources/app_text_styles.dart';
import 'package:ios_calculator/ui/widget/calculator_button.dart';

class ActionBloc extends StatelessWidget {
  const ActionBloc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculatorCubit, CalculatorState>(
        builder: (context, state) {
      var _cubit = context.read<CalculatorCubit>();
      return Column(
        children: [
          Column(
            children: List.generate(
                AppLists.actionButtons.length - 1,
                    (index) => CalculatorButton(
                    type: RoundButton(),
                    buttonStyle:
                    _cubit.selectedAction == AppLists.actionButtons[index]
                        ? AppButtonStyles.selectedActionButton
                        : AppButtonStyles.actionButton,
                    action: _cubit.insertAction,
                    parameter: AppLists.actionButtons[index],
                    title: AppLists.actionButtons[index],
                    textStyle:
                    _cubit.selectedAction == AppLists.actionButtons[index]
                        ? AppTextStyles.orangeText
                        : AppTextStyles.whiteText)),
          ),
          CalculatorButton(
              type: RoundButton(),
              buttonStyle: AppButtonStyles.actionButton,
              action: _cubit.executeCompleteExpression,
              parameter: null,
              title: AppLists.actionButtons.last,
              textStyle: AppTextStyles.whiteText)
        ],
      );
    });
  }
}
