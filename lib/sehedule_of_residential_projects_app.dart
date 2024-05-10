import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schedule_of_residential_projects/core/extensions/size_config.dart';

import 'features/about_app/pages/about_app.dart';
import 'features/home/pages/home_page.dart';

class SeceduleOfResidentialProgectsApp extends StatefulWidget {
  const SeceduleOfResidentialProgectsApp({super.key});

  @override
  State<SeceduleOfResidentialProgectsApp> createState() =>
      _SeceduleOfResidentialProgectsAppState();
}

class _SeceduleOfResidentialProgectsAppState
    extends State<SeceduleOfResidentialProgectsApp> {
  int _currentIndex = 0;
  List<Widget> pages = [
    const HomePage(),
    const AboutAppPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        clipBehavior: Clip.antiAlias,
        shape: const CircularNotchedRectangle(),
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        height: 70.h,
        //color: Colors.cyan.shade400,
        notchMargin: 5,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                icon: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.home,
                        color: _currentIndex == 0
                            ? Theme.of(context).primaryColor
                            : const Color(0xFF90A4AE),
                      ),
                      Text('الرئيسية',
                          style: _currentIndex == 0
                              ? TextStyle(
                                  fontSize: 16.sp,
                                  fontFamily: 'Almarai',
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w600)
                              : TextStyle(
                                  fontSize: 16.sp,
                                  color: const Color(0xFF90A4AE),
                                  fontWeight: FontWeight.w500),
                          textScaleFactor: SizeConfig.textScaleFactor)
                    ]),
                onPressed: () {
                  setState(() {
                    _currentIndex = 0;
                  });
                }),
            IconButton(
                icon: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.contact_support_rounded,
                        color: _currentIndex == 1
                            ? Theme.of(context).primaryColor
                            : const Color(0xFF90A4AE),
                      ),
                      Text('عن التطبيق',
                          style: _currentIndex == 1
                              ? TextStyle(
                                  fontSize: 16.sp,
                                  fontFamily: 'Almarai',
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w600)
                              : TextStyle(
                                  fontSize: 16.sp,
                                  fontFamily: 'Almarai',
                                  color: const Color(0xFF90A4AE),
                                  fontWeight: FontWeight.w500),
                          textScaleFactor: SizeConfig.textScaleFactor)
                    ]),
                onPressed: () {
                  setState(() {
                    _currentIndex = 1;
                  });
                }),
          ],
        ),
      ),
    );
  }
}
