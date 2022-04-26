import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ios_calculator/cubit/calculator/calculator_cubit.dart';
import 'package:ios_calculator/cubit/calculator/calculator_state.dart';
import 'package:ios_calculator/ui/button_type.dart';
import 'package:ios_calculator/ui/resources/app_button_styles.dart';
import 'package:ios_calculator/ui/resources/app_lists.dart';
import 'package:ios_calculator/ui/resources/app_text_styles.dart';
import 'package:ios_calculator/ui/widget/calculator_button.dart';

class SubActionsBloc extends StatelessWidget {
  const SubActionsBloc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _cubit = context.read<CalculatorCubit>();
    final List<List<Function>> subAction = [
      [_cubit.insertLeftBracket, _cubit.insertRightBracket, _cubit.memoryClean, _cubit.memoryPlus, _cubit.memoryMinus, _cubit.memoryR],
      [_cubit.goToAltMode, _cubit.xSquare, _cubit.xCube, _cubit.xInY, _cubit.eInX, _cubit.tenInX],
      [_cubit.oneOnX, _cubit.sqrtX, _cubit.sqrt3X, _cubit.sqrt3X, _cubit.sqrtYX, _cubit.ln, _cubit.log_10],
      [_cubit.factorial, _cubit.sin, _cubit.cos, _cubit.tan, _cubit.insertE, _cubit.insertEE],
      [_cubit.swapToRad, _cubit.sinH, _cubit.cosH, _cubit.tanH, _cubit.insertPi, _cubit.insertRand]
    ];
    final List<List<Function>> altSubAction = [
      [_cubit.insertLeftBracket, _cubit.insertRightBracket, _cubit.memoryClean, _cubit.memoryPlus, _cubit.memoryMinus, _cubit.memoryR],
      [_cubit.goToMainMode, _cubit.xSquare, _cubit.xCube, _cubit.xInY, _cubit.yInX, _cubit.twoInX],
      [_cubit.oneOnX, _cubit.sqrtX, _cubit.sqrt3X, _cubit.sqrt3X, _cubit.sqrtYX, _cubit.logY, _cubit.log_2],
      [_cubit.factorial, _cubit.aSin, _cubit.aCos, _cubit.aTan, _cubit.insertE, _cubit.insertEE],
      [_cubit.swapToRad, _cubit.aSinH, _cubit.aCosH, _cubit.aTanH, _cubit.insertPi, _cubit.insertRand]
    ];
    return BlocBuilder<CalculatorCubit, CalculatorState>(
        builder: (context, state) {
      var heightPart = (MediaQuery.of(context).size.height - 50) / 6;
      var widthPart = (MediaQuery.of(context).size.width - 50) / 10;
      if (state is CalculatorLoadedState) {
        return SizedBox(
          width: widthPart * 6,
          height: heightPart * 5,
          child: Column(
            children: List<Row>.generate(
                AppLists.subActionButtons.length,
                (i) => Row(
                      children: List.generate(
                          AppLists.subActionButtons[i].length,
                          (j) => SizedBox(
                                width: widthPart,
                                height: heightPart,
                                child: CalculatorButton(
                                    type: OvalButton(),
                                    buttonStyle:
                                        AppButtonStyles.subActionButton,
                                    action: subAction[i][j],
                                    title: AppLists.subActionButtons[i][j],
                                    textStyle: AppTextStyles.landWhiteText,
                                    parameter: null),
                              )),
                    )),
          ),
        );
      }
      if (state is CalculatorAlternateState) {
        return SizedBox(
          width: widthPart * 6,
          height: heightPart * 5,
          child: Column(
            children: List<Row>.generate(
                AppLists.altSubActionButtons.length,
                (i) => Row(
                      children: List.generate(
                          AppLists.altSubActionButtons[i].length,
                          (j) => SizedBox(
                                width: widthPart,
                                height: heightPart,
                                child: CalculatorButton(
                                    type: OvalButton(),
                                    buttonStyle: i == 1 && j == 0
                                        ? AppButtonStyles.subActionButton
                                            .copyWith(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        Colors.white))
                                        : AppButtonStyles.subActionButton,
                                    action: altSubAction[i][j],
                                    title: AppLists.altSubActionButtons[i][j],
                                    textStyle: i == 1 && j == 0
                                        ?AppTextStyles.landBlackText:AppTextStyles.landWhiteText,
                                    parameter: null),
                              )),
                    )),
          ),
        );
      }
      return const SizedBox.shrink();
    });
  }
}
