import 'package:disc_test/app/common/custom_appbar.dart';
import 'package:disc_test/app/common/custom_body_background.dart';
import 'package:disc_test/app/common/regexs.dart';
import 'package:disc_test/app/common/snackbar.dart';
import 'package:disc_test/app/common/utils.dart';
import 'package:disc_test/app/module/login/controller/login_controller.dart';
import 'package:disc_test/app/res/colors.dart';
import 'package:disc_test/app/res/constant.dart';
import 'package:disc_test/app/res/styles.dart';
import 'package:disc_test/app/routes/app_pages.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  final LoginController loginController = Get.find<LoginController>();

  PhoneNumber number = PhoneNumber(isoCode: 'JS'); // 画面に表示する国旗、国コードの初期値
  String phoneNumber = '';
  String otp = '';
  @override
  void dispose() {
    _otpController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBackgroundContainer(
        child: Scrollbar(
          showTrackOnHover: true,
          child: CustomScrollView(slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  AppbarBackBtn(),
                  Expanded(
                    child: Container(
                      width: kIsWeb ? 500 : 0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Số điện thoại',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 5.0),
                                  decoration: BoxDecoration(
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: InternationalPhoneNumberInput(
                                    onInputChanged: (PhoneNumber number) {
                                      phoneNumber = number.phoneNumber ??
                                          ''; // 国コードを含む電話番号
                                      print(_phoneNumberController.text.length);
                                      setState(() {});
                                    },
                                    selectorConfig: SelectorConfig(
                                      selectorType:
                                          PhoneInputSelectorType.DIALOG,
                                    ),
                                    ignoreBlank: false,
                                    // ブランク時許可するか
                                    autoValidateMode: AutovalidateMode.disabled,
                                    // 1.19から非推奨らしい
                                    selectorTextStyle:
                                        TextStyle(color: Colors.black),
                                    // 国コードの色
                                    initialValue: number,
                                    textFieldController: _phoneNumberController,
                                    formatInput: false,
                                    maxLength: 10,
                                    // ?
                                    keyboardType: TextInputType.phone,
                                    countries: ['VN'],
                                    // 選択する国の制限
                                    hintText: 'Nhập số điện thoại vào đây',
                                    inputBorder: InputBorder.none,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Mã xác thực',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 5.0),
                                  decoration: BoxDecoration(
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: TextField(
                                          controller: _otpController,
                                          keyboardType: TextInputType.phone,
                                          decoration: InputDecoration(
                                              hintText:
                                                  'Nhập mã xác thực vào đây',
                                              border: InputBorder.none),
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(
                                                AppConstant.maxlegnthOtp),
                                          ],
                                          onChanged: (value) {
                                            setState(() {});
                                          },
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                          '${_otpController.text.length}/${AppConstant.maxlegnthOtp}'),
                                      SizedBox(width: 10),
                                      Obx(() => loginController.countDownOtp ==
                                              AppConstant.timeoutOtp
                                          ? InkWell(
                                              onTap: () {
                                                if (_phoneNumberController
                                                        .text.length <
                                                    9) {
                                                  return;
                                                }
                                                var formatPhonenumber;
                                                if (_phoneNumberController
                                                        .text.length ==
                                                    10) {
                                                  formatPhonenumber = "+84" +
                                                      _phoneNumberController
                                                          .text
                                                          .substring(1);
                                                } else {
                                                  formatPhonenumber =
                                                      phoneNumber;
                                                }

                                                loginController.sendOtp(
                                                    phoneNumber:
                                                        formatPhonenumber);
                                              },
                                              child: Text(
                                                'Gửi mã xác thực',
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: _phoneNumberController
                                                              .text.length <
                                                          9
                                                      ? AppColor
                                                          .disableButtonColor
                                                      : Colors.orange,
                                                ),
                                              ),
                                            )
                                          : Text(
                                              '${loginController.countDownOtp} s',
                                              style: AppStyle.appTextStyle
                                                  .copyWith(
                                                      color: AppColor.oragne),
                                            )),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 40),
                          SizedBox(
                            height: 50,
                            child: Obx(() => ElevatedButton(
                                  onPressed: () async {
                                    if (loginController.countDownOtp ==
                                        AppConstant.timeoutOtp) {
                                      return;
                                    }

                                    if (!AppRegex.digits
                                        .hasMatch(_otpController.text)) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                              AppSnackbar.failedSnackbar);
                                      return;
                                    }

                                    Utils.showLoadingDialog(context);
                                    final result =
                                        await loginController.signupViaFirebase(
                                            smsOtp: _otpController.text);

                                    Get.back();

                                    if (result == true) {
                                      Get.offNamed(Routes.REGISTER_PAGE);
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                              AppSnackbar.failedSnackbar);
                                    }
                                  },
                                  child: Text(
                                    'Đăng kí',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  style: ButtonStyle(
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.white),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              loginController.countDownOtp ==
                                                      AppConstant.timeoutOtp
                                                  ? AppColor.disableButtonColor
                                                  : Colors.orange),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ))),
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
