import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    var heightPart = (MediaQuery.of(context).size.height - 50) / 6;
    var widthPart = (MediaQuery.of(context).size.width - 50)/10;
    return SizedBox(
      height: heightPart * 4,
      width: widthPart * 3,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
              children: List.generate(
                  AppLists.numBlocButtons.length,
                  (i) => Row(
                        children: List.generate(
                            AppLists.numBlocButtons[i].length, (j) {
                          return SizedBox(
                            height: heightPart,
                            width: widthPart,
                            child: CalculatorButton(
                                type: OvalButton(),
                                buttonStyle: AppButtonStyles.numButton,
                                action: _cubit.insertNum,
                                parameter: AppLists.numBlocButtons[i][j],
                                title: AppLists.numBlocButtons[i][j],
                                textStyle: AppTextStyles.landWhiteText),
                          );
                        }),
                      ))),
          SizedBox(
            height: heightPart,
            width: widthPart * 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: List.generate(
                  AppLists.lasButtonsRow.length,
                  (index) => SizedBox(
                    child: CalculatorButton(
                        type: AppLists.lasButtonsRow[index] == '0'
                            ? LongOvalButton()
                            : OvalButton(),
                        buttonStyle: AppButtonStyles.numButton,
                        action: _cubit.insertNum,
                        parameter: AppLists.lasButtonsRow[index],
                        title: AppLists.lasButtonsRow[index],
                        textStyle: AppTextStyles.landWhiteText),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
