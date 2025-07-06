import 'package:space_app/Core/utils/appimages.dart';
import 'package:space_app/Core/utils/approuter.dart';
import 'package:space_app/Core/utils/widgets/customicons.dart';

class CustomNavigationitems {
  static List<CustomIcon> items = [
    CustomIcon(
      image: AppImages.assetsImagesIconsHome,
      imageBold: AppImages.assetsImagesBoldIconsHome,
      approuter: Approuter.home,
    ),
    CustomIcon(
      image: AppImages.assetsImagesIconsNews,
      imageBold: AppImages.assetsImagesBoldIconsNews,
      approuter: Approuter.news,
    )
  ];
}
