import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ios_calculator/cubit/calculator/calculator_cubit.dart';
import 'package:ios_calculator/cubit/calculator/calculator_state.dart';
import 'package:ios_calculator/ui/resources/app_colors.dart';
import 'package:ios_calculator/ui/widget/blocs/port/main_bloc.dart';
import 'package:ios_calculator/ui/widget/blocs/port/text_result.dart';

class PortraitCalculator extends StatelessWidget {
  const PortraitCalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackText,
      body: SafeArea(
          child: BlocBuilder<CalculatorCubit, CalculatorState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(right: 40),
                    child: Padding(
                      padding: EdgeInsets.only(right: 30),
                      child: TextResult(),
                    ),
                  ),
                  MainBloc(),
                ],
              );
            }
          )),
    );
  }
}
