import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ios_calculator/cubit/calculator/calculator_cubit.dart';
import 'package:ios_calculator/cubit/calculator/calculator_state.dart';
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
              _cubit.clearLastCurrentExpression();
            }
          },
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Text(
              _cubit.currentExpression,
              textAlign: TextAlign.end,
              style: AppTextStyles.whiteText.copyWith(fontSize: Utils.adaptFontSize(_cubit.currentExpression)),
            ),
          ),
        );
      }
    );
  }
}
