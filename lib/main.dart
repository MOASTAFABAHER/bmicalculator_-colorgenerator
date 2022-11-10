import 'package:color_generator/service/shared_prefrence_helper.dart';
import 'package:color_generator/src/app_root.dart';
import 'package:flutter/cupertino.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPrefrenceHelper.init();
  runApp(AppRoot());
}
