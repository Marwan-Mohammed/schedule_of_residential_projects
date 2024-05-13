import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:schedule_of_residential_projects/core/extensions/size_config.dart';

import '../../../core/constants_methods.dart';
import '../../../sehedule_of_residential_projects_app.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
            statusBarColor: Colors.white.withOpacity(0.0),
            statusBarIconBrightness: Brightness.dark),
        child: Scaffold(
          backgroundColor: const Color(0xFFEBE4DA),
          body: SafeArea(
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    //  mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40.w),
                        child: Text(
                          'أعد جدولك الزمني معنا',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30.sp,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context, createRoute(const MainPage()));
                          },
                          icon: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 7.w, vertical: 7.h),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: Theme.of(context).primaryColor)),
                            child: Icon(
                              Icons.arrow_forward,
                              color: Theme.of(context).primaryColor,
                              size: 30.sp,
                            ),
                          )),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    'assets/images/tazmin_logo3.png',
                    width: 150.w,
                    height: 150.h,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
