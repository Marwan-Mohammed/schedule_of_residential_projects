import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:schedule_of_residential_projects/core/extensions/size_config.dart';

class AboutAppPage extends StatelessWidget {
  final VoidCallback openDrawer;
  const AboutAppPage({super.key, required this.openDrawer});

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
                        'عن التطبيق',
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
                    '''(مرحبًا بكم في تطبيق تزمين،

نحن في تزمين نفخر بتقديم أداة مبتكرة تساعدكم في تقدير الجدول الزمني لمشاريعكم الإنشائية بكل سهولة. 
يعتمد تطبيقنا على أحدث الأساليب الحسابية لتوفير تقديرات تقريبية تساعدكم في التخطيط لتحقيق أفضل النتائج. 

مع تزمين، ستتمتعون بالمزايا التالية:

- تقديرات سريعة للجداول الزمنية.
- واجهة مستخدم بديهية وسهلة الاستخدام.
- تحليلات مفصلة لمراحل المشروع المختلفة.
- دعم فني مستمر لضمان أفضل تجربة ممكنة.

نشكركم على اختيار تزمين، ونتطلع إلى أن نكون جزءًا من نجاح مشاريعكم.

أطيب التحيات،
فريق تزمين)''',
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
