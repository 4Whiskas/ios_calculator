abstract class ButtonType{
  double height = 0;
  double width = 0;
}

class RoundButton extends ButtonType{
  @override
  double height = 70;
  @override
  double width = 70;
}

class OvalButton extends ButtonType{
  @override
  double height = 45;
  @override
  double width = 59;
}

class BigOvalButton extends ButtonType{
  @override
  double height = 70;
  @override
  double width = 150;
}

class LongOvalButton extends ButtonType{
  @override
  double height = 45;
  @override
  double width = 125;
}