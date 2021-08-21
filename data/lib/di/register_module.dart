import 'dart:io';

import 'package:data/core/models/user_model.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

@module
abstract class RegisterModule {
  // @lazySingleton
  // Future<HiveInterface> hive() async {
  //   var path = await getApplicationDocumentsDirectory();
  //   return Hive
  //     ..init(path.path)
  //     ..registerAdapter(UserModelAdapter());
  // }

  @preResolve // if you need to pre resolve the value
  Future<HiveInterface> get hive async {
    var path = await getApplicationDocumentsDirectory();
    return Hive
      ..init(path.path)
      ..registerAdapter(UserModelAdapter());
  }
}
