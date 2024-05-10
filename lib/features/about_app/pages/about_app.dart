import 'package:flutter/material.dart';
import 'package:schedule_of_residential_projects/core/extensions/size_config.dart';

class AboutAppPage extends StatelessWidget {
  const AboutAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: MediaQuery(
        data: MediaQuery.of(context).copyWith(
          textScaleFactor: SizeConfig.textScaleFactor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 110,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                  )),
              child: Text(
                "عن تطبيق حساب الجدول الزمني للمشاريع السكنية",
                style: TextStyle(
                    // height: 3.h,
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold),
                //  textAlign: TextAlign.justify,
              ),
            ),
            Expanded(
              child: Scrollbar(
                //controller: scrollControllerverticalHorizontlCtrl,
                thumbVisibility: true,
                //trackVisibility: true,
                thickness: 5.sp,
                radius: Radius.circular(20.sp),
                scrollbarOrientation: ScrollbarOrientation.right,
                child: SingleChildScrollView(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'المقدمة',
                            style: TextStyle(
                                // height: 3.h,
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.8),
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.justify,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            '''مجرد نص''',
                            style: TextStyle(
                                //  height: 2.h,
                                fontSize: 16.sp),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                      SizedBox(height: 15.h),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'الإرشادات',
                            style: TextStyle(
                                // height: 3.h,
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.8),
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.justify,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            '''مجرد نص''',
                            style: TextStyle(
                                //  height: 2.h,
                                fontSize: 16.sp),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                      SizedBox(height: 15.h),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'فريق العمل',
                            style: TextStyle(
                                // height: 3.h,
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.8),
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.justify,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          RichText(
                            text: TextSpan(
                                text: 'اسم الدكتور: ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Almarai',
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'سعيد عمر بالبيد',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'Almarai',
                                      )),
                                ]),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          RichText(
                            text: TextSpan(
                                text: 'أسماء أعضاء القروب:\n',
                                style: TextStyle(
                                  color: Colors.black,
                                  height: 1.5,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Almarai',
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: '''
            أسامة خالد باشامخة.
            حسن سعيد ربيع باغزال.
            عبدالرحمن خالد التميمي.
            عمر طالب بن شملان.
            فريد محسن التميمي.
            مهند محمد التميمي.                       
                ''',
                                      style: TextStyle(
                                        height: 1.7.h,
                                        color: Colors.black,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'Almarai',
                                      )),
                                ]),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
