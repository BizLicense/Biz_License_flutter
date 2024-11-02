import '../../general_exports.dart';

class MySubscription extends StatelessWidget {
  const MySubscription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(
        title: 'Subscription Expired',
        withShadow: true,
        withBack: false,
      ),
      body: GetBuilder<MySubscriptionController>(
        init: MySubscriptionController(),
        builder: (MySubscriptionController controller) {
          return CommonContainer(
            marginHorizontal: 0.04,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SvgIconHelper(
                  iconPath: iconSubscribe,
                  color: Color(AppColors.primary),
                  width: 0.15.flexWidth,
                  height: 0.15.flexHeight,
                ),
                CommonText(
                  'Subscription Now',
                  fontColor: Color(AppColors.primary),
                  fontSize: fontH1,
                  marginBottom: 0.01,
                  marginTop: 0.02,
                  bottomChild: CommonText(
                    'Your free trails/subscription has expired if you want continue please subscribe now.',
                    fontColor: Colors.grey[600],
                    fontSize: fontH3,
                    marginBottom: 0.02,
                  ),
                ),
                CommonButton(
                  onPress: homeController.getUrlSubscription,
                  text: 'Subscribe',
                ),
                SizedBox(
                  width: 1.flexWidth,
                  child: TextButton(
                    onPressed: myAppController.onSignOut,
                    child: CommonText(
                      'LOGOUT',
                      fontSize: fontH2,
                      fontColor: Color(AppColors.primary),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
