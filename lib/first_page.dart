import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sumit_portfolio/constants/strings.dart';
import 'package:sumit_portfolio/responsive.dart';
import 'package:sumit_portfolio/widgets/common_widgets.dart';
import 'package:url_launcher/url_launcher.dart';

const skillsList = [
  'Dart',
  'Flutter',
  'Kotlin',
  'Android',
  'Cubit',
  'Firebase',
  'Git',
  'MVVM'
];

enum SocialMediaIcon { cv, linkedin, github , gmail, whatsapp, call}

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  bool _showName = false;

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.sizeOf(context).width;
    print(width);
    double height = MediaQuery.sizeOf(context).height;

    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Image.asset(
              "assets/images/stars.gif",
              height: height,
              width: width,
              fit: BoxFit.cover,
            ),
            SingleChildScrollView(
              child: SizedBox(
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30.h,
                    ),
                    Row(
                      children: [
                        Flexible(
                            flex: 1,
                            child: Image.asset(
                              "assets/images/flutter_dev.png",
                              width: width * 0.4,
                            )),
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AnimatedTextKit(
                                animatedTexts: [
                                  TypewriterAnimatedText(
                                    helloWorld,
                                    textStyle: const TextStyle(
                                      fontSize: 32,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    speed: const Duration(milliseconds: 100),
                                  ),
                                ],
                                totalRepeatCount: 1,
                                displayFullTextOnTap: true,
                                stopPauseOnTap: true,
                                onFinished: () {
                                  setState(() {
                                    _showName = true;
                                  });
                                },
                              ),
                              const SizedBox(height: 15,),
                              if (_showName)
                                Responsive(
                                    desktop: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        AnimatedTextKit(
                                          animatedTexts: [
                                            TypewriterAnimatedText(
                                              nameWithPosition,
                                              textStyle: const TextStyle(
                                                fontSize: 32,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              speed: const Duration(
                                                  milliseconds: 100),
                                            ),
                                          ],
                                          totalRepeatCount: 1,
                                          displayFullTextOnTap: true,
                                          stopPauseOnTap: true,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 40),
                                          child: Column(
                                            children: [
                                              getSocialMediaIcon(
                                                  path: 'cv.png',
                                                  iconType: SocialMediaIcon.cv,
                                                  toolTipMessage: viewResume),
                                              const SizedBox(
                                                height: 30,
                                              ),
                                              getSocialMediaIcon(
                                                  path: 'linkedin.png',
                                                  iconType:
                                                      SocialMediaIcon.linkedin,
                                                  toolTipMessage: linkedIn),
                                              const SizedBox(
                                                height: 30,
                                              ),
                                              getSocialMediaIcon(
                                                  path: 'github.png',
                                                  iconType:
                                                      SocialMediaIcon.github,
                                                  toolTipMessage: github),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    mobile: getText(
                                        data: name,
                                        fontSize: 32,
                                        color: Colors.white,
                                        weight: FontWeight.bold),
                                    tablet: getText(
                                        data: name,
                                        fontSize: 32,
                                        color: Colors.white,
                                        weight: FontWeight.bold))
                            ],
                          ),
                        )
                      ],
                    ),
                    if (_showName)
                      Responsive(
                          desktop: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30.w, vertical: 10.h),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            getText(
                                                data: aboutSumit,
                                                fontSize: 22,
                                                color: Colors.white,
                                                weight: FontWeight.bold),
                                            SizedBox(height: 20.h,),
                                            getText(
                                                data: aboutMe,
                                                fontSize: 18,
                                                color: Colors.white,
                                                weight: FontWeight.normal),
                                            SizedBox(height: 40.h,),
                                            getText(
                                                data: skillSet,
                                                fontSize: 22,
                                                color: Colors.white,
                                                weight: FontWeight.bold),
                                            SizedBox(height: 20.h,),
                                          ],
                                        )),
                                    skillsGridLayout(crossAxisCount: 4,aspectRatio: 2.5),

                                    Padding(
                                        padding:
                                         EdgeInsets.only(left: 20.0,top: 20.h),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            getText(
                                                data: myWork,
                                                fontSize: 22,
                                                color: Colors.white,
                                                weight: FontWeight.bold),
                                            SizedBox(height: 20.h,),
                                            InkWell(
                                              onTap: (){
                                                _launchUrl(url: 'https://pub.dev/packages/password_strength_validator');
                                              },
                                              child: getText(
                                                  data: passwordStrengthValidator,
                                                  fontSize: 20,
                                                  color: Colors.white,
                                                  decoration: TextDecoration.underline,
                                                  weight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 15.h,),
                                            getText(
                                                data: packageDesc,
                                                fontSize: 18,
                                                color: Colors.white,
                                                weight: FontWeight.normal),
                                            const SizedBox(height: 5,),
                                            Wrap(
                                              children: [
                                                getText(
                                                    data: youCanCheckCode,
                                                    fontSize: 18,
                                                    color: Colors.white,
                                                    weight: FontWeight.normal),

                                                InkWell(
                                                  onTap: (){
                                                    _launchUrl(url: 'https://github.com/sumit024/password_validator');
                                                  },
                                                  child: getText(
                                                      data: here,
                                                      fontSize: 18,
                                                      color: Colors.white,
                                                      weight: FontWeight.normal,
                                                    decoration: TextDecoration.underline
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 20.h,),
                                            InkWell(
                                              onTap: (){
                                                _launchUrl(url: 'https://play.google.com/store/apps/details?id=com.wm.crispusdelivery');
                                              },
                                              child: getText(
                                                  data: crispusTeam,
                                                  fontSize: 20,
                                                  color: Colors.white,
                                                  decoration: TextDecoration.underline,
                                                  weight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 15.h,),
                                            getText(
                                                data: crispusTeamDesc,
                                                fontSize: 18,
                                                color: Colors.white,
                                                weight: FontWeight.normal),
                                            SizedBox(height: 20.h,),
                                            InkWell(
                                              onTap: (){
                                                _launchUrl(url: 'https://apps.apple.com/us/app/goods-ads/id1664772206');
                                              },
                                              child: getText(
                                                  data: goodsAds,
                                                  fontSize: 20,
                                                  color: Colors.white,
                                                  decoration: TextDecoration.underline,
                                                  weight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 15.h,),
                                            getText(
                                                data: goodsAdsDescription,
                                                fontSize: 18,
                                                color: Colors.white,
                                                weight: FontWeight.normal),
                                            const SizedBox(height: 5,),
                                            SizedBox(height: 60.h,),
                                            Center(
                                              child: getText(
                                                  data: hireMe,
                                                  fontSize: 22,
                                                  color: Colors.white,
                                                  weight: FontWeight.bold),
                                            ),
                                            SizedBox(height:40.h),
                                            Padding(
                                              padding:  EdgeInsets.symmetric(horizontal: width*0.3),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  getSocialMediaIcon(path: 'gmail.png', iconType: SocialMediaIcon.gmail, toolTipMessage: 'Mail me'),
                                                  getSocialMediaIcon(path: 'whatsapp.png', iconType: SocialMediaIcon.whatsapp, toolTipMessage: 'Whatsapp'),
                                                  getSocialMediaIcon(path: 'call.png', iconType: SocialMediaIcon.call, toolTipMessage: 'Call me'),

                                                ],
                                              ),
                                            ),
                                            SizedBox(height:60.h),
                                            Center(
                                              child: getText(
                                                  data: copyRight,
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                  weight: FontWeight.bold),
                                            ),
                                          ],
                                        )),
                                  ])),
                          mobile: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 30.h),
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: getText(
                                          data: position,
                                          fontSize: 22,
                                          color: Colors.white,
                                          weight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 20.h,),
                                    Padding(
                                      padding:  EdgeInsets.symmetric(horizontal: 60.w),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        mainAxisSize: MainAxisSize.max,

                                        children: [
                                          getSocialMediaIcon(
                                              path: 'cv.png',
                                              iconType: SocialMediaIcon.cv,
                                              toolTipMessage: viewResume),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          getSocialMediaIcon(
                                              path: 'linkedin.png',
                                              iconType:
                                              SocialMediaIcon.linkedin,
                                              toolTipMessage: linkedIn),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          getSocialMediaIcon(
                                              path: 'github.png',
                                              iconType:
                                              SocialMediaIcon.github,
                                              toolTipMessage: github),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30.h,
                                    ),
                                    getText(
                                        data: aboutSumit,
                                        fontSize: 22,
                                        color: Colors.white,
                                        weight: FontWeight.bold),
                                    SizedBox(height: 20.h,),
                                    getText(
                                        data: aboutMe,
                                        fontSize: 18,
                                        color: Colors.white,
                                        weight: FontWeight.normal),
                                    SizedBox(height: 40.h,),
                                    getText(
                                        data: skillSet,
                                        fontSize: 22,
                                        color: Colors.white,
                                        weight: FontWeight.bold),
                                    skillsGridLayout(crossAxisCount: 3),
                                    Padding(
                                        padding:
                                        EdgeInsets.only(left: 20.0,top: 20.h),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            getText(
                                                data: myWork,
                                                fontSize: 22,
                                                color: Colors.white,
                                                weight: FontWeight.bold),
                                            SizedBox(height: 20.h,),
                                            InkWell(
                                              onTap: (){
                                                _launchUrl(url: 'https://pub.dev/packages/password_strength_validator');
                                              },
                                              child: getText(
                                                  data: passwordStrengthValidator,
                                                  fontSize: 20,
                                                  color: Colors.white,
                                                  decoration: TextDecoration.underline,
                                                  weight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 15.h,),
                                            getText(
                                                data: packageDesc,
                                                fontSize: 18,
                                                color: Colors.white,
                                                weight: FontWeight.normal),
                                            const SizedBox(height: 5,),
                                            Wrap(
                                              children: [
                                                getText(
                                                    data: youCanCheckCode,
                                                    fontSize: 18,
                                                    color: Colors.white,
                                                    weight: FontWeight.normal),

                                                InkWell(
                                                  onTap: (){
                                                    _launchUrl(url: 'https://github.com/sumit024/password_validator');
                                                  },
                                                  child: getText(
                                                      data: here,
                                                      fontSize: 18,
                                                      color: Colors.white,
                                                      weight: FontWeight.normal,
                                                      decoration: TextDecoration.underline
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 20.h,),
                                            InkWell(
                                              onTap: (){
                                                _launchUrl(url: 'https://play.google.com/store/apps/details?id=com.wm.crispusdelivery');
                                              },
                                              child: getText(
                                                  data: crispusTeam,
                                                  fontSize: 20,
                                                  color: Colors.white,
                                                  decoration: TextDecoration.underline,
                                                  weight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 15.h,),
                                            getText(
                                                data: crispusTeamDesc,
                                                fontSize: 18,
                                                color: Colors.white,
                                                weight: FontWeight.normal),
                                            SizedBox(height: 20.h,),
                                            InkWell(
                                              onTap: (){
                                                _launchUrl(url: 'https://apps.apple.com/us/app/goods-ads/id1664772206');
                                              },
                                              child: getText(
                                                  data: goodsAds,
                                                  fontSize: 20,
                                                  color: Colors.white,
                                                  decoration: TextDecoration.underline,
                                                  weight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 15.h,),
                                            getText(
                                                data: goodsAdsDescription,
                                                fontSize: 18,
                                                color: Colors.white,
                                                weight: FontWeight.normal),
                                            const SizedBox(height: 5,),
                                            SizedBox(height: 60.h,),
                                            Center(
                                              child: getText(
                                                  data: hireMe,
                                                  fontSize: 22,
                                                  color: Colors.white,
                                                  weight: FontWeight.bold),
                                            ),
                                            SizedBox(height:40.h),
                                            Padding(
                                              padding:  EdgeInsets.symmetric(horizontal: 60.w),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  getSocialMediaIcon(path: 'gmail.png', iconType: SocialMediaIcon.gmail, toolTipMessage: 'Mail me'),
                                                  getSocialMediaIcon(path: 'whatsapp.png', iconType: SocialMediaIcon.whatsapp, toolTipMessage: 'Whatsapp'),
                                                  getSocialMediaIcon(path: 'call.png', iconType: SocialMediaIcon.call, toolTipMessage: 'Call me'),

                                                ],
                                              ),
                                            ),
                                            SizedBox(height:60.h),
                                            Center(
                                              child: getText(
                                                  data: copyRight,
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                  weight: FontWeight.bold),
                                            ),
                                          ],
                                        )),
                                  ])),
                          tablet: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 30.h),
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: getText(
                                          data: position,
                                          fontSize: 22,
                                          color: Colors.white,
                                          weight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 20.h,),
                                    Padding(
                                      padding:  EdgeInsets.symmetric(horizontal: 60.w),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        mainAxisSize: MainAxisSize.max,

                                        children: [
                                          getSocialMediaIcon(
                                              path: 'cv.png',
                                              iconType: SocialMediaIcon.cv,
                                              toolTipMessage: viewResume),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          getSocialMediaIcon(
                                              path: 'linkedin.png',
                                              iconType:
                                              SocialMediaIcon.linkedin,
                                              toolTipMessage: linkedIn),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          getSocialMediaIcon(
                                              path: 'github.png',
                                              iconType:
                                              SocialMediaIcon.github,
                                              toolTipMessage: github),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30.h,
                                    ),
                                    getText(
                                        data: aboutSumit,
                                        fontSize: 22,
                                        color: Colors.white,
                                        weight: FontWeight.bold),
                                    SizedBox(height: 20.h,),
                                    getText(
                                        data: aboutMe,
                                        fontSize: 18,
                                        color: Colors.white,
                                        weight: FontWeight.normal),
                                    SizedBox(height: 40.h,),
                                    getText(
                                        data: skillSet,
                                        fontSize: 22,
                                        color: Colors.white,
                                        weight: FontWeight.bold),
                                    skillsGridLayout(crossAxisCount: 3),
                                    Padding(
                                        padding:
                                        EdgeInsets.only(left: 20.0,top: 20.h),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            getText(
                                                data: myWork,
                                                fontSize: 22,
                                                color: Colors.white,
                                                weight: FontWeight.bold),
                                            SizedBox(height: 20.h,),
                                            InkWell(
                                              onTap: (){
                                                _launchUrl(url: 'https://pub.dev/packages/password_strength_validator');
                                              },
                                              child: getText(
                                                  data: passwordStrengthValidator,
                                                  fontSize: 20,
                                                  color: Colors.white,
                                                  decoration: TextDecoration.underline,
                                                  weight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 15.h,),
                                            getText(
                                                data: packageDesc,
                                                fontSize: 18,
                                                color: Colors.white,
                                                weight: FontWeight.normal),
                                            const SizedBox(height: 5,),
                                            Wrap(
                                              children: [
                                                getText(
                                                    data: youCanCheckCode,
                                                    fontSize: 18,
                                                    color: Colors.white,
                                                    weight: FontWeight.normal),

                                                InkWell(
                                                  onTap: (){
                                                    _launchUrl(url: 'https://github.com/sumit024/password_validator');
                                                  },
                                                  child: getText(
                                                      data: here,
                                                      fontSize: 18,
                                                      color: Colors.white,
                                                      weight: FontWeight.normal,
                                                      decoration: TextDecoration.underline
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 20.h,),
                                            InkWell(
                                              onTap: (){
                                                _launchUrl(url: 'https://play.google.com/store/apps/details?id=com.wm.crispusdelivery');
                                              },
                                              child: getText(
                                                  data: crispusTeam,
                                                  fontSize: 20,
                                                  color: Colors.white,
                                                  decoration: TextDecoration.underline,
                                                  weight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 15.h,),
                                            getText(
                                                data: crispusTeamDesc,
                                                fontSize: 18,
                                                color: Colors.white,
                                                weight: FontWeight.normal),
                                            SizedBox(height: 20.h,),
                                            InkWell(
                                              onTap: (){
                                                _launchUrl(url: 'https://apps.apple.com/us/app/goods-ads/id1664772206');
                                              },
                                              child: getText(
                                                  data: goodsAds,
                                                  fontSize: 20,
                                                  color: Colors.white,
                                                  decoration: TextDecoration.underline,
                                                  weight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 15.h,),
                                            getText(
                                                data: goodsAdsDescription,
                                                fontSize: 18,
                                                color: Colors.white,
                                                weight: FontWeight.normal),
                                            const SizedBox(height: 5,),
                                            SizedBox(height: 60.h,),
                                            Center(
                                              child: getText(
                                                  data: hireMe,
                                                  fontSize: 22,
                                                  color: Colors.white,
                                                  weight: FontWeight.bold),
                                            ),
                                            SizedBox(height:40.h),
                                            Padding(
                                              padding:  EdgeInsets.symmetric(horizontal: 60.w),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  getSocialMediaIcon(path: 'gmail.png', iconType: SocialMediaIcon.gmail, toolTipMessage: 'Mail me'),
                                                  getSocialMediaIcon(path: 'whatsapp.png', iconType: SocialMediaIcon.whatsapp, toolTipMessage: 'Whatsapp'),
                                                  getSocialMediaIcon(path: 'call.png', iconType: SocialMediaIcon.call, toolTipMessage: 'Call me'),

                                                ],
                                              ),
                                            ),
                                            SizedBox(height:60.h),
                                            Center(
                                              child: getText(
                                                  data: copyRight,
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                  weight: FontWeight.normal),
                                            ),
                                          ],
                                        )),
                                  ])),)
                  ],
                ),
              ),
            ),
          ],
        ));
  }
  Future<void> _launchUrl({required String url}) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
  Widget getSocialMediaIcon(
      {required String path,
      required SocialMediaIcon iconType,
      required String toolTipMessage}) {
    return InkWell(
        onTap: () {
          String url='';
          switch (iconType) {
            case SocialMediaIcon.cv:
              {
                url='https://drive.google.com/file/d/1vvPdfBLXVcuhMZg4VXW--1shCm_dvhOp/view?usp=drivesdk';
                break;
              }
            case SocialMediaIcon.linkedin:
              url='https://www.linkedin.com/in/kushwahasumit';
              break;
            case SocialMediaIcon.github:
              url='https://github.com/sumit024';
              break;
            case SocialMediaIcon.gmail:
              String? encodeQueryParameters(Map<String, String> params) {
                return params.entries
                    .map((MapEntry<String, String> e) =>
                '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                    .join('&');
              }
// ···
              final Uri emailLaunchUri = Uri(
                scheme: 'mailto',
                path: 'kushwahasumit024@gmail.com',
                query: encodeQueryParameters(<String, String>{
                  'subject': 'Hey Sumit! ',
                }),
              );
              url=emailLaunchUri.toString();
              break;
            case SocialMediaIcon.whatsapp:
              url='https://wa.me/+918318913193?text=Hey Sumit';
              break;
            case SocialMediaIcon.call:
              url='tel:8318913193';
              break;
          }
          _launchUrl(url: url);
        },
        child: Tooltip(
            message: toolTipMessage,
            child: Image.asset(
              "assets/images/$path",
              height: 60.h,
              width: 60.h,
            )));
  }

  Widget skillsGridLayout({required int crossAxisCount, double? aspectRatio}) {
    return GridView.count(
        shrinkWrap: true,
        childAspectRatio: aspectRatio??1,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: crossAxisCount,
        children: List.generate(
          skillsList.length,
          (index) {
            return Container(
              decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(10)),
              margin: const EdgeInsets.all(10),
              child: Center(
                child: Text(
                  skillsList[index],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            );
          },
        ));
  }
}
