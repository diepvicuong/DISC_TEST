import 'package:disc_test/app/res/colors.dart';
import 'package:disc_test/app/res/sizes.dart';
import 'package:disc_test/app/res/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SendPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kprimaryColorLight,
      body: Column(
        children: [
          AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.chevron_left),
              onPressed: () {
                Get.back();
              },
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: AppSize.sizeBoxWidthL),
            child: Column(
              children: [
                Text(
                  'Bai trac nghiem DISC',
                  style: AppStyle.titleBoldTextStyle,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSize.sizedBoxHeightL),
                Text(
                  'Gui ket qua',
                  style: AppStyle.contentNormalTextStyle,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSize.sizedBoxHeightL),
                CustomInfoWidget(title: 'Ho ten: '),
                const SizedBox(height: AppSize.sizedBoxHeightM),
                CustomInfoWidget(
                  title: 'Email ca nhan: ',
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: AppSize.sizedBoxHeightM),
                CustomInfoWidget(
                  title: 'Email nguoi nhan: ',
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: AppSize.sizedBoxHeightXL),
                ElevatedButton(
                  child: Text(
                    'Gui',
                    style: AppStyle.appTextStyle,
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: AppColor.mostBtnColor,
                    shape: StadiumBorder(),
                    minimumSize:
                        Size(AppSize.buttonMinWidth, AppSize.buttonMinHeight),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomInfoWidget extends StatelessWidget {
  final String title;
  final TextInputType? keyboardType;

  const CustomInfoWidget({Key? key, required this.title, this.keyboardType})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 2,
            child: Text(
              title,
              style: AppStyle.appTextStyle.copyWith(fontSize: 20),
            )),
        Expanded(
            flex: 4,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: AppSize.paddingSizeS),
              decoration: BoxDecoration(
                  color: AppColor.kSecondaryColor,
                  borderRadius:
                      BorderRadius.circular(AppSize.commonBorderRadius),
                  border: Border.all(color: Colors.black)),
              child: TextField(
                keyboardType: this.keyboardType,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
              ),
            ))
      ],
    );
  }
}
