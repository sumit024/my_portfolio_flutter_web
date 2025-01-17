import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sumit_portfolio/values/enums.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaIcon extends StatelessWidget {
  final String path;
  final SocialMediaIconEnum iconType;
  final String toolTipMessage;

  const SocialMediaIcon({
    required this.path,
    required this.iconType,
    required this.toolTipMessage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        String url = '';
        switch (iconType) {
          case SocialMediaIconEnum.cv:
            {
              url =
                  'https://drive.google.com/file/d/1vvPdfBLXVcuhMZg4VXW--1shCm_dvhOp/view?usp=drivesdk';
              break;
            }
          case SocialMediaIconEnum.linkedin:
            url = 'https://www.linkedin.com/in/kushwahasumit';
            break;
          case SocialMediaIconEnum.github:
            url = 'https://github.com/sumit024';
            break;
          case SocialMediaIconEnum.gmail:
            String? encodeQueryParameters(Map<String, String> params) {
              return params.entries
                  .map((MapEntry<String, String> e) =>
                      '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                  .join('&');
            }
            final Uri emailLaunchUri = Uri(
              scheme: 'mailto',
              path: 'kushwahasumit024@gmail.com',
              query: encodeQueryParameters(<String, String>{
                'subject': 'Hey Sumit! ',
              }),
            );
            url = emailLaunchUri.toString();
            break;
          case SocialMediaIconEnum.whatsapp:
            url = 'https://wa.me/+918318913193?text=Hey Sumit';
            break;
          case SocialMediaIconEnum.call:
            url = 'tel:8318913193';
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
        ),
      ),
    );
  }

  Future<void> _launchUrl({required String url}) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
}
