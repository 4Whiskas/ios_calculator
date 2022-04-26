
class Utils{
  static double adaptFontSize(String str)
  {
    switch(str.length){
      case 7:
        return 48;
      case 8:
        return 46;
      case 9:
        return 44;
      case 10:
        return 42;
      case 11:
        return 40;
      default:
        return 50;
    }
  }
}