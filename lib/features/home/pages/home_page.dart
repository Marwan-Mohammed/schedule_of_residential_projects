import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:schedule_of_residential_projects/core/extensions/size_config.dart';
import 'package:schedule_of_residential_projects/features/home/widgets/floor_figures.dart';

import '../../../core/constants_methods.dart';
import '../../../core/util/enums.dart';
import '../widgets/custom_radio_list_tile.dart';
import '../widgets/field_label.dart';
import '../widgets/floor_figures_radio_list_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController lengthCtrl = TextEditingController();
  TextEditingController widthCtrl = TextEditingController();
  //TextEditingController heightCtrl = TextEditingController();
  TextEditingController groundFloorAreaCtrl = TextEditingController();
  TextEditingController firstRepeatedFloorAreaCtrl = TextEditingController();
  TextEditingController secondRepeatedFloorAreaCtrl = TextEditingController();
  TextEditingController thirdRepeatedFloorAreaCtrl = TextEditingController();
  TextEditingController fourthRepeatedFloorAreaCtrl = TextEditingController();
  TextEditingController bildingTotalAreasCtrl = TextEditingController();
  TextEditingController ownerCtrl = TextEditingController();
  bool? isHaveCompleteChartsgroupVal;
  int? floorNogroupVal;
  double? soilTypegroupVal;
  bool? isAttachedFloorgroupVal;
  int? protrusionNogroupVal;
  Protrusion? protrusionPositiongroupVal;
  @override
  void initState() {
    lengthCtrl.addListener(() {
      if (lengthCtrl.text.trim() != '' && widthCtrl.text.trim() != '') {
        groundFloorAreaCtrl.text = (int.parse(lengthCtrl.text.trim()) *
                int.parse(widthCtrl.text.trim()))
            .toString();
        setState(() {});
      } else {
        groundFloorAreaCtrl.clear();
      }
    });
    widthCtrl.addListener(() {
      if (lengthCtrl.text.trim() != '' && widthCtrl.text.trim() != '') {
        groundFloorAreaCtrl.text = (int.parse(lengthCtrl.text.trim()) *
                int.parse(widthCtrl.text.trim()))
            .toString();
        setState(() {});
      } else {
        groundFloorAreaCtrl.clear();
      }
    });
    groundFloorAreaCtrl.addListener(() {
      listenerOfCalucateBildingTotalAreas(
          bildingTotalAreasCtrl,
          [
            groundFloorAreaCtrl,
            firstRepeatedFloorAreaCtrl,
            secondRepeatedFloorAreaCtrl,
            thirdRepeatedFloorAreaCtrl,
            fourthRepeatedFloorAreaCtrl
          ],
          floorNogroupVal);
      setState(() {});
    });
    firstRepeatedFloorAreaCtrl.addListener(() {
      listenerOfCalucateBildingTotalAreas(
          bildingTotalAreasCtrl,
          [
            groundFloorAreaCtrl,
            firstRepeatedFloorAreaCtrl,
            secondRepeatedFloorAreaCtrl,
            thirdRepeatedFloorAreaCtrl,
            fourthRepeatedFloorAreaCtrl
          ],
          floorNogroupVal);
      setState(() {});
    });
    secondRepeatedFloorAreaCtrl.addListener(() {
      listenerOfCalucateBildingTotalAreas(
          bildingTotalAreasCtrl,
          [
            groundFloorAreaCtrl,
            firstRepeatedFloorAreaCtrl,
            secondRepeatedFloorAreaCtrl,
            thirdRepeatedFloorAreaCtrl,
            fourthRepeatedFloorAreaCtrl
          ],
          floorNogroupVal);
      setState(() {});
    });
    thirdRepeatedFloorAreaCtrl.addListener(() {
      listenerOfCalucateBildingTotalAreas(
          bildingTotalAreasCtrl,
          [
            groundFloorAreaCtrl,
            firstRepeatedFloorAreaCtrl,
            secondRepeatedFloorAreaCtrl,
            thirdRepeatedFloorAreaCtrl,
            fourthRepeatedFloorAreaCtrl
          ],
          floorNogroupVal);
      setState(() {});
    });
    fourthRepeatedFloorAreaCtrl.addListener(() {
      listenerOfCalucateBildingTotalAreas(
          bildingTotalAreasCtrl,
          [
            groundFloorAreaCtrl,
            firstRepeatedFloorAreaCtrl,
            secondRepeatedFloorAreaCtrl,
            thirdRepeatedFloorAreaCtrl,
            fourthRepeatedFloorAreaCtrl
          ],
          floorNogroupVal);
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  Expanded(
                    child: Row(
                      children: [
                        Icon(
                          Icons.menu,
                          color: Theme.of(context).secondaryHeaderColor,
                          size: 30.sp,
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Text(
                          'تزمين',
                          style: TextStyle(
                              // height: 3.h,
                              color: Theme.of(context).primaryColor,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold),
                          //  textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFFEBE4DA),
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      'assets/images/tazmin-logo.png',
                    ),
                  )
                ],
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
                  padding: EdgeInsets.only(
                      left: 20.w, right: 20.w, top: 20.h, bottom: 5.h),
                  child: Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //isHaveComlleate-charts  options start
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 10.h),
                          margin: EdgeInsets.only(bottom: 15.h),
                          color: Theme.of(context).secondaryHeaderColor,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                                            groupValue:
                                                isHaveCompleteChartsgroupVal,
                                            onTap: () {
                                              setState(() {
                                                isHaveCompleteChartsgroupVal =
                                                    index == 0 ? true : false;
                                                lengthCtrl.clear();
                                                widthCtrl.clear();
                                                firstRepeatedFloorAreaCtrl
                                                    .clear();
                                                secondRepeatedFloorAreaCtrl
                                                    .clear();
                                                thirdRepeatedFloorAreaCtrl
                                                    .clear();
                                                fourthRepeatedFloorAreaCtrl
                                                    .clear();
                                                floorNogroupVal = null;
                                                soilTypegroupVal = null;
                                                isAttachedFloorgroupVal = null;
                                                protrusionNogroupVal = null;
                                                protrusionPositiongroupVal =
                                                    null;
                                              });
                                            },
                                          )),
                                ],
                              ),
                            ],
                          ),
                        ),
                        //isHaveComlleate-charts  options end
                        //length label and field, width label and field, height label and field,soil-type label and options,floors-number label and options start
                        isHaveCompleteChartsgroupVal != null
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 15.h),
                                    child: const FieldLabel(
                                      label: 'ادخل طول وعرض الأرضية',
                                    ),
                                  ),
                                  //length label and field start
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 15.h),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                          keyboardType: const TextInputType
                                              .numberWithOptions(
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
                                                  : double.tryParse(text) ==
                                                          null
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
                                          cursorColor: Theme.of(context)
                                              .secondaryHeaderColor,
                                          decoration: InputDecoration(
                                            hintText: 'الطول (م)',
                                            hintStyle: TextStyle(
                                                fontSize: 16.sp,
                                                color: Theme.of(context)
                                                    .primaryColor
                                                    .withOpacity(0.5),
                                                fontWeight: FontWeight.normal),
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 5.h,
                                                    horizontal: 15.w),
                                            filled: true,
                                            fillColor: Theme.of(context)
                                                .primaryColor
                                                .withOpacity(0.1),
                                            enabledBorder:
                                                const OutlineInputBorder(
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
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(24.0),
                                              borderSide: BorderSide.none,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  //length label and field end
                                  //width label and field start
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 15.h),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                          keyboardType: const TextInputType
                                              .numberWithOptions(
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
                                                  : double.tryParse(text) ==
                                                          null
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
                                          cursorColor: Theme.of(context)
                                              .secondaryHeaderColor,
                                          decoration: InputDecoration(
                                            hintText: 'العرض (م)',
                                            hintStyle: TextStyle(
                                                fontSize: 16.sp,
                                                color: Theme.of(context)
                                                    .primaryColor
                                                    .withOpacity(0.5),
                                                fontWeight: FontWeight.normal),
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 5.h,
                                                    horizontal: 15.w),
                                            filled: true,
                                            fillColor: Theme.of(context)
                                                .primaryColor
                                                .withOpacity(0.1),
                                            enabledBorder:
                                                const OutlineInputBorder(
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
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(24.0),
                                              borderSide: BorderSide.none,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  //width label and field end
                                  //height label and field start
                                  // Padding(
                                  //   padding: EdgeInsets.only(bottom: 15.h),
                                  //   child: Column(
                                  //     mainAxisAlignment:
                                  //         MainAxisAlignment.start,
                                  //     crossAxisAlignment:
                                  //         CrossAxisAlignment.start,
                                  //     children: [
                                  //       const FieldLabel(
                                  //         label: 'الإرتفاع (م)',
                                  //       ),
                                  //       SizedBox(
                                  //         height: 10.h,
                                  //       ),
                                  //       TextFormField(
                                  //         controller: heightCtrl,
                                  //         textAlign: TextAlign.center,
                                  //         style: TextStyle(
                                  //             fontSize: 16.sp,
                                  //             color: Colors.black,
                                  //             fontWeight: FontWeight.bold),
                                  //         onTap: () {},
                                  //         //onChanged: (value) {},
                                  //         keyboardType: const TextInputType
                                  //             .numberWithOptions(
                                  //             decimal: true, signed: false),

                                  //         textInputAction: TextInputAction.done,
                                  //         inputFormatters: [
                                  //           FilteringTextInputFormatter.allow(
                                  //               RegExp(r"[0-9.]")),
                                  //           TextInputFormatter.withFunction(
                                  //               (oldValue, newValue) {
                                  //             final text = newValue.text;
                                  //             return text.isEmpty
                                  //                 ? newValue
                                  //                 : double.tryParse(text) ==
                                  //                         null
                                  //                     ? oldValue
                                  //                     : newValue;
                                  //           }),
                                  //         ],
                                  //         showCursor: true,
                                  //         readOnly: false,

                                  //         // onFieldSubmitted: (value) {},
                                  //         onTapOutside: (event) => FocusManager
                                  //             .instance.primaryFocus
                                  //             ?.unfocus(),

                                  //         decoration: InputDecoration(
                                  //           hintText: 'الإرتفاع (م)',
                                  //           hintStyle: TextStyle(
                                  //               fontSize: 16.sp,
                                  //               color: const Color(0xFF90A4AE),
                                  //               fontWeight: FontWeight.normal),
                                  //           contentPadding:
                                  //               EdgeInsets.symmetric(
                                  //                   vertical: 5.h,
                                  //                   horizontal: 15.w),
                                  //           filled: true,
                                  //           fillColor: const Color.fromARGB(
                                  //                   255, 189, 194, 242)
                                  //               .withOpacity(0.2),
                                  //           enabledBorder:
                                  //               const OutlineInputBorder(
                                  //             borderRadius: BorderRadius.all(
                                  //                 Radius.circular(24.0)),
                                  //             borderSide: BorderSide.none,
                                  //           ),
                                  //           focusedBorder: OutlineInputBorder(
                                  //             borderRadius:
                                  //                 BorderRadius.circular(24.0),
                                  //             borderSide: BorderSide.none,
                                  //           ),
                                  //           errorBorder: OutlineInputBorder(
                                  //             borderRadius:
                                  //                 BorderRadius.circular(24.0),
                                  //             borderSide: BorderSide.none,
                                  //           ),
                                  //           focusedErrorBorder:
                                  //               OutlineInputBorder(
                                  //             borderRadius:
                                  //                 BorderRadius.circular(24.0),
                                  //             borderSide: BorderSide.none,
                                  //           ),
                                  //         ),
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                  //height label and field end
                                  //soil-type label and options start
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 15.h),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                                      title: index == 0
                                                          ? 'قوية'
                                                          : 'متوسطة',
                                                      value: index == 0
                                                          ? 0.02437
                                                          : 0.01716,
                                                      groupValue:
                                                          soilTypegroupVal,
                                                      onTap: () {
                                                        setState(() {
                                                          soilTypegroupVal =
                                                              index == 0
                                                                  ? 0.02437
                                                                  : 0.01716;
                                                        });
                                                      },
                                                    )),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  //soil-type label and options end
                                  //floors-number label and options start
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 15.h),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                                      groupValue:
                                                          floorNogroupVal,
                                                      onTap: () {
                                                        setState(() {
                                                          floorNogroupVal =
                                                              index + 1;
                                                          if (index == 0) {
                                                            isAttachedFloorgroupVal =
                                                                null;
                                                          }
                                                          listenerOfCalucateBildingTotalAreas(
                                                              bildingTotalAreasCtrl,
                                                              [
                                                                groundFloorAreaCtrl,
                                                                firstRepeatedFloorAreaCtrl,
                                                                secondRepeatedFloorAreaCtrl,
                                                                thirdRepeatedFloorAreaCtrl,
                                                                fourthRepeatedFloorAreaCtrl
                                                              ],
                                                              floorNogroupVal);
                                                        });
                                                      },
                                                    )),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  //floors-number label and options end
                                ],
                              )
                            : const SizedBox(),
                        //length label and field, width label and field, height label and field,soil-type label and options,floors-number label and options end
                        (floorNogroupVal == 1 &&
                                    isHaveCompleteChartsgroupVal == true) ||
                                isHaveCompleteChartsgroupVal == false
                            ?
                            //ground-floor label and field start
                            Padding(
                                padding: EdgeInsets.only(bottom: 15.h),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const FieldLabel(
                                      label: 'مساحة الدور الأرضي (م^2)',
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    TextFormField(
                                      controller: groundFloorAreaCtrl,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                      onTap: () {},
                                      //onChanged: (value) {},
                                      // keyboardType: const TextInputType
                                      //     .numberWithOptions(
                                      //     decimal: true, signed: false),

                                      // textInputAction: TextInputAction.done,
                                      // inputFormatters: [
                                      //   FilteringTextInputFormatter.allow(
                                      //       RegExp(r"[0-9.]")),
                                      //   TextInputFormatter.withFunction(
                                      //       (oldValue, newValue) {
                                      //     final text = newValue.text;
                                      //     return text.isEmpty
                                      //         ? newValue
                                      //         : double.tryParse(text) ==
                                      //                 null
                                      //             ? oldValue
                                      //             : newValue;
                                      //   }),
                                      // ],
                                      showCursor: false,
                                      readOnly: true,

                                      // onFieldSubmitted: (value) {},
                                      // onTapOutside: (event) => FocusManager
                                      //     .instance.primaryFocus
                                      //     ?.unfocus(),
                                      cursorColor: Theme.of(context)
                                          .secondaryHeaderColor,
                                      decoration: InputDecoration(
                                        hintText: '(الطول*العرض)م^2',
                                        hintStyle: TextStyle(
                                            fontSize: 16.sp,
                                            color: Theme.of(context)
                                                .primaryColor
                                                .withOpacity(0.5),
                                            fontWeight: FontWeight.normal),
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 5.h, horizontal: 15.w),
                                        filled: true,
                                        fillColor: Theme.of(context)
                                            .primaryColor
                                            .withOpacity(0.1),
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
                                    ),
                                  ],
                                ),
                              )
                            //ground-floor label and field end
                            : floorNogroupVal != null
                                ?
                                //is there attached floor? start
                                Padding(
                                    padding: EdgeInsets.only(bottom: 15.h),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons.contact_support_rounded,
                                                color: Theme.of(context)
                                                    .primaryColor),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            Expanded(
                                              child: Text(
                                                'هل يوجد دور ملحق؟',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16.sp),
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
                                                      title: index == 0
                                                          ? 'نعم'
                                                          : 'لا',
                                                      value: index == 0
                                                          ? true
                                                          : false,
                                                      groupValue:
                                                          isAttachedFloorgroupVal,
                                                      onTap: () {
                                                        setState(() {
                                                          isAttachedFloorgroupVal =
                                                              index == 0
                                                                  ? true
                                                                  : false;
                                                        });
                                                      },
                                                    )),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                //is there attached floor? end
                                : const SizedBox(),
                        isAttachedFloorgroupVal == true &&
                                isHaveCompleteChartsgroupVal == true
                            ?
                            //ground-floor and repeated-floors labels and fields start
                            Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ...List.generate(
                                      floorNogroupVal!,
                                      (index) => Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 15.h),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                FieldLabel(
                                                  label: index == 0
                                                      ? 'مساحة الدور الأرضي (م^2)'
                                                      : index ==
                                                              floorNogroupVal! -
                                                                  1
                                                          ? 'مساحة الدور الملحق (م^2)'
                                                          : index == 1
                                                              ? 'مساحة الدور المتكرر الأول (م^2)'
                                                              : index == 2
                                                                  ? 'مساحة الدور المتكرر الثاني (م^2)'
                                                                  : index == 3
                                                                      ? 'مساحة الدور المتكرر الثالث (م^2)'
                                                                      : '',
                                                ),
                                                SizedBox(
                                                  height: 10.h,
                                                ),
                                                TextFormField(
                                                  controller: index == 0
                                                      ? groundFloorAreaCtrl
                                                      : index == 1
                                                          ? firstRepeatedFloorAreaCtrl
                                                          : index == 2
                                                              ? secondRepeatedFloorAreaCtrl
                                                              : index == 3
                                                                  ? thirdRepeatedFloorAreaCtrl
                                                                  : fourthRepeatedFloorAreaCtrl,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 16.sp,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  onTap: () {},
                                                  //onChanged: (value) {},
                                                  keyboardType: index == 0
                                                      ? null
                                                      : const TextInputType
                                                          .numberWithOptions(
                                                          decimal: true,
                                                          signed: false),

                                                  textInputAction: index == 0
                                                      ? null
                                                      : TextInputAction.done,
                                                  inputFormatters: index == 0
                                                      ? null
                                                      : [
                                                          FilteringTextInputFormatter
                                                              .allow(RegExp(
                                                                  r"[0-9.]")),
                                                          TextInputFormatter
                                                              .withFunction(
                                                                  (oldValue,
                                                                      newValue) {
                                                            final text =
                                                                newValue.text;
                                                            return text.isEmpty
                                                                ? newValue
                                                                : double.tryParse(
                                                                            text) ==
                                                                        null
                                                                    ? oldValue
                                                                    : newValue;
                                                          }),
                                                        ],
                                                  showCursor: index != 0,
                                                  readOnly: index == 0,

                                                  // onFieldSubmitted: (value) {},
                                                  onTapOutside: index == 0
                                                      ? null
                                                      : (event) => FocusManager
                                                          .instance.primaryFocus
                                                          ?.unfocus(),
                                                  cursorColor: Theme.of(context)
                                                      .secondaryHeaderColor,
                                                  decoration: InputDecoration(
                                                    hintText: index == 0
                                                        ? '(الطول*العرض)م^2'
                                                        : index ==
                                                                floorNogroupVal! -
                                                                    1
                                                            ? 'مساحة الدور الملحق (م^2)'
                                                            : index == 1
                                                                ? 'مساحة الدور المتكرر الأول (م^2)'
                                                                : index == 2
                                                                    ? 'مساحة الدور المتكرر الثاني (م^2)'
                                                                    : index == 3
                                                                        ? 'مساحة الدور المتكرر الثالث (م^2)'
                                                                        : '',
                                                    hintStyle: TextStyle(
                                                        fontSize: 16.sp,
                                                        color: Theme.of(context)
                                                            .primaryColor
                                                            .withOpacity(0.5),
                                                        fontWeight:
                                                            FontWeight.normal),
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 5.h,
                                                            horizontal: 15.w),
                                                    filled: true,
                                                    fillColor: Theme.of(context)
                                                        .primaryColor
                                                        .withOpacity(0.1),
                                                    enabledBorder:
                                                        const OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  24.0)),
                                                      borderSide:
                                                          BorderSide.none,
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              24.0),
                                                      borderSide:
                                                          BorderSide.none,
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              24.0),
                                                      borderSide:
                                                          BorderSide.none,
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              24.0),
                                                      borderSide:
                                                          BorderSide.none,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )),
                                ],
                              )
                            //ground-floor and repeated-floors labels and fields end
                            : isAttachedFloorgroupVal == false &&
                                    isHaveCompleteChartsgroupVal == true
                                ?
                                //ground-floor and repeated-floors labels and fields start
                                Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ...List.generate(
                                          floorNogroupVal!,
                                          (index) => Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: 15.h),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    FieldLabel(
                                                      label: index == 0
                                                          ? 'مساحة الدور الأرضي (م^2)'
                                                          : index == 1
                                                              ? 'مساحة الدور المتكرر الأول (م^2)'
                                                              : index == 2
                                                                  ? 'مساحة الدور المتكرر الثاني (م^2)'
                                                                  : index == 3
                                                                      ? 'مساحة الدور المتكرر الثالث (م^2)'
                                                                      : 'مساحة الدور المتكرر الرابع (م^2)',
                                                    ),
                                                    SizedBox(
                                                      height: 10.h,
                                                    ),
                                                    TextFormField(
                                                      controller: index == 0
                                                          ? groundFloorAreaCtrl
                                                          : index == 1
                                                              ? firstRepeatedFloorAreaCtrl
                                                              : index == 2
                                                                  ? secondRepeatedFloorAreaCtrl
                                                                  : index == 3
                                                                      ? thirdRepeatedFloorAreaCtrl
                                                                      : fourthRepeatedFloorAreaCtrl,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 16.sp,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                      onTap: () {},
                                                      //onChanged: (value) {},
                                                      keyboardType: index == 0
                                                          ? null
                                                          : const TextInputType
                                                              .numberWithOptions(
                                                              decimal: true,
                                                              signed: false),

                                                      textInputAction:
                                                          index == 0
                                                              ? null
                                                              : TextInputAction
                                                                  .done,
                                                      inputFormatters:
                                                          index == 0
                                                              ? null
                                                              : [
                                                                  FilteringTextInputFormatter
                                                                      .allow(RegExp(
                                                                          r"[0-9.]")),
                                                                  TextInputFormatter
                                                                      .withFunction(
                                                                          (oldValue,
                                                                              newValue) {
                                                                    final text =
                                                                        newValue
                                                                            .text;
                                                                    return text
                                                                            .isEmpty
                                                                        ? newValue
                                                                        : double.tryParse(text) ==
                                                                                null
                                                                            ? oldValue
                                                                            : newValue;
                                                                  }),
                                                                ],
                                                      showCursor: index != 0,
                                                      readOnly: index == 0,

                                                      // onFieldSubmitted: (value) {},
                                                      onTapOutside: index == 0
                                                          ? null
                                                          : (event) =>
                                                              FocusManager
                                                                  .instance
                                                                  .primaryFocus
                                                                  ?.unfocus(),
                                                      cursorColor: Theme.of(
                                                              context)
                                                          .secondaryHeaderColor,
                                                      decoration:
                                                          InputDecoration(
                                                        hintText: index == 0
                                                            ? '(الطول*العرض)م^2'
                                                            : index == 1
                                                                ? 'مساحة الدور المتكرر الأول (م^2)'
                                                                : index == 2
                                                                    ? 'مساحة الدور المتكرر الثاني (م^2)'
                                                                    : index == 3
                                                                        ? 'مساحة الدور المتكرر الثالث (م^2)'
                                                                        : 'مساحة الدور المتكرر الرابع (م^2)',
                                                        hintStyle: TextStyle(
                                                            fontSize: 16.sp,
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColor
                                                                .withOpacity(
                                                                    0.5),
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal),
                                                        contentPadding:
                                                            EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        5.h,
                                                                    horizontal:
                                                                        15.w),
                                                        filled: true,
                                                        fillColor: Theme.of(
                                                                context)
                                                            .primaryColor
                                                            .withOpacity(0.1),
                                                        enabledBorder:
                                                            const OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          24.0)),
                                                          borderSide:
                                                              BorderSide.none,
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      24.0),
                                                          borderSide:
                                                              BorderSide.none,
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      24.0),
                                                          borderSide:
                                                              BorderSide.none,
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      24.0),
                                                          borderSide:
                                                              BorderSide.none,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )),
                                    ],
                                  )
                                //ground-floor and repeated-floors labels and fields end
                                : const SizedBox(),
                        //Protrusion-number label and options start
                        floorNogroupVal != null &&
                                floorNogroupVal != 1 &&
                                isHaveCompleteChartsgroupVal == false
                            ? Padding(
                                padding: EdgeInsets.only(bottom: 15.h),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const FieldLabel(
                                      label: 'عدد البروز',
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
                                                      ? 'بدون بروز'
                                                      : index == 1
                                                          ? '1 بروز'
                                                          : index == 2
                                                              ? '2 بروز'
                                                              : index == 3
                                                                  ? '3 بروز'
                                                                  : '4 بروز',
                                                  value: index,
                                                  groupValue:
                                                      protrusionNogroupVal,
                                                  onTap: () {
                                                    setState(() {
                                                      protrusionNogroupVal =
                                                          index;
                                                      if (index == 4) {
                                                        protrusionPositiongroupVal =
                                                            Protrusion.llww;
                                                      } else {
                                                        protrusionPositiongroupVal =
                                                            null;
                                                      }
                                                    });
                                                  },
                                                )),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            : const SizedBox(),
                        //Protrusion-number label and options end
                        //protrusion-positions label and options start
                        protrusionNogroupVal == null ||
                                protrusionNogroupVal == 0
                            ? const SizedBox()
                            : Padding(
                                padding: EdgeInsets.only(bottom: 15.h),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const FieldLabel(
                                      label: 'مواضع البروز',
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    protrusionNogroupVal == 1
                                        ? Wrap(
                                            spacing: 20.w,
                                            runSpacing: 20.h,
                                            children: [
                                              ...List.generate(
                                                  2,
                                                  (index) =>
                                                      FloorFiguresRadioListTile(
                                                        protrusion: index == 0
                                                            ? const ProtrusionL()
                                                            : const ProtrusionW(),
                                                        value: index == 0
                                                            ? Protrusion.l
                                                            : Protrusion.w,
                                                        groupValue:
                                                            protrusionPositiongroupVal,
                                                        onTap: () {
                                                          setState(() {
                                                            protrusionPositiongroupVal =
                                                                index == 0
                                                                    ? Protrusion
                                                                        .l
                                                                    : Protrusion
                                                                        .w;
                                                          });
                                                        },
                                                      )),
                                            ],
                                          )
                                        : protrusionNogroupVal == 2
                                            ? Wrap(
                                                spacing: 20.w,
                                                runSpacing: 20.h,
                                                children: [
                                                  ...List.generate(
                                                      3,
                                                      (index) =>
                                                          FloorFiguresRadioListTile(
                                                            protrusion: index ==
                                                                    0
                                                                ? const ProtrusionLL()
                                                                : index == 1
                                                                    ? const ProtrusionWW()
                                                                    : const ProtrusionWL(),
                                                            value: index == 0
                                                                ? Protrusion.ll
                                                                : index == 1
                                                                    ? Protrusion
                                                                        .ww
                                                                    : Protrusion
                                                                        .wl,
                                                            groupValue:
                                                                protrusionPositiongroupVal,
                                                            onTap: () {
                                                              setState(() {
                                                                protrusionPositiongroupVal = index ==
                                                                        0
                                                                    ? Protrusion
                                                                        .ll
                                                                    : index == 1
                                                                        ? Protrusion
                                                                            .ww
                                                                        : Protrusion
                                                                            .wl;
                                                              });
                                                            },
                                                          )),
                                                ],
                                              )
                                            : protrusionNogroupVal == 3
                                                ? Wrap(
                                                    spacing: 20.w,
                                                    runSpacing: 20.h,
                                                    children: [
                                                      ...List.generate(
                                                          2,
                                                          (index) =>
                                                              FloorFiguresRadioListTile(
                                                                protrusion: index ==
                                                                        0
                                                                    ? const ProtrusionLLW()
                                                                    : const ProtrusionWWL(),
                                                                value: index ==
                                                                        0
                                                                    ? Protrusion
                                                                        .llw
                                                                    : Protrusion
                                                                        .wwl,
                                                                groupValue:
                                                                    protrusionPositiongroupVal,
                                                                onTap: () {
                                                                  setState(() {
                                                                    protrusionPositiongroupVal = index ==
                                                                            0
                                                                        ? Protrusion
                                                                            .llw
                                                                        : Protrusion
                                                                            .wwl;
                                                                  });
                                                                },
                                                              )),
                                                    ],
                                                  )
                                                : Wrap(
                                                    spacing: 20.w,
                                                    runSpacing: 20.h,
                                                    children: [
                                                      ...List.generate(
                                                          1,
                                                          (index) =>
                                                              FloorFiguresRadioListTile(
                                                                protrusion:
                                                                    const ProtrusionLLWW(),
                                                                value:
                                                                    Protrusion
                                                                        .llww,
                                                                groupValue:
                                                                    protrusionPositiongroupVal,
                                                                onTap: () {
                                                                  setState(() {
                                                                    protrusionPositiongroupVal =
                                                                        Protrusion
                                                                            .llww;
                                                                  });
                                                                },
                                                              )),
                                                    ],
                                                  )
                                  ],
                                ),
                              ),
                        //protrusion-positions label and options end
                        //building total areas label and field start
                        isHaveCompleteChartsgroupVal == true
                            ? Padding(
                                padding: EdgeInsets.only(bottom: 15.h),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const FieldLabel(
                                      label: 'مجموع المساحات (م^2)',
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    TextFormField(
                                      controller: bildingTotalAreasCtrl,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                      // onTap: () {},
                                      //onChanged: (value) {},
                                      // keyboardType:
                                      //     const TextInputType.numberWithOptions(
                                      //         decimal: true, signed: false),

                                      // textInputAction: TextInputAction.done,
                                      // inputFormatters: [
                                      //   FilteringTextInputFormatter.allow(
                                      //       RegExp(r"[0-9.]")),
                                      //   TextInputFormatter.withFunction(
                                      //       (oldValue, newValue) {
                                      //     final text = newValue.text;
                                      //     return text.isEmpty
                                      //         ? newValue
                                      //         : double.tryParse(text) == null
                                      //             ? oldValue
                                      //             : newValue;
                                      //   }),
                                      // ],
                                      showCursor: false,
                                      readOnly: true,

                                      // onFieldSubmitted: (value) {},
                                      // onTapOutside: (event) =>
                                      //     FocusManager.instance.primaryFocus?.unfocus(),

                                      decoration: InputDecoration(
                                        // hintStyle: TextStyle(
                                        //     fontSize: 16.sp,
                                        //     color: const Color(0xFF90A4AE),
                                        //     fontWeight: FontWeight.normal),
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 5.h, horizontal: 15.w),
                                        filled: true,
                                        fillColor: Theme.of(context)
                                            .primaryColor
                                            .withOpacity(0.1),

                                        enabledBorder: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                          borderSide: BorderSide.none,
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          borderSide: BorderSide.none,
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          borderSide: BorderSide.none,
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          borderSide: BorderSide.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : const SizedBox(),
                        //building total areas label and field end
                        //owner label and field start
                        Padding(
                          padding: EdgeInsets.only(bottom: 15.h),
                          child: Column(
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
                                onTapOutside: (event) => FocusManager
                                    .instance.primaryFocus
                                    ?.unfocus(),
                                cursorColor:
                                    Theme.of(context).secondaryHeaderColor,
                                decoration: InputDecoration(
                                  hintText: 'اسم المالك',
                                  hintStyle: TextStyle(
                                      fontSize: 16.sp,
                                      color: Theme.of(context)
                                          .primaryColor
                                          .withOpacity(0.5),
                                      fontWeight: FontWeight.normal),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 5.h, horizontal: 15.w),
                                  filled: true,
                                  fillColor: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.1),
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
                        SizedBox(
                          height: 20.h,
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
