import 'package:disc_test/app/common/custom_appbar.dart';
import 'package:disc_test/app/common/custom_body_background.dart';
import 'package:disc_test/app/common/snackbar.dart';
import 'package:disc_test/app/common/utils.dart';
import 'package:disc_test/app/module/login/controller/login_controller.dart';
import 'package:disc_test/app/res/colors.dart';
import 'package:disc_test/app/res/sizes.dart';
import 'package:disc_test/app/res/styles.dart';
import 'package:disc_test/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  String? password;
  String? name;
  int? age;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBackgroundContainer(
        child: Column(
          children: [
            AppbarBackBtn(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: AppSize.sizeBoxWidthL),
              child: Column(
                children: [
                  Text(
                    'Đăng ký thông tin',
                    style: AppStyle.titleBoldTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppSize.sizedBoxHeightXL),
                  CustomInfoWidget(
                    title: 'Họ tên: ',
                    onChange: (value) {
                      name = value;
                    },
                  ),
                  const SizedBox(height: AppSize.sizedBoxHeightM),
                  CustomInfoWidget(
                    title: 'Độ tuổi: ',
                    keyboardType: TextInputType.number,
                    onChange: (value) {
                      age = int.tryParse(value);
                    },
                  ),
                  const SizedBox(height: AppSize.sizedBoxHeightM),
                  CustomInfoWidget(
                    title: 'Mật khẩu(*): ',
                    keyboardType: TextInputType.number,
                    obscureText: true,
                    onChange: (value) {
                      password = value;
                    },
                  ),
                  const SizedBox(height: AppSize.sizedBoxHeightXL),
                  ElevatedButton(
                    child: Text(
                      'Đăng ký',
                      style: AppStyle.buttonTextStyle,
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: AppColor.mostBtnColor,
                      shape: StadiumBorder(),
                      minimumSize:
                          Size(AppSize.buttonMinWidth, AppSize.buttonMinHeight),
                    ),
                    onPressed: () async {
                      if (password == null || name == null || age == null) {
                        print('Missing info');
                        Get.snackbar("Xác thực tại khoản không thành công",
                            'Vui lòng điền đầy đủ thông tin');
                        return;
                      }

                      Utils.showLoadingDialog(context);
                      final result = await Get.find<LoginController>()
                          .registerUser(
                              name: name, age: age, password: password);
                      Get.back();
                      if (result == true) {
                        Get.offNamed(Routes.START_PAGE);
                        return;
                      }
                      Get.snackbar("Xác thực tại khoản không thành công",
                          'Vui lòng thử lại');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomInfoWidget extends StatelessWidget {
  final String title;
  final TextInputType? keyboardType;
  final ValueChanged? onChange;
  final bool? obscureText;

  const CustomInfoWidget(
      {Key? key,
      required this.title,
      this.keyboardType,
      this.onChange,
      this.obscureText})
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
              padding: EdgeInsets.symmetric(horizontal: AppSize.paddingSizeL),
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
                onChanged: onChange,
                obscureText: obscureText ?? false,
              ),
            ))
      ],
    );
  }
}
