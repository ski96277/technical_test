
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

changeStatusBarColor(BuildContext context){
  WidgetsFlutterBinding.ensureInitialized();
  return    SystemChrome.setSystemUIOverlayStyle( const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));
}