import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sumit_portfolio/values/enums.dart';
import 'package:sumit_portfolio/values/strings.dart';
import 'package:sumit_portfolio/utility/responsive.dart';
import 'package:sumit_portfolio/widgets/common_widgets.dart';
import 'package:sumit_portfolio/widgets/my_animated_text.dart';
import 'package:sumit_portfolio/widgets/skills_grid.dart';
import 'package:sumit_portfolio/widgets/social_media_icon.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showName = false;
  double height = 0.0;
  double width = 0.0;

  @override
  void didChangeDependencies() {
    height = MediaQuery.sizeOf(context).height;
    width = MediaQuery.sizeOf(context).width;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
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
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyAnimatedText(
                              text: helloWorld,
                              onAnimationFinished: () {
                                setState(() {
                                  _showName = true;
                                });
                              },
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            if (_showName)
                              Responsive(
                                desktop: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    MyAnimatedText(
                                      text: nameWithPosition,
                                      onAnimationFinished: () {},
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 40),
                                      child: Column(
                                        children: [
                                          _buildResumeIcon(),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          _buildLinkedInIcon(),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          _buildGitHubIcon(),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                mobile: _buildName(),
                                tablet: _buildName(),
                              )
                          ],
                        ),
                      )
                    ],
                  ),
                  if (_showName)
                    Responsive(
                      desktop: _buildDesktopLayout(width),
                      mobile: _buildMobileLayout(),
                      tablet: _buildTabletLayout(),
                    )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildName() {
    return getText(
      data: name,
      fontSize: 32,
      color: Colors.white,
      weight: FontWeight.bold,
    );
  }

  Padding _buildTabletLayout() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 30.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDesignation(),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 60.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                _buildResumeIcon(),
                const SizedBox(
                  height: 30,
                ),
                _buildLinkedInIcon(),
                const SizedBox(
                  height: 30,
                ),
                _buildGitHubIcon(),
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
            weight: FontWeight.bold,
          ),
          SizedBox(
            height: 20.h,
          ),
          _buildAboutMeText(),
          SizedBox(
            height: 40.h,
          ),
          _buildSkillSetText(),
          const SkillsGrid(
            crossAxisCount: 3,
          ),
          const SkillsGrid(crossAxisCount: 3),
          _buildMyWorkAndFooterSection(),
        ],
      ),
    );
  }

  Widget _buildSkillSetText() {
    return getText(
      data: skillSet,
      fontSize: 22,
      color: Colors.white,
      weight: FontWeight.bold,
    );
  }

  Widget _buildAboutMeText() {
    return getText(
      data: aboutMe,
      fontSize: 18,
      color: Colors.white,
      weight: FontWeight.normal,
    );
  }

  Center _buildDesignation() {
    return Center(
      child: getText(
        data: position,
        fontSize: 22,
        color: Colors.white,
        weight: FontWeight.bold,
      ),
    );
  }

  Padding _buildMobileLayout() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 30.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDesignation(),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 60.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                _buildResumeIcon(),
                const SizedBox(
                  height: 30,
                ),
                _buildLinkedInIcon(),
                const SizedBox(
                  height: 30,
                ),
                _buildGitHubIcon(),
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
            weight: FontWeight.bold,
          ),
          SizedBox(
            height: 20.h,
          ),
          _buildAboutMeText(),
          SizedBox(
            height: 40.h,
          ),
          _buildSkillSetText(),
          const SkillsGrid(crossAxisCount: 3),
          _buildMyWorkAndFooterSection(),
        ],
      ),
    );
  }

  Padding _buildDesktopLayout(double width) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getText(
                data: aboutSumit,
                fontSize: 22,
                color: Colors.white,
                weight: FontWeight.bold,
              ),
              SizedBox(
                height: 20.h,
              ),
              _buildAboutMeText(),
              SizedBox(
                height: 40.h,
              ),
              _buildSkillSetText(),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
          const SkillsGrid(
            crossAxisCount: 4,
            aspectRatio: 2.5,
          ),
          _buildMyWorkAndFooterSection(),
        ],
      ),
    );
  }

  Widget _buildMyWorkAndFooterSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getText(
          data: myWork,
          fontSize: 22,
          color: Colors.white,
          weight: FontWeight.bold,
        ),
        SizedBox(
          height: 20.h,
        ),
        InkWell(
          onTap: () {
            _launchUrl(
              url: 'https://pub.dev/packages/password_strength_validator',
            );
          },
          child: getText(
            data: passwordStrengthValidator,
            fontSize: 20,
            color: Colors.white,
            decoration: TextDecoration.underline,
            weight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        getText(
          data: packageDesc,
          fontSize: 18,
          color: Colors.white,
          weight: FontWeight.normal,
        ),
        const SizedBox(
          height: 5,
        ),
        Wrap(
          children: [
            getText(
              data: youCanCheckCode,
              fontSize: 18,
              color: Colors.white,
              weight: FontWeight.normal,
            ),
            InkWell(
              onTap: () {
                _launchUrl(
                  url: 'https://github.com/sumit024/password_validator',
                );
              },
              child: getText(
                data: here,
                fontSize: 18,
                color: Colors.white,
                weight: FontWeight.normal,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        InkWell(
          onTap: () {
            _launchUrl(
              url:
                  'https://play.google.com/store/apps/details?id=com.wm.crispusdelivery',
            );
          },
          child: getText(
            data: crispusTeam,
            fontSize: 20,
            color: Colors.white,
            decoration: TextDecoration.underline,
            weight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        getText(
          data: crispusTeamDesc,
          fontSize: 18,
          color: Colors.white,
          weight: FontWeight.normal,
        ),
        SizedBox(
          height: 20.h,
        ),
        InkWell(
          onTap: () {
            _launchUrl(
              url: 'https://apps.apple.com/us/app/goods-ads/id1664772206',
            );
          },
          child: getText(
            data: goodsAds,
            fontSize: 20,
            color: Colors.white,
            decoration: TextDecoration.underline,
            weight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        getText(
          data: goodsAdsDescription,
          fontSize: 18,
          color: Colors.white,
          weight: FontWeight.normal,
        ),
        SizedBox(
          height: 20.h,
        ),
        InkWell(
          onTap: () {
            _launchUrl(
              url:
                  'https://play.google.com/store/apps/details?id=com.legistify.legistifyapp&hl=en_IN',
            );
          },
          child: getText(
            data: legistify,
            fontSize: 20,
            color: Colors.white,
            decoration: TextDecoration.underline,
            weight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        getText(
          data: legistifyDescription,
          fontSize: 18,
          color: Colors.white,
          weight: FontWeight.normal,
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 60.h,
        ),
        Center(
          child: getText(
            data: hireMe,
            fontSize: 22,
            color: Colors.white,
            weight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 40.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 60.w),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildGmailLogo(),
              _buildWhatsappLogo(),
              _buildCallLogo(),
            ],
          ),
        ),
        SizedBox(height: 40.h),
        Center(
          child: getText(
            data: copyRight,
            fontSize: 16,
            color: Colors.white,
            weight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 40.h),
      ],
    );
  }

  Widget _buildCallLogo() {
    return const SocialMediaIcon(
      path: 'call.png',
      iconType: SocialMediaIconEnum.call,
      toolTipMessage: 'Call me',
    );
  }

  Widget _buildWhatsappLogo() {
    return const SocialMediaIcon(
      path: 'whatsapp.png',
      iconType: SocialMediaIconEnum.whatsapp,
      toolTipMessage: 'Whatsapp',
    );
  }

  Widget _buildGmailLogo() {
    return const SocialMediaIcon(
      path: 'gmail.png',
      iconType: SocialMediaIconEnum.gmail,
      toolTipMessage: 'Mail me',
    );
  }

  Future<void> _launchUrl({required String url}) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  Widget _buildResumeIcon() {
    return const SocialMediaIcon(
      path: 'cv.png',
      iconType: SocialMediaIconEnum.cv,
      toolTipMessage: viewResume,
    );
  }

  Widget _buildLinkedInIcon() {
    return const SocialMediaIcon(
      path: 'linkedin.png',
      iconType: SocialMediaIconEnum.linkedin,
      toolTipMessage: linkedIn,
    );
  }

  Widget _buildGitHubIcon() {
    return const SocialMediaIcon(
      path: 'github.png',
      iconType: SocialMediaIconEnum.github,
      toolTipMessage: github,
    );
  }
}
