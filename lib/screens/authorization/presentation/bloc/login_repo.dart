import 'dart:async';
import 'dart:io' show Platform;

import '../../../../utils/constants.dart';
import '../../../../utils/shared_preferences.services.dart';
import '../../data/model/models.dart';

abstract class LoginRepo {
  Future<LoginResponse> login(String username, String password);
}

class LoginRepoImpl extends LoginRepo {
  @override
  Future<LoginResponse> login(String username, String password) async {
    // DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    // String? deviceName;
    // String? deviceKey;
    // String? platformId = 'mobile';
    // if (Platform.isAndroid) {
    //   AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
    //   deviceName = androidDeviceInfo.model;
    //   deviceKey = androidDeviceInfo.device;
    // } else if (Platform.isIOS) {
    //   IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
    //   deviceName = iosDeviceInfo.model;
    //   deviceKey = iosDeviceInfo.systemName;
    // } else {
    //   platformId = 'web';
    // }
    var credentials = <String, String>{};
    credentials['username'] = username;
    credentials['password'] = password;
    // credentials['device_name'] = deviceName!;
    // credentials['device_key'] = deviceKey!;
    // credentials['platform_id'] = platformId;
    try {
      /// some response
      // final response = await HttpClientProvider.getInstance.client
      //     .post(
      //       "users/create/token",
      //       data: credentials,
      //     )
      //     .timeout(const Duration(seconds: 7));

      final response =
          LoginResponse(success: true, error: null, result: "TOKEN");
      // if (response.statusCode == 200) {

      // var auth = LoginResponse.fromJson(response);
      if (response.success == true) {
        final prefs = PreferencesService();
        await setData(prefs, response);

        return response;
      } else {
        throw Exception(response.error);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> setData(PreferencesService pref, LoginResponse auth) async {
    // var list = auth.token!.values.toList();
    pref.putString(
      KEY_TOKEN,
      auth.result,
    );
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
