import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ios_calculator/cubit/calculator/calculator_cubit.dart';
import 'package:ios_calculator/ui/button_type.dart';
import 'package:ios_calculator/ui/resources/app_button_styles.dart';
import 'package:ios_calculator/ui/resources/app_lists.dart';
import 'package:ios_calculator/ui/resources/app_text_styles.dart';
import 'package:ios_calculator/ui/widget/calculator_button.dart';

class NumBloc extends StatelessWidget {
  const NumBloc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _cubit = context.read<CalculatorCubit>();
    return SizedBox(
      height: 320,
      width: 240,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 240,
            width: 240,
            child: Column(
                children: List.generate(
                    AppLists.numBlocButtons.length,
                    (i) => Row(
                          children: List.generate(
                              AppLists.numBlocButtons[i].length, (j) {
                            return CalculatorButton(
                                type: RoundButton(),
                                buttonStyle: AppButtonStyles.numButton,
                                action: _cubit.insertNum,
                                parameter: AppLists.numBlocButtons[i][j],
                                title: AppLists.numBlocButtons[i][j],
                                textStyle: AppTextStyles.whiteText);
                          }),
                        ))),
          ),
          SizedBox(
            height: 80,
            width: 240,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: List.generate(
                  AppLists.lasButtonsRow.length,
                  (index) => CalculatorButton(
                      type: AppLists.lasButtonsRow[index] == '0'
                          ? BigOvalButton()
                          : RoundButton(),
                      buttonStyle: AppButtonStyles.numButton,
                      action: _cubit.insertNum,
                      parameter: AppLists.lasButtonsRow[index],
                      title: AppLists.lasButtonsRow[index],
                      textStyle: AppTextStyles.whiteText)),
            ),
          )
        ],
      ),
    );
  }
}
