import 'package:dots_indicator/dots_indicator.dart';
import 'package:entrance_test/src/constants/color.dart';
import 'package:entrance_test/src/features/boarding/component/boarding_controller.dart';
import 'package:entrance_test/src/widgets/button_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BoardingPage extends GetView<BoardingController> {
  const BoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: GridView.builder(
              itemCount: 9, // Total number of items in your grid
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Number of items per row
                childAspectRatio:
                    1, // This is the aspect ratio of the widgets in the grid
              ),
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(
                      5), // Optional: add some margin for each grid item
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    height: double.infinity,
                    width: double.infinity,
                    // color: primary,
                    child: Image(
                      fit: BoxFit.contain,
                      image: AssetImage(
                          'assets/icons/icon-boarding-${index + 1}.png'), // Replace with your app logo
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.5),
                  Colors.white.withOpacity(0.5),
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 2 / 3,
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: controller.pageContorller,
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  width: double.infinity,
                  color: Colors.transparent,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Our Afiliation',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      SizedBox(height: 16),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        child: Text(
                          'Loerm Ipsum Dolor Sit Amet Consectetur Adipiscing Elit Sed Do Eiusmod Tempor Incididunt Ut Labore Et Dolore Magna Aliqua Ut Enim Ad Minim Veniam Quis Nostrud Exercitation Ullamco Laboris Nisi Ut Aliquip Ex Ea Commodo ',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: gray900),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  color: Colors.transparent,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Our Product',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      SizedBox(height: 16),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        child: Text(
                          'Loerm Ipsum Dolor Sit Amet Consectetur Adipiscing Elit Sed Do Eiusmod Tempor Incididunt Ut Labore Et Dolore Magna Aliqua Ut Enim Ad Minim Veniam Quis Nostrud Exercitation Ullamco Laboris Nisi Ut Aliquip Ex Ea Commodo ',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: gray900),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  color: Colors.transparent,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Our Service',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      SizedBox(height: 16),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        child: Text(
                          'Loerm Ipsum Dolor Sit Amet Consectetur Adipiscing Elit Sed Do Eiusmod Tempor Incididunt Ut Labore Et Dolore Magna Aliqua Ut Enim Ad Minim Veniam Quis Nostrud Exercitation Ullamco Laboris Nisi Ut Aliquip Ex Ea Commodo ',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: gray900),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  color: Colors.transparent,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'About Us',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      SizedBox(height: 16),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        child: Text(
                          'Loerm Ipsum Dolor Sit Amet Consectetur Adipiscing Elit Sed Do Eiusmod Tempor Incididunt Ut Labore Et Dolore Magna Aliqua Ut Enim Ad Minim Veniam Quis Nostrud Exercitation Ullamco Laboris Nisi Ut Aliquip Ex Ea Commodo ',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: gray900),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Obx(() => DotsIndicator(
                      position: controller.stateBoarding.value,
                      dotsCount: 4, // Jumlah halaman Anda
                      decorator: const DotsDecorator(
                        activeColor: primary, // Warna dot saat aktif
                      ),
                    )),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ButtonText(
                        buttonColor: white,
                        textColor: primary,
                        textLabel: 'Skip',
                        onClick: () {
                          controller.onSkipTap();
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Obx(() => ButtonText(
                            buttonColor: primary,
                            textColor: white,
                            textLabel: controller.stateBoarding.value == 3
                                ? 'Finish'
                                : 'Next',
                            onClick: () {
                              controller.stateBoarding.value == 3
                                  ? controller.onFinisTap()
                                  : controller.onNextTap();
                            },
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
