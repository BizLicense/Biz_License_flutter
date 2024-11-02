import 'package:intl/intl.dart';

import '../../general_exports.dart';

class UncompletedCert extends StatelessWidget {
  const UncompletedCert({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(
        title: 'Not Completed Certs',
      ),
      body: GetBuilder<UncompletedCertController>(
        init: UncompletedCertController(),
        builder: (UncompletedCertController controller) {
          return CommonContainer(
            style: appContainerStyles.containerStyles,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  CommonContainer(
                    width: 1,
                    height: 0.015,
                    borderRadius: 0.1,
                    backgroundColor: AppColors.homeClr2,
                  ),
                  SizedBox(height: DEVICE_HEIGHT * 0.02),
                  ...controller.unCompetedCerts.map(
                    (dynamic item) {
                      final String certStatus = item['status']['name'];
                      return SortCertificateCard(
                        onPress: () => Get.toNamed(
                          routeCertificateDetails,
                          arguments: <String, dynamic>{
                            keyId: item[keyId],
                            'customer_id': item['customer_id'],
                          },
                        ),
                        code: '#${item['num_cert'] ?? item[keyId]}',
                        formType: item['form']['type'],
                        price: '£ 0.0',
                        date: DateFormat('dd-MM-yyyy').format(
                            DateTime.parse(item['created_at'].toString())),
                        certStatus: item['status']['name'],
                        customerName: item['customer']['name'],
                        customerAddress: item['customer']['address'],
                        statusClr: certStatus == 'Completed'
                            ? AppColors.completedClr
                            : certStatus == 'Canceled'
                                ? AppColors.canceledClr
                                : certStatus == 'In Progress'
                                    ? AppColors.inProgressClr
                                    : AppColors.pendingClr,
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}