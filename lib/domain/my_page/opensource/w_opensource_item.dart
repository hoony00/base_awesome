import 'package:myfeelings/common/data/index/index.dart';
import 'package:myfeelings/domain/my_page/opensource/vo_package.dart';
import 'package:url_launcher/url_launcher.dart';

class OpensourceItem extends StatelessWidget {
  final Package package;

  const OpensourceItem(this.package, {super.key});

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 20.h,
        bottom: 15.w,
      ),
      color: AppColor.scaffoldBackgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          package.name.text
              .size(20.sp)
              .bold
              .make()
              .pOnly(left: 20.w, bottom: 8.h),
          package.description.text
              .size(14.sp)
              .make()
              .pOnly(left: 20.w, bottom: 8.h, right: 20.w),
          if (package.authors.isNotEmpty)
            (package.authors.join(", "))
                .text
                .size(14)
                .make()
                .pOnly(left: 20.w, top: 12.h),
          GestureDetector(
              onTap: () async {
                if (package.homepage == null) {
                  return;
                }
                _launchInBrowser(Uri.parse(package.homepage ?? ""));
              },
              child: Text(package.homepage ?? '',
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColor.primary,
                          decoration: TextDecoration.underline, decorationColor: AppColor.primary))
                  .pOnly(left: 20.w, top: 15.h)),
          Container(
            decoration: BoxDecoration(
                color: AppColor.whiteOriginBox,
                border: Border.all(color: AppColor.grey),
                borderRadius: BorderRadius.circular(4)),
            margin: EdgeInsets.only(left: 20.w, top: 10.h, right: 20.w),
            padding: EdgeInsets.all(10.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  (package.license ?? "").text.make(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
