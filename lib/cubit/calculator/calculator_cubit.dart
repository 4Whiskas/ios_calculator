import 'dart:math' as math;

import 'package:bloc/bloc.dart';
import 'package:dart_numerics/dart_numerics.dart';
import 'package:function_tree/function_tree.dart';
import 'calculator_state.dart';

class CalculatorCubit extends Cubit<CalculatorState> {
  CalculatorCubit() : super(CalculatorLoadedState());

  String completeExpression = '';

  String currentExpression = '0';

  String selectedAction = '';

  CalculatorState currentState = CalculatorLoadedState();

  Future<void> insertNum(String value) async {
    emit(CalculatorLoadingState());
    if (value == '.' && currentExpression.contains('.')) {
      emit(currentState);
      return;
    }
    if (value == '.' && currentExpression == '0') {
      currentExpression += value;
      emit(currentState);
      return;
    }
    if (currentExpression == '0') {
      currentExpression = value;
    } else if (completeExpression.isEmpty && selectedAction.isNotEmpty) {
      completeExpression += '$currentExpression $selectedAction';
      currentExpression = '';
      clearSelectedAction();
      currentExpression += value;
    } else {
      currentExpression += value;
    }
    emit(currentState);
  }

  Future<void> paste(String paste) async{
    emit(CalculatorLoadingState());
    currentExpression = paste;
    emit(currentState);
  }

  Future<void> clearCurrentExpression() async {
    emit(CalculatorLoadingState());
    currentExpression = '0';
    emit(currentState);
  }

  Future<void> clearLastCurrentExpression() async {
    emit(CalculatorLoadingState());
    if (currentExpression.length == 1) {
      clearCurrentExpression();
    } else {
      currentExpression =
          currentExpression.substring(0, currentExpression.length - 1);
    }
    emit(currentState);
  }

  Future<void> clearCompleteExpression() async {
    emit(CalculatorLoadingState());
    completeExpression = '';
    clearSelectedAction();
    emit(currentState);
  }

  Future<void> clearSelectedAction() async {
    emit(CalculatorLoadingState());
    selectedAction = '';
    emit(currentState);
  }

  Future<void> invertCurrentExpression() async {
    emit(CalculatorLoadingState());
    if (currentExpression[0] != '-') {
      currentExpression = '-$currentExpression';
    } else {
      currentExpression = currentExpression.replaceAll('-', '');
    }
    emit(currentState);
  }

  Future<void> getPercent() async {
    emit(CalculatorLoadingState());
    if (completeExpression.isEmpty) {
      double val = double.parse(currentExpression);
      double res = val / 100;
      currentExpression = '$res';
    } else {
      currentExpression =
          '${completeExpression.replaceFirst('-', '')} / ${100} * $currentExpression'
              .interpret()
              .toString();
    }
    emit(currentState);
  }

  Future<void> insertAction(String value) async {
    emit(CalculatorLoadingState());
    selectedAction = value;
    emit(currentState);
  }

  Future<void> executeCompleteExpression() async {
    emit(CalculatorLoadingState());
    if (completeExpression[completeExpression.length - 1] ==
        currentExpression[0]) {
      currentExpression =
          currentExpression.replaceFirst(currentExpression[0], '');
    }
    completeExpression += currentExpression;
    //var value = completeExpression.interpret();
    //currentExpression = completeExpression;
    currentExpression = completeExpression.interpret().toString();
    if (currentExpression.length > 9) {
      currentExpression = currentExpression.substring(0, 8);
    }
    clearSelectedAction();
    clearCompleteExpression();
    emit(currentState);
  }

  //SUB FUNCTIONS
  Future<void> goToAltMode() async {
    currentState = CalculatorAlternateState();
    emit(currentState);
  }

  Future<void> goToMainMode() async {
    currentState = CalculatorLoadedState();
    emit(currentState);
  }

  Future<void> insertLeftBracket() async {
    emit(CalculatorLoadingState());
    emit(currentState);
  }

  Future<void> insertRightBracket() async {
    emit(CalculatorLoadingState());
    emit(currentState);
  }

  Future<void> memoryClean() async {
    emit(CalculatorLoadingState());
    emit(currentState);
  }

  Future<void> memoryPlus() async {
    emit(CalculatorLoadingState());
    emit(currentState);
  }

  Future<void> memoryMinus() async {
    emit(CalculatorLoadingState());
    emit(currentState);
  }

  Future<void> memoryR() async {
    emit(CalculatorLoadingState());
    emit(currentState);
  }

  Future<void> xSquare() async {
    emit(CalculatorLoadingState());
    currentExpression = '$currentExpression^2'.interpret().toString();
    emit(currentState);
  }

