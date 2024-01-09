import '../../../core/app_export.dart';

/// This class is used in the [userprofilegrid_item_widget] screen.
class UserprofilegridItemModel {
  UserprofilegridItemModel({
    this.userImage,
    this.userName,
    this.idolImage,
    this.idolText,
    this.yoasobiText,
    this.id,
  }) {
    userImage = userImage ?? ImageConstant.imgEllipse23;
    userName = userName ?? "Dianne";
    idolImage = idolImage ?? ImageConstant.img600x600bb44;
    idolText = idolText ?? "IDOL";
    yoasobiText = yoasobiText ?? "YOASOBI";
    id = id ?? "";
  }

  String? userImage;

  String? userName;

  String? idolImage;

  String? idolText;

  String? yoasobiText;

  String? id;
}
