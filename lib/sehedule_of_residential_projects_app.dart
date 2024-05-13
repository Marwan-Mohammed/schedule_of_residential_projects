import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:schedule_of_residential_projects/core/extensions/size_config.dart';
import 'package:schedule_of_residential_projects/features/instructions/pages/instructions_page.dart';

import 'features/about_app/pages/about_app_page.dart';
import 'features/home/pages/home_page.dart';
import 'features/who_we/pages/who_we_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late double xOffset;
  late double yOffset;
  late double scaleFactor;
  late bool isDrawerOpen;
  DrawerItem item = DrawerItems.scheduleCalucate;
  bool isDragging = false;
  void openDrawer() => setState(() {
        xOffset = -70.w;
        yOffset = 150.h;
        scaleFactor = 0.6;
        isDrawerOpen = true;
      });
  void closeDrawer() => setState(() {
        xOffset = 0;
        yOffset = 0;
        scaleFactor = 1;
        isDrawerOpen = false;
      });
  @override
  void initState() {
    closeDrawer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          statusBarColor: Colors.white.withOpacity(0.0),
          statusBarIconBrightness: Brightness.light),
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Stack(children: [
          buildDrawer(),
          buildPage(),
        ]),
      ),
    );
  }

  Widget buildDrawer() {
    return SafeArea(
        child: SizedBox(
      width: 230.w,
      child: DrawerWidget(
        onSelectedItem: (item) {
          switch (item) {
            case DrawerItems.shareApp || DrawerItems.connect:
              //share pop
              return;
            default:
              setState(() {
                this.item = item;
              });
              closeDrawer();
          }
        },
      ),
    ));
  }

  Widget buildPage() {
    return WillPopScope(
      onWillPop: () async {
        if (isDrawerOpen) {
          closeDrawer();
          return false;
        } else {
          return true;
        }
      },
      child: GestureDetector(
        onTap: closeDrawer,
        onHorizontalDragStart: (details) => isDragging = true,
        onHorizontalDragUpdate: (details) {
          if (!isDragging) return;

          const delta = 1;
          if (details.delta.dx > delta) {
            openDrawer();
          } else if (details.delta.dx < -delta) {
            closeDrawer();
          }
          isDragging = false;
        },
        child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            transform: Matrix4.translationValues(xOffset, yOffset, 0)
              ..scale(scaleFactor),
            child: AbsorbPointer(
              absorbing: isDrawerOpen,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(isDrawerOpen ? 20 : 0),
                child: Container(
                  color: isDrawerOpen
                      ? Colors.white12
                      : Theme.of(context).primaryColor,
                  child: getDrawerPage(),
                ),
              ),
            )),
      ),
    );
  }

  Widget getDrawerPage() {
    switch (item) {
      case DrawerItems.instructions:
        return InstructionsPage(
          openDrawer: openDrawer,
        );
      case DrawerItems.aboutApp:
        return AboutAppPage(
          openDrawer: openDrawer,
        );
      case DrawerItems.whoWe:
        return WhoWePage(
          openDrawer: openDrawer,
        );
      default:
        return HomePage(
          openDrawer: openDrawer,
        );
    }
  }
}

class DrawerWidget extends StatelessWidget {
  final ValueChanged<DrawerItem> onSelectedItem;
  const DrawerWidget({super.key, required this.onSelectedItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 32, 16, 0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            buildDrawerItems(context),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                  color: Theme.of(context).secondaryHeaderColor,
                  shape: BoxShape.circle),
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                'assets/images/tazmin_logo1.png',
                width: 60.w,
                height: 60.h,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDrawerItems(BuildContext context) {
    return Column(
      children: DrawerItems.all
          .map((e) => ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
                leading: Icon(
                  e.icon,
                  color: Colors.white,
                ),
                title: Text(
                  e.title,
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                ),
                onTap: () => onSelectedItem(e),
              ))
          .toList(),
    );
  }
}

class DrawerItem {
  final String title;
  final IconData icon;
  const DrawerItem({required this.title, required this.icon});
}

class DrawerItems {
  static const scheduleCalucate =
      DrawerItem(title: 'حساب الجدول الزمني', icon: Icons.timelapse);
  static const instructions =
      DrawerItem(title: 'إرشادات', icon: Icons.integration_instructions);
  static const aboutApp =
      DrawerItem(title: 'عن التطبيق', icon: CupertinoIcons.info_circle);
  static const whoWe = DrawerItem(
    title: 'من نحن',
    icon: Icons.contact_support_rounded,
  );
  static const connect =
      DrawerItem(title: 'تواصل معنا', icon: CupertinoIcons.phone);
  static const shareApp =
      DrawerItem(title: 'مشاركة التطبيق', icon: Icons.share);
  static final List<DrawerItem> all = [
    scheduleCalucate,
    instructions,
    aboutApp,
    whoWe,
    connect,
    shareApp
  ];
}

// class HomPage extends StatelessWidget {
//   final VoidCallback openDrawer;
//   const HomPage({super.key, required this.openDrawer});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.transparent,
//       appBar: AppBar(
//         leading: DrawMenuWidget(
//           onClicked: openDrawer,
//         ),
//         backgroundColor: Colors.transparent,
//         title: const Text('Hom page'),
//       ),
//     );
//   }
// }

// class DrawMenuWidget extends StatelessWidget {
//   final VoidCallback onClicked;
//   const DrawMenuWidget({super.key, required this.onClicked});

//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//         onPressed: onClicked,
//         icon: const Icon(
//           Icons.menu,
//           color: Colors.white,
//         ));
//   }
// }
