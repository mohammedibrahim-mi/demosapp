import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';



class AppLoaders {

  void loadListener(BuildContext context, bool loader){
    debugPrint(loader.toString());
    if(loader == true){
      context.loaderOverlay.show();
    }else{
      context.loaderOverlay.hide();
    }
  }
}
