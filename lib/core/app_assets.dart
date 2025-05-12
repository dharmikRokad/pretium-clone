abstract class AppAssets {
  String get _path => "assets";
}

class ImageAssets extends AppAssets {
  ImageAssets._();

  static final ImageAssets _instance = ImageAssets._();

  static ImageAssets get i => _instance; 

  @override
  String get _path => "${super._path}/images";

  String get logo => "$_path/logo.png";
}


class IconAsset extends AppAssets {
  IconAsset._();

  static final IconAsset _instance = IconAsset._();

  static IconAsset get i => _instance; 

  @override
  String get _path => "${super._path}/icons";
}