  Future<void> xCube() async {
    emit(CalculatorLoadingState());
    currentExpression = '$currentExpression^3'.interpret().toString();
    emit(currentState);
  }

  Future<void> xInY() async {
    emit(CalculatorLoadingState());
    emit(currentState);
  }

  Future<void> yInX() async {
    emit(CalculatorLoadingState());
    emit(currentState);
  }

  Future<void> eInX() async {
    emit(CalculatorLoadingState());
    currentExpression = '${math.e}^$currentExpression'.interpret().toString();
    emit(currentState);
  }

  Future<void> twoInX() async {
    emit(CalculatorLoadingState());
    currentExpression = '2^$currentExpression'.interpret().toString();
    emit(currentState);
  }

  Future<void> tenInX() async {
    emit(CalculatorLoadingState());
    currentExpression = '10^$currentExpression'.interpret().toString();
    emit(currentState);
  }

  Future<void> oneOnX() async {
    emit(CalculatorLoadingState());
    currentExpression = '1/$currentExpression'.interpret().toString();
    emit(currentState);
  }

  Future<void> sqrtX() async {
    emit(CalculatorLoadingState());
    currentExpression = math.pow(double.parse(currentExpression), 1/2).toString();
    emit(currentState);
  }

  Future<void> sqrt3X() async {
    emit(CalculatorLoadingState());
    currentExpression = math.pow(double.parse(currentExpression), 1/3).toString();
    emit(currentState);
  }

  Future<void> sqrtYX() async {
    emit(CalculatorLoadingState());
    emit(currentState);
  }

  Future<void> ln() async {
    emit(CalculatorLoadingState());
    currentExpression = math.log(double.parse(currentExpression)).toString();
    emit(currentState);
  }

  Future<void> logY() async {
    emit(CalculatorLoadingState());
    emit(currentState);
  }

  Future<void> log_10() async {
    emit(CalculatorLoadingState());
    currentExpression = log10(double.parse(currentExpression)).toString();
    emit(currentState);
  }

  Future<void> log_2() async {
    emit(CalculatorLoadingState());
    currentExpression = log2(int.parse(currentExpression)).toString();
    emit(currentState);
  }

  Future<void> factorial() async {
    emit(CalculatorLoadingState());
    currentExpression = factorialD(int.parse(currentExpression)).toString();
    emit(currentState);
  }

  Future<void> sin() async {
    emit(CalculatorLoadingState());
    currentExpression = math.sin(double.parse(currentExpression)).toString();
    emit(currentState);
  }

  Future<void> cos() async {
    emit(CalculatorLoadingState());
    currentExpression = math.cos(double.parse(currentExpression)).toString();
    emit(currentState);
  }

  Future<void> tan() async {
    emit(CalculatorLoadingState());
    currentExpression = math.tan(double.parse(currentExpression)).toString();
    emit(currentState);
  }

  Future<void> aSin() async {
    emit(CalculatorLoadingState());
    currentExpression = math.asin(double.parse(currentExpression)).toString();
    emit(currentState);
  }

  Future<void> aCos() async {
    emit(CalculatorLoadingState());
    currentExpression = math.acos(double.parse(currentExpression)).toString();
    emit(currentState);
  }

  Future<void> aTan() async {
    emit(CalculatorLoadingState());
    currentExpression = math.atan(double.parse(currentExpression)).toString();
    emit(currentState);
  }

  Future<void> insertE() async {
    emit(CalculatorLoadingState());
    currentExpression = math.e.toString();
    emit(currentState);
  }

  Future<void> insertEE() async {
    emit(CalculatorLoadingState());
    emit(currentState);
  }

  Future<void> swapToRad() async {
    emit(CalculatorLoadingState());
    emit(currentState);
  }

  Future<void> swapToDeg() async{
    emit(CalculatorLoadingState());
    emit(currentState);
  }

  Future<void> sinH() async {
    emit(CalculatorLoadingState());
    emit(currentState);
  }

  Future<void> cosH() async {
    emit(CalculatorLoadingState());
    emit(currentState);
  }

  Future<void> tanH() async {
    emit(CalculatorLoadingState());
    emit(currentState);
  }

  Future<void> aSinH() async {
    emit(CalculatorLoadingState());
    emit(currentState);
  }

  Future<void> aCosH() async {
    emit(CalculatorLoadingState());
    emit(currentState);
  }

  Future<void> aTanH() async {
    emit(CalculatorLoadingState());
    emit(currentState);
  }

  Future<void> insertPi() async {
    emit(CalculatorLoadingState());
    currentExpression = math.pi.toString();
    emit(currentState);
  }

  Future<void> insertRand() async {
    emit(CalculatorLoadingState());
    var rnd = math.Random();
    currentExpression = rnd.nextDouble().toString();
    emit(currentState);
  }
}
