import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:schedule_of_residential_projects/core/extensions/size_config.dart';

import '../widgets/custom_radio_list_tile.dart';
import '../widgets/field_label.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController lengthCtrl = TextEditingController();
  TextEditingController widthCtrl = TextEditingController();
  TextEditingController heightCtrl = TextEditingController();
  TextEditingController supplementAreaCtrl = TextEditingController();
  TextEditingController ownerCtrl = TextEditingController();
  TextEditingController repeatedFloorAreaCtrl = TextEditingController();
  int? floorNogroupVal;
  double? soilTypegroupVal;
  bool? isHavegroupVal;
  int? floorAppearancegroupVal;

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
                "حساب الجدول الزمني للمشاريع السكنية",
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
                  child: Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //length label and field start
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const FieldLabel(
                              label: 'الطول (م)',
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            TextFormField(
                              controller: lengthCtrl,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              onTap: () {},
                              //onChanged: (value) {},
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true, signed: false),

                              textInputAction: TextInputAction.done,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r"[0-9.]")),
                                TextInputFormatter.withFunction(
                                    (oldValue, newValue) {
                                  final text = newValue.text;
                                  return text.isEmpty
                                      ? newValue
                                      : double.tryParse(text) == null
                                          ? oldValue
                                          : newValue;
                                }),
                              ],
                              showCursor: true,
                              readOnly: false,

                              // onFieldSubmitted: (value) {},
                              onTapOutside: (event) =>
                                  FocusManager.instance.primaryFocus?.unfocus(),

                              decoration: InputDecoration(
                                hintText: 'الطول (م)',
                                hintStyle: TextStyle(
                                    fontSize: 16.sp,
                                    color: const Color(0xFF90A4AE),
                                    fontWeight: FontWeight.normal),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 5.h, horizontal: 15.w),
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(255, 189, 194, 242)
                                        .withOpacity(0.2),
                                enabledBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(24.0)),
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(24.0),
                                  borderSide: BorderSide.none,
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(24.0),
                                  borderSide: BorderSide.none,
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(24.0),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                        //length label and field end
                        SizedBox(
                          height: 15.h,
                        ),
                        //width label and field start
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const FieldLabel(
                              label: 'العرض (م)',
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            TextFormField(
                              controller: widthCtrl,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              onTap: () {},
                              //onChanged: (value) {},
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true, signed: false),

                              textInputAction: TextInputAction.done,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r"[0-9.]")),
                                TextInputFormatter.withFunction(
                                    (oldValue, newValue) {
                                  final text = newValue.text;
                                  return text.isEmpty
                                      ? newValue
                                      : double.tryParse(text) == null
                                          ? oldValue
                                          : newValue;
                                }),
                              ],
                              showCursor: true,
                              readOnly: false,

                              // onFieldSubmitted: (value) {},
                              onTapOutside: (event) =>
                                  FocusManager.instance.primaryFocus?.unfocus(),

                              decoration: InputDecoration(
                                hintText: 'العرض (م)',
                                hintStyle: TextStyle(
                                    fontSize: 16.sp,
                                    color: const Color(0xFF90A4AE),
                                    fontWeight: FontWeight.normal),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 5.h, horizontal: 15.w),
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(255, 189, 194, 242)
                                        .withOpacity(0.2),
                                enabledBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(24.0)),
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(24.0),
                                  borderSide: BorderSide.none,
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(24.0),
                                  borderSide: BorderSide.none,
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(24.0),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                        //width label and field end
                        SizedBox(
                          height: 15.h,
                        ),
                        //height label and field start
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const FieldLabel(
                              label: 'الإرتفاع (م)',
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            TextFormField(
                              controller: heightCtrl,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              onTap: () {},
                              //onChanged: (value) {},
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true, signed: false),

                              textInputAction: TextInputAction.done,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r"[0-9.]")),
                                TextInputFormatter.withFunction(
                                    (oldValue, newValue) {
                                  final text = newValue.text;
                                  return text.isEmpty
                                      ? newValue
                                      : double.tryParse(text) == null
                                          ? oldValue
                                          : newValue;
                                }),
                              ],
                              showCursor: true,
                              readOnly: false,

                              // onFieldSubmitted: (value) {},
                              onTapOutside: (event) =>
                                  FocusManager.instance.primaryFocus?.unfocus(),

                              decoration: InputDecoration(
                                hintText: 'الإرتفاع (م)',
                                hintStyle: TextStyle(
                                    fontSize: 16.sp,
                                    color: const Color(0xFF90A4AE),
                                    fontWeight: FontWeight.normal),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 5.h, horizontal: 15.w),
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(255, 189, 194, 242)
                                        .withOpacity(0.2),
                                enabledBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(24.0)),
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(24.0),
                                  borderSide: BorderSide.none,
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(24.0),
                                  borderSide: BorderSide.none,
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(24.0),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                        //height label and field end
                        SizedBox(
                          height: 15.h,
                        ),
                        //floors-number label and options start
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const FieldLabel(
                              label: 'عدد الأدوار',
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Wrap(
                              spacing: 20.w,
                              runSpacing: 20.h,
                              children: [
                                ...List.generate(
                                    5,
                                    (index) => CustomRadioListTile(
                                          title: index == 0
                                              ? '1 دور'
                                              : index == 1
                                                  ? '2 دور'
                                                  : index == 2
                                                      ? '3 دور'
                                                      : index == 3
                                                          ? '4 دور'
                                                          : '5 دور',
                                          value: index + 1,
                                          groupValue: floorNogroupVal,
                                          onTap: () {
                                            setState(() {
                                              floorNogroupVal = index + 1;
                                            });
                                          },
                                        )),
                              ],
                            )
                          ],
                        ),
                        //floors-number label and options end
                        SizedBox(
                          height: 15.h,
                        ),
                        //soil-type label and options start
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const FieldLabel(
                              label: 'نوع التربة',
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Wrap(
                              spacing: 20.w,
                              runSpacing: 20.h,
                              children: [
                                ...List.generate(
                                    2,
                                    (index) => CustomRadioListTile(
                                          title: index == 0 ? 'قوية' : 'متوسطة',
                                          value: index == 0 ? 0.02437 : 0.01716,
                                          groupValue: soilTypegroupVal,
                                          onTap: () {
                                            setState(() {
                                              soilTypegroupVal = index == 0
                                                  ? 0.02437
                                                  : 0.01716;
                                            });
                                          },
                                        )),
                              ],
                            )
                          ],
                        ),
                        //soil-type label and options end
                        SizedBox(
                          height: 15.h,
                        ),
                        //repeated floor area label and(field or options) start
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 10.h),
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.2),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const FieldLabel(
                                label: 'مساحة الدور المتكرر',
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                children: [
                                  Icon(Icons.contact_support_rounded,
                                      color: Theme.of(context).primaryColor),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Expanded(
                                    child: Text(
                                      'هل لديك مخططات كاملة؟',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 16.sp),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Wrap(
                                spacing: 20.w,
                                runSpacing: 20.h,
                                children: [
                                  ...List.generate(
                                      2,
                                      (index) => CustomRadioListTile(
                                            title: index == 0 ? 'نعم' : 'لا',
                                            value: index == 0 ? true : false,
                                            groupValue: isHavegroupVal,
                                            onTap: () {
                                              setState(() {
                                                isHavegroupVal =
                                                    index == 0 ? true : false;
                                                if (isHavegroupVal == true) {
                                                  floorAppearancegroupVal =
                                                      null;
                                                } else if (isHavegroupVal ==
                                                    false) {
                                                  repeatedFloorAreaCtrl.clear();
                                                }
                                              });
                                            },
                                          )),
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              isHavegroupVal == true
                                  ? TextFormField(
                                      controller: repeatedFloorAreaCtrl,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                      onTap: () {},
                                      //onChanged: (value) {},
                                      keyboardType:
                                          const TextInputType.numberWithOptions(
                                              decimal: true, signed: false),

                                      textInputAction: TextInputAction.done,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r"[0-9.]")),
                                        TextInputFormatter.withFunction(
                                            (oldValue, newValue) {
                                          final text = newValue.text;
                                          return text.isEmpty
                                              ? newValue
                                              : double.tryParse(text) == null
                                                  ? oldValue
                                                  : newValue;
                                        }),
                                      ],
                                      showCursor: true,
                                      readOnly: false,

                                      // onFieldSubmitted: (value) {},
                                      onTapOutside: (event) => FocusManager
                                          .instance.primaryFocus
                                          ?.unfocus(),

                                      decoration: InputDecoration(
                                        hintText: 'مساحة الدور المتكرر (م^2)',
                                        hintStyle: TextStyle(
                                            fontSize: 16.sp,
                                            color: const Color(0xFF90A4AE),
                                            fontWeight: FontWeight.normal),
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 5.h, horizontal: 15.w),
                                        filled: true,
                                        fillColor: Colors.white,
                                        enabledBorder: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(24.0)),
                                          borderSide: BorderSide.none,
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                          borderSide: BorderSide.none,
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                          borderSide: BorderSide.none,
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                          borderSide: BorderSide.none,
                                        ),
                                      ),
                                    )
                                  : isHavegroupVal == false
                                      ? Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const FieldLabel(
                                              label: 'شكل الدور',
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            Wrap(
                                              spacing: 20.w,
                                              runSpacing: 20.h,
                                              children: [
                                                ...List.generate(
                                                    5,
                                                    (index) =>
                                                        CustomRadioListTile(
                                                          title: index == 0
                                                              ? 'بدون بروز'
                                                              : index == 1
                                                                  ? '1 دور'
                                                                  : index == 2
                                                                      ? '2 دور'
                                                                      : index ==
                                                                              3
                                                                          ? '3 دور'
                                                                          : index == 4
                                                                              ? '4 دور'
                                                                              : '5 دور',
                                                          value: index,
                                                          groupValue:
                                                              floorAppearancegroupVal,
                                                          onTap: () {
                                                            setState(() {
                                                              floorAppearancegroupVal =
                                                                  index;
                                                            });
                                                          },
                                                        )),
                                              ],
                                            ),
                                          ],
                                        )
                                      : const SizedBox(),
                            ],
                          ),
                        ),
                        //repeated floor area label and(field or options) end
                        SizedBox(
                          height: 15.h,
                        ),
                        //supplement area label and field start
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const FieldLabel(
                              label: 'مساحة الملحق (م^2)',
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            TextFormField(
                              controller: supplementAreaCtrl,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              onTap: () {},
                              //onChanged: (value) {},
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true, signed: false),

                              textInputAction: TextInputAction.done,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r"[0-9.]")),
                                TextInputFormatter.withFunction(
                                    (oldValue, newValue) {
                                  final text = newValue.text;
                                  return text.isEmpty
                                      ? newValue
                                      : double.tryParse(text) == null
                                          ? oldValue
                                          : newValue;
                                }),
                              ],
                              showCursor: true,
                              readOnly: false,

                              // onFieldSubmitted: (value) {},
                              onTapOutside: (event) =>
                                  FocusManager.instance.primaryFocus?.unfocus(),

                              decoration: InputDecoration(
                                hintText: 'مساحة الملحق (م^2)',
                                hintStyle: TextStyle(
                                    fontSize: 16.sp,
                                    color: const Color(0xFF90A4AE),
                                    fontWeight: FontWeight.normal),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 5.h, horizontal: 15.w),
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(255, 189, 194, 242)
                                        .withOpacity(0.2),
                                enabledBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(24.0)),
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(24.0),
                                  borderSide: BorderSide.none,
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(24.0),
                                  borderSide: BorderSide.none,
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(24.0),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                        //supplement area label and field end
                        SizedBox(
                          height: 50.h,
                        ),
                        //owner label and field start
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const FieldLabel(
                              label: 'اسم المالك',
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            TextFormField(
                              controller: ownerCtrl,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              onTap: () {},
                              //onChanged: (value) {},
                              keyboardType: TextInputType.name,
                              textInputAction: TextInputAction.done,
                              showCursor: true,
                              readOnly: false,
                              // onFieldSubmitted: (value) {},
                              onTapOutside: (event) =>
                                  FocusManager.instance.primaryFocus?.unfocus(),

                              decoration: InputDecoration(
                                hintText: 'اسم المالك',
                                hintStyle: TextStyle(
                                    fontSize: 16.sp,
                                    color: const Color(0xFF90A4AE),
                                    fontWeight: FontWeight.normal),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 5.h, horizontal: 15.w),
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(255, 189, 194, 242)
                                        .withOpacity(0.2),
                                enabledBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide.none,
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide.none,
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                        //owner label and field end
                        SizedBox(
                          height: 15.h,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 50.h,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.sp))),
                              onPressed: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //       builder: (_) => const FillYourFullAddressPage(),
                                //     ));
                              },
                              child: Text(
                                'عرض النتائج',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                      ],
                    ),
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
