import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:schedule_of_residential_projects/core/extensions/size_config.dart';

class ConnectUsPage extends StatelessWidget {
  final VoidCallback openDrawer;
  const ConnectUsPage({super.key, required this.openDrawer});

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
                  child: Text(
                    '''مرحبًا بك مجددًا. 
نحن هنا لخدمتك، لا تتردد في الاتصال بنا إذا كان هناك أي شيء يمكننا مساعدتك به.
فريقنا مستعد دائمًا لمساعدتك لضمان تجربة استخدام سلسة ومرضية.

تواصل معنا عبر البريد الالكتروني ()

فريق الدعم :
- م.اسامه خالد باشامخة (771438063-00967)
- م.حسن سعيد باغزال (771675972-00967)
- م.عبدالحمن خالد التميمي (772323371-00967)
- م.عمر طالب بن شملان (778297914-00967)
- م.فريد محسن التميمي (775195053-00967)
- م.مهند محمد التميمي(737608782-00967)''',
                    style: TextStyle(height: 2.h, fontSize: 16.sp),
                    textAlign: TextAlign.justify,
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
