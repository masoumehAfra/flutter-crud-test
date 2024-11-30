class CrudTestSpace{
  CrudTestSpace._();

  static const ScreenDimensions screen = ScreenDimensions._();


  static const double margin32 = 32;
  static const double margin16 = 16;
  static const double margin18 = 18;
  static const double margin14 = 14;

}
class ScreenDimensions {
  const ScreenDimensions._();
  double get downMargin => 60;
  double get sHeaderBody => 24;
  double get upMargin => 72;
}