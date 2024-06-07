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
              Expanded(
                child: SingleChildScrollView(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                  child: Text(
                    '''- التطبيق معد لحساب الجدول الزمني للمباني السكنية ( اعمال العظم )
- البرنامج يحسب الجدول الزمني حتى لخمسه ادوار. 
- إماكنية إخراج التقرير على صورة ملف Pdf. 
- ادخال مساحة البناء وليست مساحة الارض.
-فترة الانتظار اخذت كفترة تقريبية وممكن ان تختلف من مشروع لاخر.
-بزيادة عدد العمالة يمكنك تقليص الفترة الزمنية للبند.''',
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
