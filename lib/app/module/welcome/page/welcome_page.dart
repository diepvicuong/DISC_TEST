import 'package:disc_test/app/common/custom_appbar.dart';
import 'package:disc_test/app/common/custom_body_background.dart';
import 'package:disc_test/app/res/colors.dart';
import 'package:disc_test/app/res/sizes.dart';
import 'package:disc_test/app/res/styles.dart';
import 'package:disc_test/app/routes/app_pages.dart';
import 'package:disc_test/app/module/welcome/page/help_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBackgroundContainer(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              bottom: MediaQuery.of(context).size.height *
                  AppSize.ratioBottomButton,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AppbarTransparent(),
                    Column(
                      children: [
                        Text(
                          'GIÚP EM HỌC TỐT',
                          style: AppStyle.titleBoldTextStyle,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: AppSize.sizedBoxHeightL),
                        Image.asset(
                          'assets/images/flower.jpeg',
                          width: MediaQuery.of(context).size.width,
                          height: 400,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(height: AppSize.sizedBoxHeightL),
                        Text(
                          'Hãy cùng tham gia\nvới chúng tôi',
                          style: AppStyle.titleNormalTextStyle,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: AppSize.sizedBoxHeightM),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.group_add,
                              color: AppColor.kSecondaryColor,
                            ),
                            const SizedBox(
                              width: AppSize.sizeBoxWidthS,
                            ),
                            Text(
                              '+3.000 luot tuong tac',
                              style: AppStyle.italicTextStyle,
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              right: 0,
              left: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.all(AppSize.paddingSizeS),
                height: MediaQuery.of(context).size.height *
                    AppSize.ratioBottomButton,
                alignment: Alignment.center,
                child: ElevatedButton(
                  child:
                      Text('Làm bài kiểm tra', style: AppStyle.buttonTextStyle),
                  style: ElevatedButton.styleFrom(
                    primary: AppColor.mostBtnColor,
                    shape: StadiumBorder(),
                    minimumSize:
                        Size(AppSize.buttonMinWidth, AppSize.buttonMinHeight),
                  ),
                  onPressed: () {
                    Get.toNamed(Routes.LOGIN_PAGE);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
