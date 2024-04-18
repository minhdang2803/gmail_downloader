// /Users/minhdang2803/Documents/learning/attatchments_downloader/assets/png/login_bc.png
class ImageResource {
  static String pngPath = "assets/png/";
  static String svgPath = "assets/svg/";
  static String getSVG(String name) {
    return "$svgPath$name.svg";
  }

  static String getPNG(String name) => "$pngPath$name.png";
  static String iconEmail = getSVG("gmail");

  ///
  static String backgroundPicture = getPNG("login_bc");
}
