import 'dart:async';

import 'package:flutter/services.dart';

import '../../general_exports.dart';

class SplashController extends GetxController {
  bool showForceUpdate = false;

  CompleteProfileController completeProfileController =
      CompleteProfileController();

  @override
  void onInit() {
    SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.onInit();

    update();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    // if (myAppController.)
    Timer(
      const Duration(seconds: 2),
      () {
        consoleLog(myAppController.userData, key: 'inSplash');

        if (myAppController.userData != null) {
          if (myAppController.userData['isProfileComplete']) {
            Get.offAndToNamed(routeHomeBottomBar);
          } else {
            onCompleteProfile();
          }
        } else {
          Get.offAndToNamed(routeLogin);
        }

        // Get.offAndToNamed(
        //   // && myAppController.userData?['profile_complete']
        //   myAppController.userData != null
        //       ? myAppController.userData['isProfileComplete']
        //           ? routeHomeBottomBar
        //           : routeCompleteProfile
        //       : routeLogin,
        // );

        /* if (showForceUpdate) {
          // * this is the dialog to till user we have important update.
          openSimpleDialog(
            title: 'Update Available',
            btnText: 'Update Now',
            description:
                'Some important features of the app have been added, Please update the app to get these features.',
            onPress: () {},
            titleIcon: const Icon(
              Icons.update,
              size: 30,
            ),
            showScendBtn: true,
            onPressScendBtn: () {
              Get.offAndToNamed(
                // && myAppController.userData?['profile_complete']
                myAppController.userData != null
                    ? myAppController.userData['isProfileComplete']
                        ? routeHomeBottomBar
                        : routeCompleteProfile
                    : routeLogin,
              );
            },
            scendBtnText: 'Skip for now',
          );
        } else {
          Get.offAndToNamed(
            // && myAppController.userData?['profile_complete']
            myAppController.userData != null
                ? myAppController.userData['isProfileComplete']
                    ? routeHomeBottomBar
                    : routeCompleteProfile
                : routeLogin,
          );
        } */
      },
    );
  }

  Future<void> onCompleteProfile() async {
    final Map<String, Object> temp = <String, Object>{
      'categories_id': <int>[1],
      'electric_board_id': 2,
      'gas_register_number': '',
      'license_number': '',
      'company_name': 'really',
      'trading_name': '',
      'registration_number': '',
      'has_vat': 'no',
      'vat_number': '',
      'registered_address': 'test',
      'postal_code': 'test',
      'number_street_name': 'test',
      'city': 'test',
      'state': 'test',
      'country_id': 218
    };

    ApiRequest(
      method: ApiMethods.post,
      path: keyCompleteProfile,
      className: 'InSplash/onCompleteProfile',
      requestFunction: onCompleteProfile,
      // withLoading: true,
      body: temp,
    ).request(
      onSuccess: (dynamic data, dynamic response) {
        final dynamic tempUserData = myAppController.userData;
        tempUserData['isProfileComplete'] = true;
        myAppController.onUserUpdated(tempUserData);
        //
        update();
        Get.offAndToNamed(routeHomeBottomBar);
      },
    );
  }
}
