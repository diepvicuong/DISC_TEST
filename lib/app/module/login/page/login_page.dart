import 'package:disc_test/app/common/custom_appbar.dart';
import 'package:disc_test/app/common/custom_body_background.dart';
import 'package:disc_test/app/common/snackbar.dart';
import 'package:disc_test/app/common/utils.dart';
import 'package:disc_test/app/module/login/controller/login_controller.dart';
import 'package:disc_test/app/res/colors.dart';
import 'package:disc_test/app/res/constant.dart';
import 'package:disc_test/app/res/sizes.dart';
import 'package:disc_test/app/res/styles.dart';
import 'package:disc_test/app/routes/app_pages.dart';
import 'package:disc_test/app/module/login/widget/pin_code_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final LoginController loginController = Get.find<LoginController>();
  String phoneNumber = '';
  String password = '';
  PhoneNumber number = PhoneNumber(isoCode: 'VN'); // 画面に表示する国旗、国コードの初期値

  @override
  void dispose() {
    _passwordController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  bool isValid() {
    return _phoneNumberController.text.length >= 9 &&
        _passwordController.text.isNotEmpty;
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
                      width: kIsWeb ? 500 : null,
                      padding: EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'GIÚP EM HỌC TỐT ',
                            style: AppStyle.titleBoldTextStyleWeb,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 40),
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
                                  'Mật khẩu',
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
                                          controller: _passwordController,
                                          keyboardType: TextInputType.phone,
                                          decoration: InputDecoration(
                                              hintText: 'Nhập mật khẩu',
                                              border: InputBorder.none),
                                          obscureText: true,
                                          onChanged: (value) {
                                            setState(() {});
                                          },
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 40),
                          SizedBox(
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () async {
                                  if (!isValid()) return;
                                  Utils.showLoadingDialog(context);
                                  var formatPhonenumber;
                                  if (_phoneNumberController.text.length ==
                                      10) {
                                    formatPhonenumber = "+84" +
                                        _phoneNumberController.text
                                            .substring(1);
                                  } else {
                                    formatPhonenumber = phoneNumber;
                                  }
                                  final result =
                                      await loginController.loginViaFirebase(
                                          phoneNumber: formatPhonenumber,
                                          password: _passwordController.text);

                                  Navigator.of(context).pop();
                                  if (result == true) {
                                    Get.toNamed(Routes.START_PAGE);
                                  } else {
                                    Get.snackbar("Đăng nhập không thành công",
                                        'Số điện thoại này chưa đăng kí hoặc mật khẩu không đúng');
                                  }
                                },
                                child: Text(
                                  'Đăng nhập',
                                  style: TextStyle(fontSize: 20),
                                ),
                                style: ButtonStyle(
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            !isValid()
                                                ? AppColor.disableButtonColor
                                                : Colors.orange),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ))),
                              )),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Chưa có tài khoản. ',
                                style: TextStyle(fontSize: 18),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.toNamed(Routes.SIGNUP_PAGE);
                                },
                                child: Text(
                                  'Đăng kí mới?',
                                  style: AppStyle.appTextStyle
                                      .copyWith(fontSize: 18),
                                ),
                              )
                            ],
                          ),
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
