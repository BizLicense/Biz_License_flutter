import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';

import 'general_exports.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  GestureBinding.instance.resamplingEnabled = true;

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: Colors.black,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    ),
  );

  SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await GetStorage.init();

  // Get.put(AppLanguageController());
  Get.put(MyAppController());

  setGlobalConfig(
    textModel: const CommonTextModel(
      fontSize: COMMON_H3_FONT,
      // fontWeight: FontWeight.bold,
    ),
    buttonModel: CommonButtonModel(
      height: 0.057,
      backgroundColor: AppColors.primary,
      fontColor: Colors.white,
      fontSize: COMMON_H3_FONT,
      fontWeight: FontWeight.w400,
      borderRadius: 0.015,
      width: 1,
    ),
    inputModel: CommonInputModel(
      fillColor: Colors.white70,
      borderRadius: DEVICE_WIDTH * 0.015,
      borderWidth: 1.5,
      topLabelContainerStyle: const CommonContainerModel(
        marginVertical: 0.01,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(DEVICE_WIDTH * 0.015),
        ),
        borderSide: BorderSide(
          color: getColorType(AppColors.primary),
          width: 1.8,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(DEVICE_WIDTH * 0.015),
        ),
        borderSide: BorderSide(
          color: getColorType(AppColors.grey),
          width: 1.5,
        ),
      ),
      borderColor: Colors.transparent,
      enabledBorderColor: AppColors.grey,
      prefixHeight: 0.027,
      maxLines: 1,
      textInputAction: TextInputAction.next,
      contentPaddingHorizontal: 0.03,
      marginBottom: 0.012,
    ),
  );

  runApp(const MyApp());
  // final RemoteMessage? initialMessage =
  //     await FirebaseMessaging.instance.getInitialMessage();
  // if (initialMessage != null) {
  //   // App received a notification when it was killed
  // }
}
