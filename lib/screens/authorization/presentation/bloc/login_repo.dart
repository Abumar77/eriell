import 'dart:async';
import 'dart:io' show Platform;

import 'package:hive/hive.dart';

import '../../../../utils/constants.dart';
import '../../../../utils/shared_preferences.services.dart';
import '../../data/model/models.dart';

abstract class LoginRepo {
  Future<bool> login(String username, String password);
  Future<bool> register(String username, String password);
}

class LoginRepoImpl extends LoginRepo {
  @override
  Future<bool> login(String username, String password) async {
    try {
      var box2 = Hive.box<UserHive>(UserBoxName);
      bool dbContainsUser = box2.containsKey(username);
      if (dbContainsUser) {
        UserHive? user = box2.get(username);
        if (user?.password == password) {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> register(String username, String password) async {
    UserHive credentials = UserHive(password: password, login: username);

    try {
      var box2 = Hive.box<UserHive>(UserBoxName);
      await box2.put(username, credentials);
      bool registered = await box2.containsKey(username);
      if (registered) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

//Method to save info in pref
// Future<void> setUserData(
//     PreferencesService pref, AuthUserResponse auth) async {
//   pref.putString(KEY_USERNAME, auth.user?.username ?? '');
//   pref.putString(KEY_EMAIL, auth.user?.email ?? '');
//   pref.putString(KEY_FULL_NAME, auth.user?.full_name ?? '');
//   var role = auth.user?.vendor_role?.id;
//   print(role);
//   pref.putString(KEY_ROLE, role);
//   pref.putString(KEY_MANUFACTURER_NAME, auth.user?.manufacturerName ?? '');
//   ManufacturerData? mData = auth.user?.manufacturerData;
//   if (mData != null) {
//     pref.putInt(KEY_STATUS, mData.status);
//     pref.putString(KEY_START_WORK, mData.work_start);
//     pref.putString(KEY_FINISH_WORK, mData.work_finish);
//     pref.putInt(KEY_ID, mData.id);
//     pref.putString(KEY_BRANCH_NAME, mData.name);
//   }
// }

}
