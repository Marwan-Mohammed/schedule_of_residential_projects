import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:schedule_of_residential_projects/core/extensions/size_config.dart';

class InstructionsPage extends StatelessWidget {
  final VoidCallback openDrawer;
  const InstructionsPage({super.key, required this.openDrawer});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          statusBarColor: Colors.white.withOpacity(0.0),
          statusBarIconBrightness: Brightness.dark),
      child: Scaffold(
        backgroundColor: const Color(0xFFEBE4DA),
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
                height: 100,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () => openDrawer(),
                      icon: Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: 30.sp,
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Expanded(
                      child: Text(
                        'الإرشادات',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              // Expanded(
              //   child: SingleChildScrollView(
              //     padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              //     child: Column(
              //       mainAxisAlignment: MainAxisAlignment.start,
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Column(
              //           mainAxisAlignment: MainAxisAlignment.start,
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Text(
              //               'المقدمة',
              //               style: TextStyle(
              //                   // height: 3.h,
              //                   color: Theme.of(context)
              //                       .primaryColor
              //                       .withOpacity(0.8),
              //                   fontSize: 18.sp,
              //                   fontWeight: FontWeight.bold),
              //               textAlign: TextAlign.justify,
              //             ),
              //             SizedBox(
              //               height: 10.h,
              //             ),
              //             Text(
              //               '''مجرد نص''',
              //               style: TextStyle(
              //                   //  height: 2.h,
              //                   fontSize: 16.sp),
              //               textAlign: TextAlign.justify,
              //             ),
              //           ],
              //         ),
              //         SizedBox(height: 15.h),
              //         Column(
              //           mainAxisAlignment: MainAxisAlignment.start,
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Text(
              //               'الإرشادات',
              //               style: TextStyle(
              //                   // height: 3.h,
              //                   color: Theme.of(context)
              //                       .primaryColor
              //                       .withOpacity(0.8),
              //                   fontSize: 18,
              //                   fontWeight: FontWeight.bold),
              //               textAlign: TextAlign.justify,
              //             ),
              //             SizedBox(
              //               height: 10.h,
              //             ),
              //             Text(
              //               '''مجرد نص''',
              //               style: TextStyle(
              //                   //  height: 2.h,
              //                   fontSize: 16.sp),
              //               textAlign: TextAlign.justify,
              //             ),
              //           ],
              //         ),
              //         SizedBox(height: 15.h),
              //         Column(
              //           mainAxisAlignment: MainAxisAlignment.start,
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Text(
              //               'فريق العمل',
              //               style: TextStyle(
              //                   // height: 3.h,
              //                   color: Theme.of(context)
              //                       .primaryColor
              //                       .withOpacity(0.8),
              //                   fontSize: 18.sp,
              //                   fontWeight: FontWeight.bold),
              //               textAlign: TextAlign.justify,
              //             ),
              //             SizedBox(
              //               height: 10.h,
              //             ),
              //             RichText(
              //               text: TextSpan(
              //                   text: 'اسم الدكتور: ',
              //                   style: TextStyle(
              //                     color: Colors.black,
              //                     fontSize: 16.sp,
              //                     fontWeight: FontWeight.bold,
              //                     fontFamily: 'Almarai',
              //                   ),
              //                   children: <TextSpan>[
              //                     TextSpan(
              //                         text: 'سعيد عمر بالبيد',
              //                         style: TextStyle(
              //                           color: Colors.black,
              //                           fontSize: 16.sp,
              //                           fontWeight: FontWeight.normal,
              //                           fontFamily: 'Almarai',
              //                         )),
              //                   ]),
              //             ),
              //             SizedBox(
              //               height: 15.h,
              //             ),
              //             RichText(
              //               text: TextSpan(
              //                   text: 'أسماء أعضاء القروب:\n',
              //                   style: TextStyle(
              //                     color: Colors.black,
              //                     height: 1.5,
              //                     fontSize: 16.sp,
              //                     fontWeight: FontWeight.bold,
              //                     fontFamily: 'Almarai',
              //                   ),
              //                   children: <TextSpan>[
              //                     TextSpan(
              //                         text: '''
              // أسامة خالد باشامخة.
              // حسن سعيد ربيع باغزال.
              // عبدالرحمن خالد التميمي.
              // عمر طالب بن شملان.
              // فريد محسن التميمي.
              // مهند محمد التميمي.
              //   ''',
              //                         style: TextStyle(
              //                           height: 1.7.h,
              //                           color: Colors.black,
              //                           fontSize: 16.sp,
              //                           fontWeight: FontWeight.normal,
              //                           fontFamily: 'Almarai',
              //                         )),
              //                   ]),
              //             ),
              //           ],
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        )),
      ),
    );
  }
}
