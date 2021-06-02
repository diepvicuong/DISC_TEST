import 'package:disc_test/app/res/colors.dart';
import 'package:disc_test/app/res/sizes.dart';
import 'package:disc_test/app/res/styles.dart';
import 'package:disc_test/app/ui/result/page/result_page.dart';
import 'package:disc_test/app/ui/result/page/send_mail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FinishPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kprimaryColorLight,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            bottom:
                MediaQuery.of(context).size.height * AppSize.ratioBottomButton,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSize.homeItemPadding),
                child: Column(
                  children: [
                    Text(
                      'Bai trac nghiem DISC',
                      style: AppStyle.titleBoldTextStyle,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: AppSize.sizedBoxHeightXL),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppSize.paddingSizeL),
                      child: Text(
                        'Chuc mung ban da hoan thanh bai Test!',
                        style: AppStyle.contentNormalTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: AppSize.sizedBoxHeightXL),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                            child: CustomButton(
                          iconData: Icons.description,
                          text: 'Xem ket qua',
                          onTap: () {
                            print('Xem ket qua');
                            Get.to(ResultPage(),
                                transition: Transition.rightToLeftWithFade);
                          },
                        )),
                        const SizedBox(
                          width: AppSize.sizeBoxWidthM,
                        ),
                        Expanded(
                            child: CustomButton(
                          iconData: Icons.email,
                          text: 'Gui ket qua',
                          onTap: () {
                            //handle tap
                            Get.to(SendPage(), transition: Transition.zoom);
                          },
                        )),
                        const SizedBox(
                          width: AppSize.sizeBoxWidthM,
                        ),
                        Expanded(
                            child: CustomButton(
                          iconData: Icons.assignment,
                          text: 'Xem lai bai lam',
                          onTap: () {
                            //Handle tap
                          },
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            left: 0,
            bottom: 0,
            child: SizedBox(
              height: MediaQuery.of(context).size.height *
                  AppSize.ratioBottomButton,
              child: Center(
                child: ElevatedButton.icon(
                  icon: Icon(Icons.home),
                  label: Text('Home'),
                  style: ElevatedButton.styleFrom(
                    primary: AppColor.mostBtnColor,
                    shape: StadiumBorder(),
                    minimumSize:
                        Size(AppSize.buttonMinWidth, AppSize.buttonMinHeight),
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData iconData;
  final String text;
  final VoidCallback? onTap;

  CustomButton(
      {Key? key, required this.iconData, required this.text, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Card(
        color: AppColor.kSecondaryColor,
        elevation: 10,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.paddingSizeM)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSize.paddingSizeS),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                this.iconData,
                size: 60,
                color: AppColor.kprimaryColor,
              ),
              const SizedBox(
                height: AppSize.sizedBoxHeightM,
              ),
              SizedBox(
                height: AppSize.sizedBoxHeightXL,
                child: Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                      onTap: this.onTap,
                      child: Text(
                        this.text,
                        style: AppStyle.primaryColorBoldTextStyle,
                        textAlign: TextAlign.center,
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
