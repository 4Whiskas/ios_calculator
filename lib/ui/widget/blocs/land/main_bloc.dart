import 'package:flutter/cupertino.dart';
import 'package:ios_calculator/ui/widget/blocs/land/num_bloc.dart';
import 'package:ios_calculator/ui/widget/blocs/land/super_bloc.dart';
import 'package:ios_calculator/ui/widget/blocs/land/action_bloc.dart';

class MainBloc extends StatelessWidget {
  const MainBloc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (MediaQuery.of(context).size.height - 50) / 6 * 5,
      width: (MediaQuery.of(context).size.width - 50)/10*4,
      child: Row(
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
      ),
    );
  }
}
