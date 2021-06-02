import 'package:disc_test/app/common/custom_appbar.dart';
import 'package:disc_test/app/common/custom_body_background.dart';
import 'package:disc_test/app/res/colors.dart';
import 'package:disc_test/app/res/sizes.dart';
import 'package:disc_test/app/res/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HelpPage extends StatelessWidget {
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
                              'DISC TEST la gi?',
                              style: AppStyle.titleBoldTextStyle,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: AppSize.sizedBoxHeightL),
                            Image.asset('assets/images/help.png'),
                            const SizedBox(height: AppSize.sizedBoxHeightL),
                            Text(
                              'Trắc nghiệm tính cách DISC là công cụ đánh giá tính cách hiệu quả và phổ biến nhất hiện nay. '
                              'Dựa vào đây, doanh nghiệp sẽ đưa ra được những quyết định tuyển dụng đúng đắn. '
                              'Việc hiểu về nhân viên chính là nền tảng để xây dựng lộ trình đào tạo phù hợp, quản lý xung đột và thiết lập môi trường làm việc lý tưởng.'
                              '\n\nDISC cung cấp cái nhìn tổng quan, toàn diện về cách mà một người suy nghĩ, hành động và tương tác. '
                              'Đây là công cụ định dạng được sử dụng rộng rãi nhất của loại hình này, và được hỗ trợ bởi các nghiên cứu độ chính xác và độ tin cậy qua nhiều thập kỷ.',
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
              child: Container(
                height: MediaQuery.of(context).size.height *
                    AppSize.ratioBottomButton,
                padding: EdgeInsets.all(AppSize.paddingSizeS),
                alignment: Alignment.center,
                child: ElevatedButton(
                  child: Text('Lam bai test'),
                  style: ElevatedButton.styleFrom(
                    primary: AppColor.mostBtnColor,
                    shape: StadiumBorder(),
                    minimumSize:
                        Size(AppSize.buttonMinWidth, AppSize.buttonMinHeight),
                  ),
                  onPressed: () {},
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
