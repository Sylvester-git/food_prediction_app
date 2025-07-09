import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

abstract class Storage {
  Future<void> saveToken({required String token});
  Future<String> getToken();
  Future<void> clearData();
  Future<void> initHive();
}

class StorageImpl implements Storage {
  //! Boxs
  final String userBox = 'userBox';

  //! Keys
  final String tokenKey = 'tokenKey';
  @override
  Future<void> clearData() async {
    await Future.wait([Hive.deleteBoxFromDisk(userBox)]);
  }

  @override
  Future<String> getToken() async {
    final openBox = await Hive.openBox(userBox);
    final value = await openBox.get(tokenKey, defaultValue: '') as String;
    await openBox.close();
    return value;
  }

  @override
  Future<void> initHive() async {
    if (kIsWeb) return;
    final appDirectory = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(appDirectory.path);
  }

  @override
  Future<void> saveToken({required String token}) async {
    final openBox = await Hive.openBox(userBox);
    await openBox.put(tokenKey, token);
    await openBox.close();
  }
}
