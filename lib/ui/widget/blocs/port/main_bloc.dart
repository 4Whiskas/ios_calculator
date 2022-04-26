import 'package:flutter/cupertino.dart';
import 'package:ios_calculator/ui/widget/blocs/port/action_bloc.dart';
import 'package:ios_calculator/ui/widget/blocs/port/num_bloc.dart';
import 'package:ios_calculator/ui/widget/blocs/port/super_bloc.dart';

class MainBloc extends StatelessWidget {
  const MainBloc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if(orientation == Orientation.portrait)
          {
            return Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: const [SuperBloc(), NumBloc()],
                ),
                const ActionBloc(),
              ],
            );
          }
        else{
          return Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: const [SuperBloc(), NumBloc()],
              ),
              const ActionBloc(),
            ],
          );
        }
      }
    );
  }
}
