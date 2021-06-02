import 'package:disc_test/app/common/custom_appbar.dart';
import 'package:disc_test/app/common/custom_body_background.dart';
import 'package:disc_test/app/res/colors.dart';
import 'package:disc_test/app/res/sizes.dart';
import 'package:disc_test/app/res/styles.dart';
import 'package:disc_test/app/ui/finish/page/send_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultPage extends StatelessWidget {
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
              child: Column(
                children: [
                  AppbarBackBtn(),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppSize.sizeBoxWidthL),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Bai trac nghiem DISC',
                              style: AppStyle.titleBoldTextStyle,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: AppSize.sizedBoxHeightL),
                            Text(
                              'Xem ket qua',
                              style: AppStyle.contentNormalTextStyle,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: AppSize.sizedBoxHeightL),
                            Image.asset('assets/images/result_1.png'),
                            const SizedBox(height: AppSize.sizedBoxHeightL),
                            Text(
                              'D-I',
                              style: AppStyle.contentNormalTextStyle,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: AppSize.sizedBoxHeightL),
                            Text(
                              'Những người nằm ở nhóm này quan trọng kết quả hoàn thành.'
                              ' Họ luôn tự tin và có động lực cạnh tranh để chiến thắng hoặc đạt được thành công.'
                              ' Họ luôn chấp nhận thử thách và hành động tức thì để đạt được kết quả.'
                              ' Những người thuộc nhóm Thủ lĩnh thường được mô tả là mạnh mẽ, tự tin, nhanh nhẹn, luôn tiếp cận vấn đề một cách trực tiếp.'
                              ' Tuy nhiên, điểm trừ của những người thuộc nhóm Thủ lĩnh là đôi khi họ bị giới hạn bởi sự vô tâm đối với người khác, thiếu kiên nhẫn và hay hoài nghi. Đôi khi họ cũng được cho là dễ bị tổn thương.'
                              'Những người nằm ở nhóm này quan trọng kết quả hoàn thành.'
                              ' Họ luôn tự tin và có động lực cạnh tranh để chiến thắng hoặc đạt được thành công.'
                              ' Họ luôn chấp nhận thử thách và hành động tức thì để đạt được kết quả.'
                              'Những người nằm ở nhóm này quan trọng kết quả hoàn thành.'
                              ' Họ luôn tự tin và có động lực cạnh tranh để chiến thắng hoặc đạt được thành công.'
                              ' Họ luôn chấp nhận thử thách và hành động tức thì để đạt được kết quả.'
                              ' Những người thuộc nhóm Thủ lĩnh thường được mô tả là mạnh mẽ, tự tin, nhanh nhẹn, luôn tiếp cận vấn đề một cách trực tiếp.'
                              'Những người nằm ở nhóm này quan trọng kết quả hoàn thành.'
                              ' Họ luôn tự tin và có động lực cạnh tranh để chiến thắng hoặc đạt được thành công.'
                              ' Họ luôn chấp nhận thử thách và hành động tức thì để đạt được kết quả.'
                              ' Những người thuộc nhóm Thủ lĩnh thường được mô tả là mạnh mẽ, tự tin, nhanh nhẹn, luôn tiếp cận vấn đề một cách trực tiếp.'
                              ' Những người thuộc nhóm Thủ lĩnh thường được mô tả là mạnh mẽ, tự tin, nhanh nhẹn, luôn tiếp cận vấn đề một cách trực tiếp.',
                              style: AppStyle.appTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              right: 0,
              left: 0,
              bottom: 0,
              child: SizedBox(
                height: MediaQuery.of(context).size.height *
                    AppSize.ratioBottomButton,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      icon: Icon(Icons.home),
                      label: Text('Trang chu'),
                      style: ElevatedButton.styleFrom(
                        primary: AppColor.mostBtnColor,
                        shape: StadiumBorder(),
                        minimumSize: Size(
                            AppSize.buttonMinWidth, AppSize.buttonMinHeight),
                      ),
                      onPressed: () {},
                    ),
                    SizedBox(width: AppSize.sizeBoxWidthL),
                    ElevatedButton(
                      child: Text('Gui ket qua'),
                      style: ElevatedButton.styleFrom(
                          primary: AppColor.kprimaryColor,
                          shape: StadiumBorder(),
                          minimumSize: Size(
                              AppSize.buttonMinWidth, AppSize.buttonMinHeight)),
                      onPressed: () {
                        Get.to(SendPage(),
                            transition: Transition.rightToLeftWithFade);
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
