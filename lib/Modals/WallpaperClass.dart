
class WallPaper{
  String regular;
  String full;
  String blur;

  WallPaper({required this.blur,required this.regular,required this.full});

  dynamic get toMap{
    return {
      'blur' : blur,
      'full' : full,
      'regular' : regular
    };
  }
}