import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ios_calculator/ui/scene/landscape_orientation.dart';
import 'package:ios_calculator/ui/scene/portrait_calculator.dart';

import 'cubit/calculator/cubit.dart';

void main() {
  runApp(const Starter());
}

class Starter extends StatelessWidget {
  const Starter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CalculatorCubit>(create: (context) => CalculatorCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: OrientationBuilder(builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return const PortraitCalculator();
          } else {
            return const LandscapeCalculator();
          }
        }),
      ),
    );
  }
}
