import 'package:disc_test/app/common/custom_appbar.dart';
import 'package:disc_test/app/common/custom_body_background.dart';
import 'package:disc_test/app/controllers/question/question_controller.dart';
import 'package:disc_test/app/res/colors.dart';
import 'package:disc_test/app/res/sizes.dart';
import 'package:disc_test/app/res/styles.dart';
import 'package:disc_test/app/routes/app_pages.dart';
import 'package:disc_test/app/ui/question/page/question_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kprimaryColorLight,
      body: CustomBackgroundContainer(
        child: Column(
          children: [
            AppbarBackBtn(),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppSize.sizeBoxWidthL),
                  child: Column(
                    children: [
                      Text(
                        'Bai trac nghiem DISC',
                        style: AppStyle.titleBoldTextStyle,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: AppSize.sizedBoxHeightL),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.alarm,
                            color: AppColor.kSecondaryColor,
                          ),
                          SizedBox(width: AppSize.sizeBoxWidthM),
                          Text(
                            '00:25:00',
                            style: AppStyle.appTextStyle,
                          )
                        ],
                      ),
                      const SizedBox(height: AppSize.sizedBoxHeightL),
                      Text(
                        'B??i ki???m tra DISC n??y cho ph??p b???n x??c ?????nh lo???i DISC v?? t??nh c??ch c?? nh??n nhanh ch??ng ch??? trong v??ng 5-10 ph??t b???ng c??ch l???n l?????t ch???n mi??u t??? ????ng nh???t v?? kh??c nh???t v??? b???n '
                        '\n\nH??y nh??? r???ng kh??ng c?? c??u tr??? l???i ????ng hay sai trong b??i ki???m tra t??nh c??ch DISC n??y, v?? v???y h??y ????a ra quy???t ?????nh t???t nh???t b???n c?? th???.',
                        style: AppStyle.contentNormalTextStyle,
                      ),
                      const SizedBox(height: 40),
                      ElevatedButton(
                        child: Text(
                          'Start',
                          style: AppStyle.appTextStyle,
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: AppColor.mostBtnColor,
                          shape: StadiumBorder(),
                          minimumSize: Size(
                              AppSize.buttonMinWidth, AppSize.buttonMinHeight),
                        ),
                        onPressed: () {
                          Get.defaultDialog(
                            title: "Notification",
                            content: Text("Are you ready to do the test"),
                            onConfirm: () {
                              Get.back();
                              Get.offNamed(Routes.QUESTION_PAGE);
                            },
                            onCancel: () {},
                            barrierDismissible: false,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
