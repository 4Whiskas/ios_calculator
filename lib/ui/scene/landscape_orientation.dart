import 'package:flutter/material.dart';
import 'package:ios_calculator/ui/resources/app_colors.dart';
import 'package:ios_calculator/ui/widget/blocs/land/sub_action_bloc.dart';
import 'package:ios_calculator/ui/widget/blocs/land/text_result.dart';
import '../widget/blocs/land/main_bloc.dart';

class LandscapeCalculator extends StatelessWidget {
  const LandscapeCalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackText,
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                    height: (MediaQuery.of(context).size.height - 60) / 6,
                    width: (MediaQuery.of(context).size.width - 40),
                    child:const Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: TextResult(),
                    )),
                SizedBox(
                  height: (MediaQuery.of(context).size.height - 40) / 6 * 5,
                  width: (MediaQuery.of(context).size.width - 40),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      SubActionsBloc(),
                      MainBloc(),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
