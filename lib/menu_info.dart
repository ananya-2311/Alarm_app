import 'enums/enum.dart';
import 'package:flutter/foundation.dart';

class MenuInfo extends ChangeNotifier{
  MenuType menuType;
  String title;
  String imagesource;
  MenuInfo(this.menuType, {this.title, this.imagesource});

  updateMenu(MenuInfo menuInfo){
    this.menuType = menuInfo.menuType;
    this.title= menuInfo.title;
    this.imagesource = menuInfo.imagesource;

    notifyListeners();
  }
}