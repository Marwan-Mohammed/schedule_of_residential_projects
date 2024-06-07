import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:schedule_of_residential_projects/core/extensions/size_config.dart';
import 'package:url_launcher/url_launcher.dart';

class ConnectUsPage extends StatelessWidget {
  final VoidCallback openDrawer;
  const ConnectUsPage({super.key, required this.openDrawer});
  void launchWhatsapp({required phoneNumber}) async {
    String url = 'whatsapp://send?phone=$phoneNumber&text=' '';
    await launchUrl(Uri.parse(url));
  }

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
                        'تواصل معنا',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'مرحبًا بك مجددًا.',
                        style: TextStyle(height: 2.h, fontSize: 16.sp),
                      ),
                      Text(
                        'نحن هنا لخدمتك، لا تتردد في الاتصال بنا إذا كان هناك أي شيء يمكننا مساعدتك به.',
                        style: TextStyle(height: 2.h, fontSize: 16.sp),
                        // textAlign: TextAlign.justify,
                      ),
                      Text(
                        'فريقنا مستعد دائمًا لمساعدتك لضمان تجربة استخدام سلسة ومرضية.',
                        style: TextStyle(height: 2.h, fontSize: 16.sp),
                        //textAlign: TextAlign.justify,
                      ),
                      Wrap(
                        spacing: 15.w,
                        // runSpacing: 5.h,
                        children: [
                          Text(
                            'تواصل معنا عبر البريد الالكتروني',
                            style: TextStyle(height: 2.h, fontSize: 16.sp),
                            //textAlign: TextAlign.justify,
                          ),
                          InkWell(
                              onTap: () async {
                                String url = 'mailto:tazmin6pp@gmail.com';
                                await launchUrl(Uri.parse(url));
                              },
                              child: Text(
                                '(tazmin6pp@gmail.com)',
                                style: TextStyle(
                                    height: 2.h,
                                    fontSize: 16.sp,
                                    color: Colors.blue),
                              ))
                        ],
                      ),
                      Text(
                        'فريق الدعم :',
                        style: TextStyle(height: 2.h, fontSize: 16.sp),
                        //textAlign: TextAlign.justify,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Wrap(
                        spacing: 15.w,
                        // runSpacing: 5.h,
                        children: [
                          Text(
                            'م.أسامه خالد باشامخة',
                            style: TextStyle(height: 2.h, fontSize: 16.sp),
                            //textAlign: TextAlign.justify,
                          ),
                          InkWell(
                              onTap: () {
                                launchWhatsapp(
                                  phoneNumber: '+967771438063',
                                );
                              },
                              child: Text(
                                '00967-771438063',
                                style: TextStyle(
                                    height: 2.h,
                                    fontSize: 16.sp,
                                    color: Colors.blue),
                                // textAlign: TextAlign.justify,
                              ))
                        ],
                      ),
                      Wrap(
                        spacing: 15.w,
                        // runSpacing: 5.h,
                        children: [
                          Text(
                            'م.حسن سعيد باغزال',
                            style: TextStyle(
                              height: 2.h,
                              fontSize: 16.sp,
                            ),
                            //  textAlign: TextAlign.justify,
                          ),
                          InkWell(
                              onTap: () {
                                launchWhatsapp(phoneNumber: '+967771675972');
                              },
                              child: Text(
                                '00967-771675972',
                                style: TextStyle(
                                    height: 2.h,
                                    fontSize: 16.sp,
                                    color: Colors.blue),
                                // textAlign: TextAlign.justify,
                              ))
                        ],
                      ),
                      Wrap(
                        spacing: 15.w,
                        // runSpacing: 5.h,
                        children: [
                          Text(
                            'م.عبدالرحمن خالد التميمي',
                            style: TextStyle(height: 2.h, fontSize: 16.sp),
                            //  textAlign: TextAlign.justify,
                          ),
                          InkWell(
                              onTap: () {
                                launchWhatsapp(phoneNumber: '+967772323371');
                              },
                              child: Text(
                                '00967-772323371',
                                style: TextStyle(
                                    height: 2.h,
                                    fontSize: 16.sp,
                                    color: Colors.blue),
                                //  textAlign: TextAlign.justify,
                              ))
                        ],
                      ),
                      Wrap(
                        spacing: 15.w,
                        // runSpacing: 5.h,
                        children: [
                          Text(
                            'م.عمر طالب بن شملان',
                            style: TextStyle(height: 2.h, fontSize: 16.sp),
                            //textAlign: TextAlign.justify,
                          ),
                          InkWell(
                              onTap: () {
                                launchWhatsapp(phoneNumber: '+967778297914');
                              },
                              child: Text(
                                '00967-778297914',
                                style: TextStyle(
                                    height: 2.h,
                                    fontSize: 16.sp,
                                    color: Colors.blue),
                                // textAlign: TextAlign.justify,
                              ))
                        ],
                      ),
                      Wrap(
                        spacing: 15.w,
                        // runSpacing: 5.h,
                        children: [
                          Text(
                            'م.فريد محسن التميمي',
                            style: TextStyle(height: 2.h, fontSize: 16.sp),
                            // textAlign: TextAlign.justify,
                          ),
                          InkWell(
                              onTap: () {
                                launchWhatsapp(phoneNumber: '+967775195053');
                              },
                              child: Text(
                                '00967-775195053',
                                style: TextStyle(
                                    height: 2.h,
                                    fontSize: 16.sp,
                                    color: Colors.blue),
                                // textAlign: TextAlign.justify,
                              ))
                        ],
                      ),
                      Wrap(
                        spacing: 15.w,
                        // runSpacing: 5.h,
                        children: [
                          Text(
                            'م.مهند محمد التميمي',
                            style: TextStyle(height: 2.h, fontSize: 16.sp),
                            //textAlign: TextAlign.justify,
                          ),
                          InkWell(
                              onTap: () {
                                launchWhatsapp(phoneNumber: '+967737608782');
                              },
                              child: Text(
                                '00967-737608782',
                                style: TextStyle(
                                    height: 2.h,
                                    fontSize: 16.sp,
                                    color: Colors.blue),
                                // textAlign: TextAlign.justify,
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
