import 'package:flutter/cupertino.dart';
import 'dart:ui' as ui;

enum DeviceType{
  PHONE,TABLET,OTHER
}

deviceType(context) {
  double devicePixelRatio = ui.window.devicePixelRatio;
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;
//  if (devicePixelRatio < 2 && (width >= 1000 || height >= 1000)) {
//    return DeviceType.TABLET;
//  } else if (devicePixelRatio <= 2 && (width >= 1920 || height >= 1920)) {
//    return DeviceType.TABLET;
//  } else {

//    if (devicePixelRatio < 2.0){
//      return DeviceType.TABLET;
//    }

    if (height > width ){
      if (height/width < 1.4){
        return DeviceType.TABLET;
      }
    }
    if (width > height){
      if (width/height < 1.4){
        return DeviceType.TABLET;
      }
    }
    return DeviceType.PHONE;
//  }
}
