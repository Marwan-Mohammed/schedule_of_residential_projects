import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:schedule_of_residential_projects/core/extensions/size_config.dart';

import '../../../core/constants_methods.dart';
import '../../../core/util/enums.dart';
import '../../results/pages/schedule_pdf_viewer.dart';
import '../widgets/custom_radio_list_tile.dart';
import '../widgets/field_label.dart';
//import '../widgets/floor_figures.dart';
//import '../widgets/floor_figures_radio_list_tile.dart';

//with Have you completed charts? question
// class HomePage1 extends StatefulWidget {
//   final VoidCallback openDrawer;
//   const HomePage1({super.key, required this.openDrawer});

//   @override
//   State<HomePage1> createState() => _HomePage1State();
// }

// class _HomePage1State extends State<HomePage1> {
//   // TextEditingController lengthCtrl = TextEditingController();
//   // TextEditingController widthCtrl = TextEditingController();
//   //TextEditingController heightCtrl = TextEditingController();
//   TextEditingController groundFloorAreaCtrl = TextEditingController();
//   TextEditingController firstRepeatedFloorAreaCtrl = TextEditingController();
//   TextEditingController secondRepeatedFloorAreaCtrl = TextEditingController();
//   TextEditingController thirdRepeatedFloorAreaCtrl = TextEditingController();
//   TextEditingController fourthRepeatedFloorAreaCtrl = TextEditingController();
//   TextEditingController bildingTotalAreasCtrl = TextEditingController();
//   TextEditingController ownerCtrl = TextEditingController();
//   bool? isHaveCompleteChartsgroupVal;
//   int? floorNogroupVal;
//   double? soilTypegroupVal;
//   bool? isAttachedFloorgroupVal;
//   int? protrusionNogroupVal;
//   ProtrusionPosition? protrusionPositiongroupVal;
//   bool isdropdownSoilType = false;
//   bool isdropdownFloorNo = false;
//   bool isdropdowniSAttachedFloor = false;
//   bool isdropdownProtrusionNo = false;
//   bool isdropdownProtrusionPosition = false;

//   @override
//   void initState() {
//     // lengthCtrl.addListener(() {
//     //   if (lengthCtrl.text.trim() != '' && widthCtrl.text.trim() != '') {
//     //     groundFloorAreaCtrl.text = (int.parse(lengthCtrl.text.trim()) *
//     //             int.parse(widthCtrl.text.trim()))
//     //         .toString();
//     //     setState(() {});
//     //   } else {
//     //     groundFloorAreaCtrl.clear();
//     //   }
//     // });
//     // widthCtrl.addListener(() {
//     //   if (lengthCtrl.text.trim() != '' && widthCtrl.text.trim() != '') {
//     //     groundFloorAreaCtrl.text = (int.parse(lengthCtrl.text.trim()) *
//     //             int.parse(widthCtrl.text.trim()))
//     //         .toString();
//     //     setState(() {});
//     //   } else {
//     //     groundFloorAreaCtrl.clear();
//     //   }
//     // });
//     groundFloorAreaCtrl.addListener(() {
//       listenerOfCalucateBildingTotalAreas(
//           bildingTotalAreasCtrl,
//           [
//             groundFloorAreaCtrl,
//             firstRepeatedFloorAreaCtrl,
//             secondRepeatedFloorAreaCtrl,
//             thirdRepeatedFloorAreaCtrl,
//             fourthRepeatedFloorAreaCtrl
//           ],
//           floorNogroupVal);
//       setState(() {});
//     });
//     firstRepeatedFloorAreaCtrl.addListener(() {
//       listenerOfCalucateBildingTotalAreas(
//           bildingTotalAreasCtrl,
//           [
//             groundFloorAreaCtrl,
//             firstRepeatedFloorAreaCtrl,
//             secondRepeatedFloorAreaCtrl,
//             thirdRepeatedFloorAreaCtrl,
//             fourthRepeatedFloorAreaCtrl
//           ],
//           floorNogroupVal);
//       setState(() {});
//     });
//     secondRepeatedFloorAreaCtrl.addListener(() {
//       listenerOfCalucateBildingTotalAreas(
//           bildingTotalAreasCtrl,
//           [
//             groundFloorAreaCtrl,
//             firstRepeatedFloorAreaCtrl,
//             secondRepeatedFloorAreaCtrl,
//             thirdRepeatedFloorAreaCtrl,
//             fourthRepeatedFloorAreaCtrl
//           ],
//           floorNogroupVal);
//       setState(() {});
//     });
//     thirdRepeatedFloorAreaCtrl.addListener(() {
//       listenerOfCalucateBildingTotalAreas(
//           bildingTotalAreasCtrl,
//           [
//             groundFloorAreaCtrl,
//             firstRepeatedFloorAreaCtrl,
//             secondRepeatedFloorAreaCtrl,
//             thirdRepeatedFloorAreaCtrl,
//             fourthRepeatedFloorAreaCtrl
//           ],
//           floorNogroupVal);
//       setState(() {});
//     });
//     fourthRepeatedFloorAreaCtrl.addListener(() {
//       listenerOfCalucateBildingTotalAreas(
//           bildingTotalAreasCtrl,
//           [
//             groundFloorAreaCtrl,
//             firstRepeatedFloorAreaCtrl,
//             secondRepeatedFloorAreaCtrl,
//             thirdRepeatedFloorAreaCtrl,
//             fourthRepeatedFloorAreaCtrl
//           ],
//           floorNogroupVal);
//       setState(() {});
//     });

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AnnotatedRegion<SystemUiOverlayStyle>(
//       value: SystemUiOverlayStyle(
//           statusBarColor: Colors.white.withOpacity(0.0),
//           statusBarIconBrightness: Brightness.dark),
//       child: Scaffold(
//         backgroundColor: const Color(0xFFEBE4DA),
//         body: SafeArea(
//             child: MediaQuery(
//           data: MediaQuery.of(context).copyWith(
//             textScaleFactor: SizeConfig.textScaleFactor,
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 width: double.infinity,
//                 height: 100,
//                 alignment: Alignment.center,
//                 padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
//                 decoration: BoxDecoration(
//                     color: Theme.of(context).primaryColor,
//                     borderRadius: const BorderRadius.only(
//                       bottomLeft: Radius.circular(40),
//                     )),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     IconButton(
//                       onPressed: () => widget.openDrawer(),
//                       icon: Icon(
//                         Icons.menu,
//                         color: Colors.white,
//                         size: 30.sp,
//                       ),
//                     ),
//                     SizedBox(
//                       width: 20.w,
//                     ),
//                     Expanded(
//                       child: Text(
//                         'حساب الجدول الزمني للمشاريع السكنية',
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 18.sp,
//                             fontWeight: FontWeight.bold),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               Expanded(
//                 child: SingleChildScrollView(
//                   padding: EdgeInsets.only(
//                       left: 20.w, right: 20.w, top: 20.h, bottom: 5.h),
//                   child: Form(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         //isHaveComlleate-charts  options start
//                         Container(
//                           padding: EdgeInsets.symmetric(
//                               horizontal: 10.w, vertical: 10.h),
//                           margin: EdgeInsets.only(bottom: 15.h),
//                           color: Theme.of(context).secondaryHeaderColor,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Row(
//                                 children: [
//                                   Icon(Icons.contact_support_rounded,
//                                       color: Theme.of(context).primaryColor),
//                                   SizedBox(
//                                     width: 5.w,
//                                   ),
//                                   Expanded(
//                                     child: Text(
//                                       'هل لديك مخططات كاملة؟',
//                                       style: TextStyle(
//                                           color: Colors.black, fontSize: 16.sp),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(
//                                 height: 10.h,
//                               ),
//                               Wrap(
//                                 spacing: 20.w,
//                                 runSpacing: 20.h,
//                                 children: [
//                                   ...List.generate(
//                                       2,
//                                       (index) => CustomRadioListTile(
//                                             title: index == 0 ? 'نعم' : 'لا',
//                                             value: index == 0 ? true : false,
//                                             groupValue:
//                                                 isHaveCompleteChartsgroupVal,
//                                             onTap: () {
//                                               setState(() {
//                                                 isHaveCompleteChartsgroupVal =
//                                                     index == 0 ? true : false;
//                                                 groundFloorAreaCtrl.clear();
//                                                 firstRepeatedFloorAreaCtrl
//                                                     .clear();
//                                                 secondRepeatedFloorAreaCtrl
//                                                     .clear();
//                                                 thirdRepeatedFloorAreaCtrl
//                                                     .clear();
//                                                 fourthRepeatedFloorAreaCtrl
//                                                     .clear();
//                                                 floorNogroupVal = null;
//                                                 soilTypegroupVal = null;
//                                                 isAttachedFloorgroupVal = null;
//                                                 protrusionNogroupVal = null;
//                                                 protrusionPositiongroupVal =
//                                                     null;
//                                                 isdropdownSoilType = false;
//                                                 isdropdownFloorNo = false;
//                                                 isdropdowniSAttachedFloor =
//                                                     false;
//                                                 isdropdownProtrusionNo = false;
//                                                 isdropdownProtrusionPosition =
//                                                     false;
//                                               });
//                                             },
//                                           )),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                         //isHaveComlleate-charts  options end
//                         //building-area label and field,soil-type label and options,floors-number label and options start
//                         isHaveCompleteChartsgroupVal != null
//                             ? Column(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   //building-area label and field start

//                                   Padding(
//                                     padding: EdgeInsets.only(bottom: 15.h),
//                                     child: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.start,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         const FieldLabel(
//                                           label: 'مساحة الدور الأرضي (م²)',
//                                         ),
//                                         SizedBox(
//                                           height: 10.h,
//                                         ),
//                                         TextFormField(
//                                           controller: groundFloorAreaCtrl,
//                                           textAlign: TextAlign.center,
//                                           style: TextStyle(
//                                               fontSize: 16.sp,
//                                               color: Colors.black,
//                                               fontWeight: FontWeight.bold),
//                                           onTap: () {},
//                                           //onChanged: (value) {},
//                                           keyboardType: const TextInputType
//                                               .numberWithOptions(
//                                               decimal: true, signed: false),

//                                           textInputAction: TextInputAction.done,
//                                           inputFormatters: [
//                                             FilteringTextInputFormatter.allow(
//                                                 RegExp(r"[0-9.]")),
//                                             TextInputFormatter.withFunction(
//                                                 (oldValue, newValue) {
//                                               final text = newValue.text;
//                                               return text.isEmpty
//                                                   ? newValue
//                                                   : double.tryParse(text) ==
//                                                           null
//                                                       ? oldValue
//                                                       : newValue;
//                                             }),
//                                           ],
//                                           showCursor: true,
//                                           readOnly: false,

//                                           // onFieldSubmitted: (value) {},
//                                           onTapOutside: (event) => FocusManager
//                                               .instance.primaryFocus
//                                               ?.unfocus(),
//                                           cursorColor: Theme.of(context)
//                                               .secondaryHeaderColor,
//                                           decoration: InputDecoration(
//                                             hintText: 'ادخل مساحة البناء (م²)',
//                                             hintStyle: TextStyle(
//                                                 fontSize: 16.sp,
//                                                 color: Theme.of(context)
//                                                     .primaryColor
//                                                     .withOpacity(0.5),
//                                                 fontWeight: FontWeight.normal),
//                                             contentPadding:
//                                                 EdgeInsets.symmetric(
//                                                     vertical: 5.h,
//                                                     horizontal: 15.w),
//                                             filled: true,
//                                             fillColor: Theme.of(context)
//                                                 .primaryColor
//                                                 .withOpacity(0.1),
//                                             enabledBorder:
//                                                 const OutlineInputBorder(
//                                               borderRadius: BorderRadius.all(
//                                                   Radius.circular(24.0)),
//                                               borderSide: BorderSide.none,
//                                             ),
//                                             focusedBorder: OutlineInputBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(24.0),
//                                               borderSide: BorderSide.none,
//                                             ),
//                                             errorBorder: OutlineInputBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(24.0),
//                                               borderSide: BorderSide.none,
//                                             ),
//                                             focusedErrorBorder:
//                                                 OutlineInputBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(24.0),
//                                               borderSide: BorderSide.none,
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   //building-area label and field end

//                                   //soil-type label and options start
//                                   Padding(
//                                     padding: EdgeInsets.only(bottom: 15.h),
//                                     child: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.start,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Row(
//                                           children: [
//                                             const FieldLabel(
//                                               label: 'نوع التربة',
//                                             ),
//                                             SizedBox(
//                                               width: 10.w,
//                                             ),
//                                             soilTypegroupVal != null
//                                                 ? Text(
//                                                     soilTypegroupVal == 0.02437
//                                                         ? 'قوية'
//                                                         : 'متوسطة',
//                                                     style: TextStyle(
//                                                         color: Colors.black,
//                                                         fontSize: 16.sp),
//                                                   )
//                                                 : SizedBox(),
//                                             SizedBox(
//                                               width: 20.w,
//                                             ),
//                                             InkWell(
//                                               focusColor: Theme.of(context)
//                                                   .primaryColor
//                                                   .withOpacity(0.1),
//                                               hoverColor: Theme.of(context)
//                                                   .primaryColor
//                                                   .withOpacity(0.1),
//                                               highlightColor: Theme.of(context)
//                                                   .primaryColor
//                                                   .withOpacity(0.1),
//                                               splashColor: Theme.of(context)
//                                                   .primaryColor
//                                                   .withOpacity(0.1),
//                                               borderRadius:
//                                                   BorderRadius.circular(5),
//                                               onTap: () {
//                                                 setState(() {
//                                                   isdropdownSoilType =
//                                                       !isdropdownSoilType;
//                                                 });
//                                               },
//                                               child: Icon(
//                                                 isdropdownSoilType
//                                                     ? Icons.arrow_drop_up
//                                                     : Icons.arrow_drop_down,
//                                                 size: 30.sp,
//                                                 color: Theme.of(context)
//                                                     .primaryColor,
//                                               ),
//                                             )
//                                           ],
//                                         ),
//                                         SizedBox(
//                                           height: 10.h,
//                                         ),
//                                         isdropdownSoilType
//                                             ? Wrap(
//                                                 spacing: 20.w,
//                                                 runSpacing: 20.h,
//                                                 children: [
//                                                   ...List.generate(
//                                                       2,
//                                                       (index) =>
//                                                           CustomRadioListTile(
//                                                             title: index == 0
//                                                                 ? 'قوية'
//                                                                 : 'متوسطة',
//                                                             value: index == 0
//                                                                 ? 0.02437
//                                                                 : 0.01716,
//                                                             groupValue:
//                                                                 soilTypegroupVal,
//                                                             onTap: () {
//                                                               setState(() {
//                                                                 soilTypegroupVal =
//                                                                     index == 0
//                                                                         ? 0.02437
//                                                                         : 0.01716;
//                                                                 isdropdownSoilType =
//                                                                     false;
//                                                               });
//                                                             },
//                                                           )),
//                                                 ],
//                                               )
//                                             : SizedBox()
//                                       ],
//                                     ),
//                                   ),
//                                   //soil-type label and options end
//                                   //floors-number label and options start
//                                   Padding(
//                                     padding: EdgeInsets.only(bottom: 15.h),
//                                     child: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.start,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Row(
//                                           children: [
//                                             const FieldLabel(
//                                               label: 'عدد الأدوار',
//                                             ),
//                                             SizedBox(
//                                               width: 10.w,
//                                             ),
//                                             floorNogroupVal != null
//                                                 ? Text(
//                                                     floorNogroupVal == 1
//                                                         ? '1 دور'
//                                                         : floorNogroupVal == 2
//                                                             ? '2 دور'
//                                                             : floorNogroupVal ==
//                                                                     3
//                                                                 ? '3 دور'
//                                                                 : floorNogroupVal ==
//                                                                         4
//                                                                     ? '4 دور'
//                                                                     : '5 دور',
//                                                     style: TextStyle(
//                                                         color: Colors.black,
//                                                         fontSize: 16.sp),
//                                                   )
//                                                 : SizedBox(),
//                                             SizedBox(
//                                               width: 20.w,
//                                             ),
//                                             InkWell(
//                                               focusColor: Theme.of(context)
//                                                   .primaryColor
//                                                   .withOpacity(0.1),
//                                               hoverColor: Theme.of(context)
//                                                   .primaryColor
//                                                   .withOpacity(0.1),
//                                               highlightColor: Theme.of(context)
//                                                   .primaryColor
//                                                   .withOpacity(0.1),
//                                               splashColor: Theme.of(context)
//                                                   .primaryColor
//                                                   .withOpacity(0.1),
//                                               borderRadius:
//                                                   BorderRadius.circular(5),
//                                               onTap: () {
//                                                 setState(() {
//                                                   isdropdownFloorNo =
//                                                       !isdropdownFloorNo;
//                                                 });
//                                               },
//                                               child: Icon(
//                                                 isdropdownFloorNo
//                                                     ? Icons.arrow_drop_up
//                                                     : Icons.arrow_drop_down,
//                                                 size: 30.sp,
//                                                 color: Theme.of(context)
//                                                     .primaryColor,
//                                               ),
//                                             )
//                                           ],
//                                         ),
//                                         SizedBox(
//                                           height: 10.h,
//                                         ),
//                                         isdropdownFloorNo
//                                             ? Wrap(
//                                                 spacing: 20.w,
//                                                 runSpacing: 20.h,
//                                                 children: [
//                                                   ...List.generate(
//                                                       5,
//                                                       (index) =>
//                                                           CustomRadioListTile(
//                                                             title: index == 0
//                                                                 ? '1 دور'
//                                                                 : index == 1
//                                                                     ? '2 دور'
//                                                                     : index == 2
//                                                                         ? '3 دور'
//                                                                         : index ==
//                                                                                 3
//                                                                             ? '4 دور'
//                                                                             : '5 دور',
//                                                             value: index + 1,
//                                                             groupValue:
//                                                                 floorNogroupVal,
//                                                             onTap: () {
//                                                               setState(() {
//                                                                 floorNogroupVal =
//                                                                     index + 1;
//                                                                 if (index ==
//                                                                     0) {
//                                                                   isAttachedFloorgroupVal =
//                                                                       null;
//                                                                 }
//                                                                 listenerOfCalucateBildingTotalAreas(
//                                                                     bildingTotalAreasCtrl,
//                                                                     [
//                                                                       groundFloorAreaCtrl,
//                                                                       firstRepeatedFloorAreaCtrl,
//                                                                       secondRepeatedFloorAreaCtrl,
//                                                                       thirdRepeatedFloorAreaCtrl,
//                                                                       fourthRepeatedFloorAreaCtrl
//                                                                     ],
//                                                                     floorNogroupVal);
//                                                                 isdropdownFloorNo =
//                                                                     false;
//                                                               });
//                                                             },
//                                                           )),
//                                                 ],
//                                               )
//                                             : SizedBox()
//                                       ],
//                                     ),
//                                   ),
//                                   //floors-number label and options end
//                                 ],
//                               )
//                             : const SizedBox(),
//                         //building-area label and field,soil-type label and options,floors-number label and options end

//                         floorNogroupVal != null && floorNogroupVal != 1
//                             ?
//                             //is there attached floor? start
//                             Padding(
//                                 padding: EdgeInsets.only(bottom: 15.h),
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Row(
//                                       children: [
//                                         Icon(Icons.contact_support_rounded,
//                                             color:
//                                                 Theme.of(context).primaryColor),
//                                         SizedBox(
//                                           width: 5.w,
//                                         ),
//                                         Text(
//                                           'هل يوجد دور ملحق؟',
//                                           style: TextStyle(
//                                               color: Colors.black,
//                                               fontSize: 16.sp),
//                                         ),
//                                         SizedBox(
//                                           width: 10.w,
//                                         ),
//                                         isAttachedFloorgroupVal != null
//                                             ? Text(
//                                                 isAttachedFloorgroupVal == true
//                                                     ? 'نعم'
//                                                     : 'لا',
//                                                 style: TextStyle(
//                                                     color: Colors.black,
//                                                     fontSize: 16.sp),
//                                               )
//                                             : SizedBox(),
//                                         SizedBox(
//                                           width: 20.w,
//                                         ),
//                                         InkWell(
//                                           focusColor: Theme.of(context)
//                                               .primaryColor
//                                               .withOpacity(0.1),
//                                           hoverColor: Theme.of(context)
//                                               .primaryColor
//                                               .withOpacity(0.1),
//                                           highlightColor: Theme.of(context)
//                                               .primaryColor
//                                               .withOpacity(0.1),
//                                           splashColor: Theme.of(context)
//                                               .primaryColor
//                                               .withOpacity(0.1),
//                                           borderRadius:
//                                               BorderRadius.circular(5),
//                                           onTap: () {
//                                             setState(() {
//                                               isdropdowniSAttachedFloor =
//                                                   !isdropdowniSAttachedFloor;
//                                             });
//                                           },
//                                           child: Icon(
//                                             isdropdowniSAttachedFloor
//                                                 ? Icons.arrow_drop_up
//                                                 : Icons.arrow_drop_down,
//                                             size: 30.sp,
//                                             color:
//                                                 Theme.of(context).primaryColor,
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                     SizedBox(
//                                       height: 10.h,
//                                     ),
//                                     isdropdowniSAttachedFloor
//                                         ? Wrap(
//                                             spacing: 20.w,
//                                             runSpacing: 20.h,
//                                             children: [
//                                               ...List.generate(
//                                                   2,
//                                                   (index) =>
//                                                       CustomRadioListTile(
//                                                         title: index == 0
//                                                             ? 'نعم'
//                                                             : 'لا',
//                                                         value: index == 0
//                                                             ? true
//                                                             : false,
//                                                         groupValue:
//                                                             isAttachedFloorgroupVal,
//                                                         onTap: () {
//                                                           setState(() {
//                                                             isAttachedFloorgroupVal =
//                                                                 index == 0
//                                                                     ? true
//                                                                     : false;
//                                                             isdropdowniSAttachedFloor =
//                                                                 false;
//                                                           });
//                                                         },
//                                                       )),
//                                             ],
//                                           )
//                                         : SizedBox(),
//                                   ],
//                                 ),
//                               )
//                             //is there attached floor? end
//                             : const SizedBox(),
//                         isAttachedFloorgroupVal == true &&
//                                 isHaveCompleteChartsgroupVal == true
//                             ?
//                             //ground-floor and repeated-floors labels and fields start
//                             Column(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   ...List.generate(
//                                       floorNogroupVal! - 1,
//                                       (index) => Padding(
//                                             padding:
//                                                 EdgeInsets.only(bottom: 15.h),
//                                             child: Column(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.start,
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                               children: [
//                                                 FieldLabel(
//                                                   label: index ==
//                                                           floorNogroupVal! - 2
//                                                       ? 'مساحة الدور الملحق (م²)'
//                                                       : index == 0
//                                                           ? 'مساحة الدور المتكرر الأول (م²)'
//                                                           : index == 1
//                                                               ? 'مساحة الدور المتكرر الثاني (م²)'
//                                                               : index == 2
//                                                                   ? 'مساحة الدور المتكرر الثالث (م²)'
//                                                                   : '',
//                                                 ),
//                                                 SizedBox(
//                                                   height: 10.h,
//                                                 ),
//                                                 TextFormField(
//                                                   controller: index == 0
//                                                       ? firstRepeatedFloorAreaCtrl
//                                                       : index == 1
//                                                           ? secondRepeatedFloorAreaCtrl
//                                                           : index == 2
//                                                               ? thirdRepeatedFloorAreaCtrl
//                                                               : fourthRepeatedFloorAreaCtrl,
//                                                   textAlign: TextAlign.center,
//                                                   style: TextStyle(
//                                                       fontSize: 16.sp,
//                                                       color: Colors.black,
//                                                       fontWeight:
//                                                           FontWeight.bold),
//                                                   onTap: () {},
//                                                   //onChanged: (value) {},
//                                                   keyboardType:
//                                                       const TextInputType
//                                                           .numberWithOptions(
//                                                           decimal: true,
//                                                           signed: false),

//                                                   textInputAction:
//                                                       TextInputAction.done,
//                                                   inputFormatters: [
//                                                     FilteringTextInputFormatter
//                                                         .allow(
//                                                             RegExp(r"[0-9.]")),
//                                                     TextInputFormatter
//                                                         .withFunction((oldValue,
//                                                             newValue) {
//                                                       final text =
//                                                           newValue.text;
//                                                       return text.isEmpty
//                                                           ? newValue
//                                                           : double.tryParse(
//                                                                       text) ==
//                                                                   null
//                                                               ? oldValue
//                                                               : newValue;
//                                                     }),
//                                                   ],
//                                                   showCursor: true,
//                                                   readOnly: false,

//                                                   // onFieldSubmitted: (value) {},
//                                                   onTapOutside: index == 0
//                                                       ? null
//                                                       : (event) => FocusManager
//                                                           .instance.primaryFocus
//                                                           ?.unfocus(),
//                                                   cursorColor: Theme.of(context)
//                                                       .secondaryHeaderColor,
//                                                   decoration: InputDecoration(
//                                                     hintText: index ==
//                                                             floorNogroupVal! - 2
//                                                         ? 'مساحة الدور الملحق (م²)'
//                                                         : index == 0
//                                                             ? 'مساحة الدور المتكرر الأول (م²)'
//                                                             : index == 1
//                                                                 ? 'مساحة الدور المتكرر الثاني (م²)'
//                                                                 : index == 2
//                                                                     ? 'مساحة الدور المتكرر الثالث (م²)'
//                                                                     : '',
//                                                     hintStyle: TextStyle(
//                                                         fontSize: 16.sp,
//                                                         color: Theme.of(context)
//                                                             .primaryColor
//                                                             .withOpacity(0.5),
//                                                         fontWeight:
//                                                             FontWeight.normal),
//                                                     contentPadding:
//                                                         EdgeInsets.symmetric(
//                                                             vertical: 5.h,
//                                                             horizontal: 15.w),
//                                                     filled: true,
//                                                     fillColor: Theme.of(context)
//                                                         .primaryColor
//                                                         .withOpacity(0.1),
//                                                     enabledBorder:
//                                                         const OutlineInputBorder(
//                                                       borderRadius:
//                                                           BorderRadius.all(
//                                                               Radius.circular(
//                                                                   24.0)),
//                                                       borderSide:
//                                                           BorderSide.none,
//                                                     ),
//                                                     focusedBorder:
//                                                         OutlineInputBorder(
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               24.0),
//                                                       borderSide:
//                                                           BorderSide.none,
//                                                     ),
//                                                     errorBorder:
//                                                         OutlineInputBorder(
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               24.0),
//                                                       borderSide:
//                                                           BorderSide.none,
//                                                     ),
//                                                     focusedErrorBorder:
//                                                         OutlineInputBorder(
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               24.0),
//                                                       borderSide:
//                                                           BorderSide.none,
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           )),
//                                 ],
//                               )
//                             //ground-floor and repeated-floors labels and fields end
//                             : isAttachedFloorgroupVal == false &&
//                                     isHaveCompleteChartsgroupVal == true
//                                 ?
//                                 //ground-floor and repeated-floors labels and fields start
//                                 Column(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       ...List.generate(
//                                           floorNogroupVal! - 1,
//                                           (index) => Padding(
//                                                 padding: EdgeInsets.only(
//                                                     bottom: 15.h),
//                                                 child: Column(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment.start,
//                                                   crossAxisAlignment:
//                                                       CrossAxisAlignment.start,
//                                                   children: [
//                                                     FieldLabel(
//                                                       label: index == 0
//                                                           ? 'مساحة الدور المتكرر الأول (م²)'
//                                                           : index == 1
//                                                               ? 'مساحة الدور المتكرر الثاني (م²)'
//                                                               : index == 2
//                                                                   ? 'مساحة الدور المتكرر الثالث (م²)'
//                                                                   : 'مساحة الدور المتكرر الرابع (م²)',
//                                                     ),
//                                                     SizedBox(
//                                                       height: 10.h,
//                                                     ),
//                                                     TextFormField(
//                                                       controller: index == 0
//                                                           ? firstRepeatedFloorAreaCtrl
//                                                           : index == 1
//                                                               ? secondRepeatedFloorAreaCtrl
//                                                               : index == 2
//                                                                   ? thirdRepeatedFloorAreaCtrl
//                                                                   : fourthRepeatedFloorAreaCtrl,
//                                                       textAlign:
//                                                           TextAlign.center,
//                                                       style: TextStyle(
//                                                           fontSize: 16.sp,
//                                                           color: Colors.black,
//                                                           fontWeight:
//                                                               FontWeight.bold),
//                                                       onTap: () {},
//                                                       //onChanged: (value) {},
//                                                       keyboardType:
//                                                           const TextInputType
//                                                               .numberWithOptions(
//                                                               decimal: true,
//                                                               signed: false),

//                                                       textInputAction:
//                                                           TextInputAction.done,
//                                                       inputFormatters: [
//                                                         FilteringTextInputFormatter
//                                                             .allow(RegExp(
//                                                                 r"[0-9.]")),
//                                                         TextInputFormatter
//                                                             .withFunction(
//                                                                 (oldValue,
//                                                                     newValue) {
//                                                           final text =
//                                                               newValue.text;
//                                                           return text.isEmpty
//                                                               ? newValue
//                                                               : double.tryParse(
//                                                                           text) ==
//                                                                       null
//                                                                   ? oldValue
//                                                                   : newValue;
//                                                         }),
//                                                       ],
//                                                       showCursor: true,
//                                                       readOnly: false,

//                                                       // onFieldSubmitted: (value) {},
//                                                       onTapOutside: (event) =>
//                                                           FocusManager.instance
//                                                               .primaryFocus
//                                                               ?.unfocus(),
//                                                       cursorColor: Theme.of(
//                                                               context)
//                                                           .secondaryHeaderColor,
//                                                       decoration:
//                                                           InputDecoration(
//                                                         hintText: index == 0
//                                                             ? 'مساحة الدور المتكرر الأول (م²)'
//                                                             : index == 1
//                                                                 ? 'مساحة الدور المتكرر الثاني (م²)'
//                                                                 : index == 2
//                                                                     ? 'مساحة الدور المتكرر الثالث (م²)'
//                                                                     : 'مساحة الدور المتكرر الرابع (م²)',
//                                                         hintStyle: TextStyle(
//                                                             fontSize: 16.sp,
//                                                             color: Theme.of(
//                                                                     context)
//                                                                 .primaryColor
//                                                                 .withOpacity(
//                                                                     0.5),
//                                                             fontWeight:
//                                                                 FontWeight
//                                                                     .normal),
//                                                         contentPadding:
//                                                             EdgeInsets
//                                                                 .symmetric(
//                                                                     vertical:
//                                                                         5.h,
//                                                                     horizontal:
//                                                                         15.w),
//                                                         filled: true,
//                                                         fillColor: Theme.of(
//                                                                 context)
//                                                             .primaryColor
//                                                             .withOpacity(0.1),
//                                                         enabledBorder:
//                                                             const OutlineInputBorder(
//                                                           borderRadius:
//                                                               BorderRadius.all(
//                                                                   Radius
//                                                                       .circular(
//                                                                           24.0)),
//                                                           borderSide:
//                                                               BorderSide.none,
//                                                         ),
//                                                         focusedBorder:
//                                                             OutlineInputBorder(
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                       24.0),
//                                                           borderSide:
//                                                               BorderSide.none,
//                                                         ),
//                                                         errorBorder:
//                                                             OutlineInputBorder(
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                       24.0),
//                                                           borderSide:
//                                                               BorderSide.none,
//                                                         ),
//                                                         focusedErrorBorder:
//                                                             OutlineInputBorder(
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                       24.0),
//                                                           borderSide:
//                                                               BorderSide.none,
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               )),
//                                     ],
//                                   )
//                                 //ground-floor and repeated-floors labels and fields end
//                                 : const SizedBox(),
//                         //Protrusion-number label and options start
//                         floorNogroupVal != null &&
//                                 floorNogroupVal != 1 &&
//                                 isHaveCompleteChartsgroupVal == false
//                             ? Padding(
//                                 padding: EdgeInsets.only(bottom: 15.h),
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Row(
//                                       children: [
//                                         const FieldLabel(
//                                           label: 'عدد البروز',
//                                         ),
//                                         SizedBox(
//                                           width: 10.w,
//                                         ),
//                                         protrusionNogroupVal != null
//                                             ? Text(
//                                                 protrusionNogroupVal == 0
//                                                     ? 'بدون بروز'
//                                                     : protrusionNogroupVal == 1
//                                                         ? '1 بروز'
//                                                         : protrusionNogroupVal ==
//                                                                 2
//                                                             ? '2 بروز'
//                                                             : protrusionNogroupVal ==
//                                                                     3
//                                                                 ? '3 بروز'
//                                                                 : '4 بروز',
//                                                 style: TextStyle(
//                                                     color: Colors.black,
//                                                     fontSize: 16.sp),
//                                               )
//                                             : SizedBox(),
//                                         SizedBox(
//                                           width: 20.w,
//                                         ),
//                                         InkWell(
//                                           focusColor: Theme.of(context)
//                                               .primaryColor
//                                               .withOpacity(0.1),
//                                           hoverColor: Theme.of(context)
//                                               .primaryColor
//                                               .withOpacity(0.1),
//                                           highlightColor: Theme.of(context)
//                                               .primaryColor
//                                               .withOpacity(0.1),
//                                           splashColor: Theme.of(context)
//                                               .primaryColor
//                                               .withOpacity(0.1),
//                                           borderRadius:
//                                               BorderRadius.circular(5),
//                                           onTap: () {
//                                             setState(() {
//                                               isdropdownProtrusionNo =
//                                                   !isdropdownProtrusionNo;
//                                             });
//                                           },
//                                           child: Icon(
//                                             isdropdownProtrusionNo
//                                                 ? Icons.arrow_drop_up
//                                                 : Icons.arrow_drop_down,
//                                             size: 30.sp,
//                                             color:
//                                                 Theme.of(context).primaryColor,
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                     SizedBox(
//                                       height: 10.h,
//                                     ),
//                                     isdropdownProtrusionNo
//                                         ? Wrap(
//                                             spacing: 20.w,
//                                             runSpacing: 20.h,
//                                             children: [
//                                               ...List.generate(
//                                                   5,
//                                                   (index) =>
//                                                       CustomRadioListTile(
//                                                         title: index == 0
//                                                             ? 'بدون بروز'
//                                                             : index == 1
//                                                                 ? '1 بروز'
//                                                                 : index == 2
//                                                                     ? '2 بروز'
//                                                                     : index == 3
//                                                                         ? '3 بروز'
//                                                                         : '4 بروز',
//                                                         value: index,
//                                                         groupValue:
//                                                             protrusionNogroupVal,
//                                                         onTap: () {
//                                                           setState(() {
//                                                             protrusionNogroupVal =
//                                                                 index;
//                                                             if (index == 4) {
//                                                               protrusionPositiongroupVal =
//                                                                   ProtrusionPosition
//                                                                       .llww;
//                                                             } else {
//                                                               protrusionPositiongroupVal =
//                                                                   null;
//                                                             }
//                                                             isdropdownProtrusionNo =
//                                                                 false;
//                                                           });
//                                                         },
//                                                       )),
//                                             ],
//                                           )
//                                         : SizedBox()
//                                   ],
//                                 ),
//                               )
//                             : const SizedBox(),
//                         //Protrusion-number label and options end
//                         //protrusion-positions label and options start
//                         protrusionNogroupVal == null ||
//                                 protrusionNogroupVal == 0
//                             ? const SizedBox()
//                             : Padding(
//                                 padding: EdgeInsets.only(bottom: 15.h),
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Row(
//                                       children: [
//                                         const FieldLabel(
//                                           label: 'مواضع البروز',
//                                         ),
//                                         SizedBox(
//                                           width: 10.w,
//                                         ),
//                                         protrusionPositiongroupVal != null
//                                             ? Text(
//                                                 protrusionPositiongroupVal!
//                                                     .name,
//                                                 style: TextStyle(
//                                                     color: Colors.black,
//                                                     fontSize: 16.sp),
//                                               )
//                                             : SizedBox(),
//                                         SizedBox(
//                                           width: 20.w,
//                                         ),
//                                         InkWell(
//                                           focusColor: Theme.of(context)
//                                               .primaryColor
//                                               .withOpacity(0.1),
//                                           hoverColor: Theme.of(context)
//                                               .primaryColor
//                                               .withOpacity(0.1),
//                                           highlightColor: Theme.of(context)
//                                               .primaryColor
//                                               .withOpacity(0.1),
//                                           splashColor: Theme.of(context)
//                                               .primaryColor
//                                               .withOpacity(0.1),
//                                           borderRadius:
//                                               BorderRadius.circular(5),
//                                           onTap: () {
//                                             setState(() {
//                                               isdropdownProtrusionPosition =
//                                                   !isdropdownProtrusionPosition;
//                                             });
//                                           },
//                                           child: Icon(
//                                             isdropdownProtrusionPosition
//                                                 ? Icons.arrow_drop_up
//                                                 : Icons.arrow_drop_down,
//                                             size: 30.sp,
//                                             color:
//                                                 Theme.of(context).primaryColor,
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                     protrusionNogroupVal == 1 &&
//                                             isdropdownProtrusionPosition
//                                         ? Column(
//                                             children: [
//                                               Text(
//                                                   'ل: من الجهة الطويلة, ع: من الجهة القصيرة'),
//                                               SizedBox(
//                                                 height: 10.h,
//                                               ),
//                                               Wrap(
//                                                 spacing: 20.w,
//                                                 runSpacing: 20.h,
//                                                 children: [
//                                                   ...List.generate(
//                                                       2,
//                                                       (index) =>
//                                                           FloorFiguresRadioListTile(
//                                                             protrusion: index ==
//                                                                     0
//                                                                 ? const ProtrusionL()
//                                                                 : const ProtrusionW(),
//                                                             value: index == 0
//                                                                 ? ProtrusionPosition
//                                                                     .l
//                                                                 : ProtrusionPosition
//                                                                     .w,
//                                                             groupValue:
//                                                                 protrusionPositiongroupVal,
//                                                             onTap: () {
//                                                               setState(() {
//                                                                 protrusionPositiongroupVal =
//                                                                     index == 0
//                                                                         ? ProtrusionPosition
//                                                                             .l
//                                                                         : ProtrusionPosition
//                                                                             .w;
//                                                                 isdropdownProtrusionPosition =
//                                                                     false;
//                                                               });
//                                                             },
//                                                           )),
//                                                 ],
//                                               ),
//                                             ],
//                                           )
//                                         : protrusionNogroupVal == 2 &&
//                                                 isdropdownProtrusionPosition
//                                             ? Wrap(
//                                                 spacing: 20.w,
//                                                 runSpacing: 20.h,
//                                                 children: [
//                                                   ...List.generate(
//                                                       3,
//                                                       (index) =>
//                                                           FloorFiguresRadioListTile(
//                                                             protrusion: index ==
//                                                                     0
//                                                                 ? const ProtrusionLL()
//                                                                 : index == 1
//                                                                     ? const ProtrusionWW()
//                                                                     : const ProtrusionWL(),
//                                                             value: index == 0
//                                                                 ? ProtrusionPosition
//                                                                     .ll
//                                                                 : index == 1
//                                                                     ? ProtrusionPosition
//                                                                         .ww
//                                                                     : ProtrusionPosition
//                                                                         .wl,
//                                                             groupValue:
//                                                                 protrusionPositiongroupVal,
//                                                             onTap: () {
//                                                               setState(() {
//                                                                 protrusionPositiongroupVal = index ==
//                                                                         0
//                                                                     ? ProtrusionPosition
//                                                                         .ll
//                                                                     : index == 1
//                                                                         ? ProtrusionPosition
//                                                                             .ww
//                                                                         : ProtrusionPosition
//                                                                             .wl;
//                                                                 isdropdownProtrusionPosition =
//                                                                     false;
//                                                               });
//                                                             },
//                                                           )),
//                                                 ],
//                                               )
//                                             : protrusionNogroupVal == 3 &&
//                                                     isdropdownProtrusionPosition
//                                                 ? Wrap(
//                                                     spacing: 20.w,
//                                                     runSpacing: 20.h,
//                                                     children: [
//                                                       ...List.generate(
//                                                           2,
//                                                           (index) =>
//                                                               FloorFiguresRadioListTile(
//                                                                 protrusion: index ==
//                                                                         0
//                                                                     ? const ProtrusionLLW()
//                                                                     : const ProtrusionWWL(),
//                                                                 value: index ==
//                                                                         0
//                                                                     ? ProtrusionPosition
//                                                                         .llw
//                                                                     : ProtrusionPosition
//                                                                         .wwl,
//                                                                 groupValue:
//                                                                     protrusionPositiongroupVal,
//                                                                 onTap: () {
//                                                                   setState(() {
//                                                                     protrusionPositiongroupVal = index ==
//                                                                             0
//                                                                         ? ProtrusionPosition
//                                                                             .llw
//                                                                         : ProtrusionPosition
//                                                                             .wwl;
//                                                                     isdropdownProtrusionPosition =
//                                                                         false;
//                                                                   });
//                                                                 },
//                                                               )),
//                                                     ],
//                                                   )
//                                                 : isdropdownProtrusionPosition
//                                                     ? Wrap(
//                                                         spacing: 20.w,
//                                                         runSpacing: 20.h,
//                                                         children: [
//                                                           ...List.generate(
//                                                               1,
//                                                               (index) =>
//                                                                   FloorFiguresRadioListTile(
//                                                                     protrusion:
//                                                                         const ProtrusionLLWW(),
//                                                                     value:
//                                                                         ProtrusionPosition
//                                                                             .llww,
//                                                                     groupValue:
//                                                                         protrusionPositiongroupVal,
//                                                                     onTap: () {
//                                                                       setState(
//                                                                           () {
//                                                                         protrusionPositiongroupVal =
//                                                                             ProtrusionPosition.llww;
//                                                                         isdropdownProtrusionPosition =
//                                                                             false;
//                                                                       });
//                                                                     },
//                                                                   )),
//                                                         ],
//                                                       )
//                                                     : SizedBox()
//                                   ],
//                                 ),
//                               ),
//                         //protrusion-positions label and options end
//                         //building total areas label and field start
//                         isHaveCompleteChartsgroupVal == true
//                             ? Padding(
//                                 padding: EdgeInsets.only(bottom: 15.h),
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     const FieldLabel(
//                                       label: 'مجموع المساحات (م²)',
//                                     ),
//                                     SizedBox(
//                                       height: 10.h,
//                                     ),
//                                     TextFormField(
//                                       controller: bildingTotalAreasCtrl,
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                           fontSize: 16.sp,
//                                           color: Colors.white,
//                                           fontWeight: FontWeight.bold),
//                                       // onTap: () {},
//                                       //onChanged: (value) {},
//                                       // keyboardType:
//                                       //     const TextInputType.numberWithOptions(
//                                       //         decimal: true, signed: false),

//                                       // textInputAction: TextInputAction.done,
//                                       // inputFormatters: [
//                                       //   FilteringTextInputFormatter.allow(
//                                       //       RegExp(r"[0-9.]")),
//                                       //   TextInputFormatter.withFunction(
//                                       //       (oldValue, newValue) {
//                                       //     final text = newValue.text;
//                                       //     return text.isEmpty
//                                       //         ? newValue
//                                       //         : double.tryParse(text) == null
//                                       //             ? oldValue
//                                       //             : newValue;
//                                       //   }),
//                                       // ],
//                                       showCursor: false,
//                                       readOnly: true,

//                                       // onFieldSubmitted: (value) {},
//                                       // onTapOutside: (event) =>
//                                       //     FocusManager.instance.primaryFocus?.unfocus(),

//                                       decoration: InputDecoration(
//                                         // hintStyle: TextStyle(
//                                         //     fontSize: 16.sp,
//                                         //     color: const Color(0xFF90A4AE),
//                                         //     fontWeight: FontWeight.normal),
//                                         contentPadding: EdgeInsets.symmetric(
//                                             vertical: 5.h, horizontal: 15.w),
//                                         filled: true,
//                                         fillColor: Theme.of(context)
//                                             .primaryColor
//                                             .withOpacity(0.1),

//                                         enabledBorder: const OutlineInputBorder(
//                                           borderRadius: BorderRadius.all(
//                                               Radius.circular(10.0)),
//                                           borderSide: BorderSide.none,
//                                         ),
//                                         focusedBorder: OutlineInputBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(10.0),
//                                           borderSide: BorderSide.none,
//                                         ),
//                                         errorBorder: OutlineInputBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(10.0),
//                                           borderSide: BorderSide.none,
//                                         ),
//                                         focusedErrorBorder: OutlineInputBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(10.0),
//                                           borderSide: BorderSide.none,
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               )
//                             : const SizedBox(),
//                         //building total areas label and field end
//                         //owner label and field start
//                         Padding(
//                           padding: EdgeInsets.only(bottom: 15.h),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               const FieldLabel(
//                                 label: 'اسم المالك',
//                               ),
//                               SizedBox(
//                                 height: 10.h,
//                               ),
//                               TextFormField(
//                                 controller: ownerCtrl,
//                                 textAlign: TextAlign.start,
//                                 style: TextStyle(
//                                     fontSize: 16.sp,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold),
//                                 onTap: () {},
//                                 //onChanged: (value) {},
//                                 keyboardType: TextInputType.name,
//                                 textInputAction: TextInputAction.done,
//                                 showCursor: true,
//                                 readOnly: false,
//                                 // onFieldSubmitted: (value) {},
//                                 onTapOutside: (event) => FocusManager
//                                     .instance.primaryFocus
//                                     ?.unfocus(),
//                                 cursorColor:
//                                     Theme.of(context).secondaryHeaderColor,
//                                 decoration: InputDecoration(
//                                   hintText: 'اسم المالك',
//                                   hintStyle: TextStyle(
//                                       fontSize: 16.sp,
//                                       color: Theme.of(context)
//                                           .primaryColor
//                                           .withOpacity(0.5),
//                                       fontWeight: FontWeight.normal),
//                                   contentPadding: EdgeInsets.symmetric(
//                                       vertical: 5.h, horizontal: 15.w),
//                                   filled: true,
//                                   fillColor: Theme.of(context)
//                                       .primaryColor
//                                       .withOpacity(0.1),
//                                   enabledBorder: const OutlineInputBorder(
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(10.0)),
//                                     borderSide: BorderSide.none,
//                                   ),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10.0),
//                                     borderSide: BorderSide.none,
//                                   ),
//                                   errorBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10.0),
//                                     borderSide: BorderSide.none,
//                                   ),
//                                   focusedErrorBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10.0),
//                                     borderSide: BorderSide.none,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         //owner label and field end
//                         SizedBox(
//                           height: 15.h,
//                         ),
//                         SizedBox(
//                           width: double.infinity,
//                           height: 50.h,
//                           child: ElevatedButton(
//                               style: ElevatedButton.styleFrom(
//                                   foregroundColor: Colors.white,
//                                   backgroundColor:
//                                       Theme.of(context).primaryColor,
//                                   shape: RoundedRectangleBorder(
//                                       borderRadius:
//                                           BorderRadius.circular(10.sp))),
//                               onPressed: () {
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (_) =>
//                                           const UnderGroundWorksPDFViewer(),
//                                     ));
//                               },
//                               child: Text(
//                                 'عرض النتائج',
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 16.sp,
//                                     fontWeight: FontWeight.bold),
//                               )),
//                         ),
//                         SizedBox(
//                           height: 20.h,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         )),
//       ),
//     );
//   }
// }

//without Have you completed charts? question
class HomePage extends StatefulWidget {
  final VoidCallback openDrawer;
  const HomePage({super.key, required this.openDrawer});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController groundFloorAreaCtrl = TextEditingController();
  TextEditingController firstRepeatedFloorAreaCtrl = TextEditingController();
  TextEditingController secondRepeatedFloorAreaCtrl = TextEditingController();
  TextEditingController thirdRepeatedFloorAreaCtrl = TextEditingController();
  TextEditingController fourthRepeatedFloorAreaCtrl = TextEditingController();
  TextEditingController attachedFloorCtrl = TextEditingController();
  //TextEditingController bildingTotalAreasCtrl = TextEditingController();
  TextEditingController ownerCtrl = TextEditingController();
  int? floorNogroupVal;
  double? soilTypegroupVal;
  bool? isAttachedFloorgroupVal;
  bool isdropdownSoilType = false;
  bool isdropdownFloorNo = false;
  bool isdropdowniSAttachedFloor = false;
  List<OptionsToDisplayResults> allOptionsToDisplayResults =
      List.empty(growable: true);
  List<OptionsToDisplayResults> selctedOptionsToDisplayResults =
      List.empty(growable: true);
  @override
  void initState() {
    // groundFloorAreaCtrl.addListener(() {
    //   listenerOfCalucateBildingTotalAreas(
    //       bildingTotalAreasCtrl,
    //       [
    //         groundFloorAreaCtrl,
    //         firstRepeatedFloorAreaCtrl,
    //         secondRepeatedFloorAreaCtrl,
    //         thirdRepeatedFloorAreaCtrl,
    //         fourthRepeatedFloorAreaCtrl
    //       ],
    //       floorNogroupVal);
    //   setState(() {});
    // });
    // firstRepeatedFloorAreaCtrl.addListener(() {
    //   listenerOfCalucateBildingTotalAreas(
    //       bildingTotalAreasCtrl,
    //       [
    //         groundFloorAreaCtrl,
    //         firstRepeatedFloorAreaCtrl,
    //         secondRepeatedFloorAreaCtrl,
    //         thirdRepeatedFloorAreaCtrl,
    //         fourthRepeatedFloorAreaCtrl
    //       ],
    //       floorNogroupVal);
    //   setState(() {});
    // });
    // secondRepeatedFloorAreaCtrl.addListener(() {
    //   listenerOfCalucateBildingTotalAreas(
    //       bildingTotalAreasCtrl,
    //       [
    //         groundFloorAreaCtrl,
    //         firstRepeatedFloorAreaCtrl,
    //         secondRepeatedFloorAreaCtrl,
    //         thirdRepeatedFloorAreaCtrl,
    //         fourthRepeatedFloorAreaCtrl
    //       ],
    //       floorNogroupVal);
    //   setState(() {});
    // });
    // thirdRepeatedFloorAreaCtrl.addListener(() {
    //   listenerOfCalucateBildingTotalAreas(
    //       bildingTotalAreasCtrl,
    //       [
    //         groundFloorAreaCtrl,
    //         firstRepeatedFloorAreaCtrl,
    //         secondRepeatedFloorAreaCtrl,
    //         thirdRepeatedFloorAreaCtrl,
    //         fourthRepeatedFloorAreaCtrl
    //       ],
    //       floorNogroupVal);
    //   setState(() {});
    // });
    // fourthRepeatedFloorAreaCtrl.addListener(() {
    //   listenerOfCalucateBildingTotalAreas(
    //       bildingTotalAreasCtrl,
    //       [
    //         groundFloorAreaCtrl,
    //         firstRepeatedFloorAreaCtrl,
    //         secondRepeatedFloorAreaCtrl,
    //         thirdRepeatedFloorAreaCtrl,
    //         fourthRepeatedFloorAreaCtrl
    //       ],
    //       floorNogroupVal);
    //   setState(() {});
    //});

    super.initState();
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
                      onPressed: () => widget.openDrawer(),
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
                        'حساب الجدول الزمني للمشاريع السكنية',
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
                  padding: EdgeInsets.only(
                      left: 20.w, right: 20.w, top: 20.h, bottom: 5.h),
                  child: Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 15.h),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const FieldLabel(
                                label: 'مساحة الدور الأرضي (م²)',
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
                                onChanged: (value) {
                                  setState(() {});
                                },
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
                                cursorColor:
                                    Theme.of(context).secondaryHeaderColor,
                                decoration: InputDecoration(
                                  hintText: 'ادخل مساحة البناء (م²)',
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
                        ),
                        //building-area label and field end

                        //soil-type label and options start
                        Padding(
                          padding: EdgeInsets.only(bottom: 15.h),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const FieldLabel(
                                    label: 'نوع التربة',
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  soilTypegroupVal != null
                                      ? Text(
                                          soilTypegroupVal == 0.02437
                                              ? 'قوية'
                                              : soilTypegroupVal == 0.01716
                                                  ? 'متوسطة'
                                                  : '',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.sp),
                                        )
                                      : SizedBox(),
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  InkWell(
                                    focusColor: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.1),
                                    hoverColor: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.1),
                                    highlightColor: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.1),
                                    splashColor: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(5),
                                    onTap: () {
                                      setState(() {
                                        isdropdownSoilType =
                                            !isdropdownSoilType;
                                      });
                                    },
                                    child: Icon(
                                      isdropdownSoilType
                                          ? Icons.arrow_drop_up
                                          : Icons.arrow_drop_down,
                                      size: 30.sp,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              isdropdownSoilType
                                  ? Wrap(
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
                                                  groupValue: soilTypegroupVal,
                                                  onTap: () {
                                                    setState(() {
                                                      soilTypegroupVal =
                                                          index == 0
                                                              ? 0.02437
                                                              : 0.01716;
                                                      isdropdownSoilType =
                                                          false;
                                                    });
                                                  },
                                                )),
                                      ],
                                    )
                                  : SizedBox()
                            ],
                          ),
                        ),
                        //soil-type label and options end
                        //floors-number label and options start
                        Padding(
                          padding: EdgeInsets.only(bottom: 15.h),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const FieldLabel(
                                    label: 'عدد الأدوار',
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  floorNogroupVal != null
                                      ? Text(
                                          floorNogroupVal == 1
                                              ? '1 دور'
                                              : floorNogroupVal == 2
                                                  ? '2 دور'
                                                  : floorNogroupVal == 3
                                                      ? '3 دور'
                                                      : floorNogroupVal == 4
                                                          ? '4 دور'
                                                          : '5 دور',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.sp),
                                        )
                                      : SizedBox(),
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  InkWell(
                                    focusColor: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.1),
                                    hoverColor: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.1),
                                    highlightColor: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.1),
                                    splashColor: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(5),
                                    onTap: () {
                                      setState(() {
                                        isdropdownFloorNo = !isdropdownFloorNo;
                                      });
                                    },
                                    child: Icon(
                                      isdropdownFloorNo
                                          ? Icons.arrow_drop_up
                                          : Icons.arrow_drop_down,
                                      size: 30.sp,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              isdropdownFloorNo
                                  ? Wrap(
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
                                                      floorNogroupVal =
                                                          index + 1;

                                                      firstRepeatedFloorAreaCtrl
                                                          .clear();
                                                      secondRepeatedFloorAreaCtrl
                                                          .clear();
                                                      thirdRepeatedFloorAreaCtrl
                                                          .clear();
                                                      fourthRepeatedFloorAreaCtrl
                                                          .clear();
                                                      attachedFloorCtrl.clear();
                                                      isAttachedFloorgroupVal =
                                                          null;
                                                      // listenerOfCalucateBildingTotalAreas(
                                                      //     bildingTotalAreasCtrl,
                                                      //     [
                                                      //       groundFloorAreaCtrl,
                                                      //       firstRepeatedFloorAreaCtrl,
                                                      //       secondRepeatedFloorAreaCtrl,
                                                      //       thirdRepeatedFloorAreaCtrl,
                                                      //       fourthRepeatedFloorAreaCtrl
                                                      //     ],
                                                      //     floorNogroupVal);
                                                      isdropdownFloorNo = false;
                                                      allOptionsToDisplayResults
                                                          .clear();
                                                      selctedOptionsToDisplayResults
                                                          .clear();
                                                      if (index == 0) {
                                                        allOptionsToDisplayResults =
                                                            [
                                                          OptionsToDisplayResults
                                                              .undergroundWorks,
                                                          OptionsToDisplayResults
                                                              .groundFloor
                                                        ];
                                                      }
                                                    });
                                                  },
                                                )),
                                      ],
                                    )
                                  : SizedBox()
                            ],
                          ),
                        ),

                        floorNogroupVal != null && floorNogroupVal != 1
                            ?
                            //is there attached floor? start
                            Padding(
                                padding: EdgeInsets.only(bottom: 15.h),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.contact_support_rounded,
                                            color:
                                                Theme.of(context).primaryColor),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Text(
                                          'هل يوجد دور ملحق؟',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.sp),
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        isAttachedFloorgroupVal != null
                                            ? Text(
                                                isAttachedFloorgroupVal == true
                                                    ? 'نعم'
                                                    : 'لا',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16.sp),
                                              )
                                            : SizedBox(),
                                        SizedBox(
                                          width: 20.w,
                                        ),
                                        InkWell(
                                          focusColor: Theme.of(context)
                                              .primaryColor
                                              .withOpacity(0.1),
                                          hoverColor: Theme.of(context)
                                              .primaryColor
                                              .withOpacity(0.1),
                                          highlightColor: Theme.of(context)
                                              .primaryColor
                                              .withOpacity(0.1),
                                          splashColor: Theme.of(context)
                                              .primaryColor
                                              .withOpacity(0.1),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          onTap: () {
                                            setState(() {
                                              isdropdowniSAttachedFloor =
                                                  !isdropdowniSAttachedFloor;
                                            });
                                          },
                                          child: Icon(
                                            isdropdowniSAttachedFloor
                                                ? Icons.arrow_drop_up
                                                : Icons.arrow_drop_down,
                                            size: 30.sp,
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    isdropdowniSAttachedFloor
                                        ? Wrap(
                                            spacing: 20.w,
                                            runSpacing: 20.h,
                                            children: [
                                              ...List.generate(
                                                  2,
                                                  (index) =>
                                                      CustomRadioListTile(
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
                                                            isdropdowniSAttachedFloor =
                                                                false;
                                                            if (floorNogroupVal ==
                                                                2) {
                                                              allOptionsToDisplayResults =
                                                                  [
                                                                OptionsToDisplayResults
                                                                    .undergroundWorks,
                                                                OptionsToDisplayResults
                                                                    .groundFloor,
                                                                isAttachedFloorgroupVal ==
                                                                        true
                                                                    ? OptionsToDisplayResults
                                                                        .attachedFloor
                                                                    : OptionsToDisplayResults
                                                                        .firstFloor
                                                              ];

                                                              if (selctedOptionsToDisplayResults
                                                                  .contains(
                                                                      OptionsToDisplayResults
                                                                          .firstFloor)) {
                                                                selctedOptionsToDisplayResults.remove(
                                                                    OptionsToDisplayResults
                                                                        .firstFloor);
                                                                firstRepeatedFloorAreaCtrl
                                                                    .clear();
                                                              } else if (selctedOptionsToDisplayResults
                                                                  .contains(
                                                                      OptionsToDisplayResults
                                                                          .attachedFloor)) {
                                                                selctedOptionsToDisplayResults.remove(
                                                                    OptionsToDisplayResults
                                                                        .attachedFloor);
                                                                attachedFloorCtrl
                                                                    .clear();
                                                              }
                                                            } else if (floorNogroupVal ==
                                                                3) {
                                                              allOptionsToDisplayResults =
                                                                  [
                                                                OptionsToDisplayResults
                                                                    .undergroundWorks,
                                                                OptionsToDisplayResults
                                                                    .groundFloor,
                                                                OptionsToDisplayResults
                                                                    .firstFloor,
                                                                isAttachedFloorgroupVal ==
                                                                        true
                                                                    ? OptionsToDisplayResults
                                                                        .attachedFloor
                                                                    : OptionsToDisplayResults
                                                                        .secondFloor
                                                              ];
                                                              if (selctedOptionsToDisplayResults
                                                                  .contains(
                                                                      OptionsToDisplayResults
                                                                          .secondFloor)) {
                                                                selctedOptionsToDisplayResults.remove(
                                                                    OptionsToDisplayResults
                                                                        .secondFloor);
                                                                secondRepeatedFloorAreaCtrl
                                                                    .clear();
                                                              } else if (selctedOptionsToDisplayResults
                                                                  .contains(
                                                                      OptionsToDisplayResults
                                                                          .attachedFloor)) {
                                                                selctedOptionsToDisplayResults.remove(
                                                                    OptionsToDisplayResults
                                                                        .attachedFloor);
                                                                attachedFloorCtrl
                                                                    .clear();
                                                              }
                                                            } else if (floorNogroupVal ==
                                                                4) {
                                                              allOptionsToDisplayResults =
                                                                  [
                                                                OptionsToDisplayResults
                                                                    .undergroundWorks,
                                                                OptionsToDisplayResults
                                                                    .groundFloor,
                                                                OptionsToDisplayResults
                                                                    .firstFloor,
                                                                OptionsToDisplayResults
                                                                    .secondFloor,
                                                                isAttachedFloorgroupVal ==
                                                                        true
                                                                    ? OptionsToDisplayResults
                                                                        .attachedFloor
                                                                    : OptionsToDisplayResults
                                                                        .thirdFloor
                                                              ];
                                                              if (selctedOptionsToDisplayResults
                                                                  .contains(
                                                                      OptionsToDisplayResults
                                                                          .thirdFloor)) {
                                                                selctedOptionsToDisplayResults.remove(
                                                                    OptionsToDisplayResults
                                                                        .thirdFloor);
                                                                thirdRepeatedFloorAreaCtrl
                                                                    .clear();
                                                              } else if (selctedOptionsToDisplayResults
                                                                  .contains(
                                                                      OptionsToDisplayResults
                                                                          .attachedFloor)) {
                                                                selctedOptionsToDisplayResults.remove(
                                                                    OptionsToDisplayResults
                                                                        .attachedFloor);
                                                                attachedFloorCtrl
                                                                    .clear();
                                                              }
                                                            } else if (floorNogroupVal ==
                                                                5) {
                                                              allOptionsToDisplayResults =
                                                                  [
                                                                OptionsToDisplayResults
                                                                    .undergroundWorks,
                                                                OptionsToDisplayResults
                                                                    .groundFloor,
                                                                OptionsToDisplayResults
                                                                    .firstFloor,
                                                                OptionsToDisplayResults
                                                                    .secondFloor,
                                                                OptionsToDisplayResults
                                                                    .thirdFloor,
                                                                isAttachedFloorgroupVal ==
                                                                        true
                                                                    ? OptionsToDisplayResults
                                                                        .attachedFloor
                                                                    : OptionsToDisplayResults
                                                                        .fourthFloor
                                                              ];
                                                              if (selctedOptionsToDisplayResults
                                                                  .contains(
                                                                      OptionsToDisplayResults
                                                                          .fourthFloor)) {
                                                                selctedOptionsToDisplayResults.remove(
                                                                    OptionsToDisplayResults
                                                                        .fourthFloor);
                                                                fourthRepeatedFloorAreaCtrl
                                                                    .clear();
                                                              } else if (selctedOptionsToDisplayResults
                                                                  .contains(
                                                                      OptionsToDisplayResults
                                                                          .attachedFloor)) {
                                                                selctedOptionsToDisplayResults.remove(
                                                                    OptionsToDisplayResults
                                                                        .attachedFloor);
                                                                attachedFloorCtrl
                                                                    .clear();
                                                              }
                                                            }
                                                          });
                                                        },
                                                      )),
                                            ],
                                          )
                                        : SizedBox(),
                                  ],
                                ),
                              )
                            //is there attached floor? end
                            : const SizedBox(),
                        isAttachedFloorgroupVal == true
                            ?
                            //attached-floor and repeated-floors labels and fields start
                            Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ...List.generate(
                                      floorNogroupVal! - 1,
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
                                                  label: index ==
                                                          floorNogroupVal! - 2
                                                      ? 'مساحة الدور الملحق (م²)'
                                                      : index == 0
                                                          ? 'مساحة الدور المتكرر الأول (م²)'
                                                          : index == 1
                                                              ? 'مساحة الدور المتكرر الثاني (م²)'
                                                              : index == 2
                                                                  ? 'مساحة الدور المتكرر الثالث (م²)'
                                                                  : '',
                                                ),
                                                SizedBox(
                                                  height: 10.h,
                                                ),
                                                TextFormField(
                                                  controller: index ==
                                                          floorNogroupVal! - 2
                                                      ? attachedFloorCtrl
                                                      : index == 0
                                                          ? firstRepeatedFloorAreaCtrl
                                                          : index == 1
                                                              ? secondRepeatedFloorAreaCtrl
                                                              : index == 2
                                                                  ? thirdRepeatedFloorAreaCtrl
                                                                  : fourthRepeatedFloorAreaCtrl,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 16.sp,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  onTap: () {},
                                                  onChanged: (value) {
                                                    setState(() {});
                                                  },
                                                  keyboardType:
                                                      const TextInputType
                                                          .numberWithOptions(
                                                          decimal: true,
                                                          signed: false),

                                                  textInputAction:
                                                      TextInputAction.done,
                                                  inputFormatters: [
                                                    FilteringTextInputFormatter
                                                        .allow(
                                                            RegExp(r"[0-9.]")),
                                                    TextInputFormatter
                                                        .withFunction((oldValue,
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
                                                  showCursor: true,
                                                  readOnly: false,

                                                  // onFieldSubmitted: (value) {},
                                                  onTapOutside: index == 0
                                                      ? null
                                                      : (event) => FocusManager
                                                          .instance.primaryFocus
                                                          ?.unfocus(),
                                                  cursorColor: Theme.of(context)
                                                      .secondaryHeaderColor,
                                                  decoration: InputDecoration(
                                                    hintText: index ==
                                                            floorNogroupVal! - 2
                                                        ? 'مساحة الدور الملحق (م²)'
                                                        : index == 0
                                                            ? 'مساحة الدور المتكرر الأول (م²)'
                                                            : index == 1
                                                                ? 'مساحة الدور المتكرر الثاني (م²)'
                                                                : index == 2
                                                                    ? 'مساحة الدور المتكرر الثالث (م²)'
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
                            //attached-floor and repeated-floors labels and fields end
                            : isAttachedFloorgroupVal == false
                                ?
                                //repeated-floors labels and fields start
                                Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ...List.generate(
                                          floorNogroupVal! - 1,
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
                                                          ? 'مساحة الدور المتكرر الأول (م²)'
                                                          : index == 1
                                                              ? 'مساحة الدور المتكرر الثاني (م²)'
                                                              : index == 2
                                                                  ? 'مساحة الدور المتكرر الثالث (م²)'
                                                                  : 'مساحة الدور المتكرر الرابع (م²)',
                                                    ),
                                                    SizedBox(
                                                      height: 10.h,
                                                    ),
                                                    TextFormField(
                                                      controller: index == 0
                                                          ? firstRepeatedFloorAreaCtrl
                                                          : index == 1
                                                              ? secondRepeatedFloorAreaCtrl
                                                              : index == 2
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
                                                      onChanged: (value) {
                                                        setState(() {});
                                                      },
                                                      keyboardType:
                                                          const TextInputType
                                                              .numberWithOptions(
                                                              decimal: true,
                                                              signed: false),

                                                      textInputAction:
                                                          TextInputAction.done,
                                                      inputFormatters: [
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
                                                      showCursor: true,
                                                      readOnly: false,

                                                      // onFieldSubmitted: (value) {},
                                                      onTapOutside: (event) =>
                                                          FocusManager.instance
                                                              .primaryFocus
                                                              ?.unfocus(),
                                                      cursorColor: Theme.of(
                                                              context)
                                                          .secondaryHeaderColor,
                                                      decoration:
                                                          InputDecoration(
                                                        hintText: index == 0
                                                            ? 'مساحة الدور المتكرر الأول (م²)'
                                                            : index == 1
                                                                ? 'مساحة الدور المتكرر الثاني (م²)'
                                                                : index == 2
                                                                    ? 'مساحة الدور المتكرر الثالث (م²)'
                                                                    : 'مساحة الدور المتكرر الرابع (م²)',
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

                        //building total areas label and field start
                        // Padding(
                        //   padding: EdgeInsets.only(bottom: 15.h),
                        //   child: Column(
                        //     mainAxisAlignment: MainAxisAlignment.start,
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       const FieldLabel(
                        //         label: 'مجموع المساحات (م²)',
                        //       ),
                        //       SizedBox(
                        //         height: 10.h,
                        //       ),
                        //       TextFormField(
                        //         controller: bildingTotalAreasCtrl,
                        //         textAlign: TextAlign.center,
                        //         style: TextStyle(
                        //             fontSize: 16.sp,
                        //             color: Colors.white,
                        //             fontWeight: FontWeight.bold),
                        //         // onTap: () {},
                        //         //onChanged: (value) {},
                        //         // keyboardType:
                        //         //     const TextInputType.numberWithOptions(
                        //         //         decimal: true, signed: false),

                        //         // textInputAction: TextInputAction.done,
                        //         // inputFormatters: [
                        //         //   FilteringTextInputFormatter.allow(
                        //         //       RegExp(r"[0-9.]")),
                        //         //   TextInputFormatter.withFunction(
                        //         //       (oldValue, newValue) {
                        //         //     final text = newValue.text;
                        //         //     return text.isEmpty
                        //         //         ? newValue
                        //         //         : double.tryParse(text) == null
                        //         //             ? oldValue
                        //         //             : newValue;
                        //         //   }),
                        //         // ],
                        //         showCursor: false,
                        //         readOnly: true,

                        //         // onFieldSubmitted: (value) {},
                        //         // onTapOutside: (event) =>
                        //         //     FocusManager.instance.primaryFocus?.unfocus(),

                        //         decoration: InputDecoration(
                        //           // hintStyle: TextStyle(
                        //           //     fontSize: 16.sp,
                        //           //     color: const Color(0xFF90A4AE),
                        //           //     fontWeight: FontWeight.normal),
                        //           contentPadding: EdgeInsets.symmetric(
                        //               vertical: 5.h, horizontal: 15.w),
                        //           filled: true,
                        //           fillColor: Theme.of(context)
                        //               .primaryColor
                        //               .withOpacity(0.1),

                        //           enabledBorder: const OutlineInputBorder(
                        //             borderRadius:
                        //                 BorderRadius.all(Radius.circular(10.0)),
                        //             borderSide: BorderSide.none,
                        //           ),
                        //           focusedBorder: OutlineInputBorder(
                        //             borderRadius: BorderRadius.circular(10.0),
                        //             borderSide: BorderSide.none,
                        //           ),
                        //           errorBorder: OutlineInputBorder(
                        //             borderRadius: BorderRadius.circular(10.0),
                        //             borderSide: BorderSide.none,
                        //           ),
                        //           focusedErrorBorder: OutlineInputBorder(
                        //             borderRadius: BorderRadius.circular(10.0),
                        //             borderSide: BorderSide.none,
                        //           ),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
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
                                onChanged: (value) {
                                  setState(() {});
                                },
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
                        // show result options start
                        allOptionsToDisplayResults.isNotEmpty
                            ? Container(
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
                                            color:
                                                Theme.of(context).primaryColor),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Expanded(
                                          child: Text(
                                            'عرض نتائج',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Column(
                                      children: [
                                        ListTileTheme(
                                          horizontalTitleGap: 0,
                                          child: CheckboxListTile(
                                            value:
                                                selctedOptionsToDisplayResults
                                                        .length ==
                                                    allOptionsToDisplayResults
                                                        .length,

                                            // contentPadding: EdgeInsets.symmetric(
                                            //     horizontal: 20.w, vertical: 5.h),
                                            checkboxShape:
                                                RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            side: MaterialStateBorderSide
                                                .resolveWith(
                                              (states) => BorderSide(
                                                  width: 2.0,
                                                  color: Theme.of(context)
                                                      .primaryColor),
                                            ),
                                            controlAffinity:
                                                ListTileControlAffinity.leading,
                                            activeColor:
                                                Theme.of(context).primaryColor,
                                            title: const Text(
                                              'الكل',
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            onChanged: (isChecked) {
                                              setState(() {
                                                if (isChecked ?? false) {
                                                  selctedOptionsToDisplayResults =
                                                      List<OptionsToDisplayResults>.from(
                                                          allOptionsToDisplayResults);
                                                } else {
                                                  selctedOptionsToDisplayResults
                                                      .clear();
                                                }
                                              });
                                            },
                                          ),
                                        ),
                                        ...allOptionsToDisplayResults
                                            .map((item) => ListTileTheme(
                                                  horizontalTitleGap: 0,
                                                  child: CheckboxListTile(
                                                    value:
                                                        selctedOptionsToDisplayResults
                                                            .contains(item),
                                                    title: Text(
                                                      item.name,
                                                      style: const TextStyle(
                                                          fontSize: 16),
                                                    ),
                                                    // contentPadding:
                                                    //     EdgeInsets.symmetric(
                                                    //         horizontal: 20.w,
                                                    //         vertical: 5.h),
                                                    checkboxShape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
                                                    ),
                                                    side:
                                                        MaterialStateBorderSide
                                                            .resolveWith(
                                                      (states) => BorderSide(
                                                          width: 2.0,
                                                          color: Theme.of(
                                                                  context)
                                                              .primaryColor),
                                                    ),
                                                    activeColor:
                                                        Theme.of(context)
                                                            .primaryColor,
                                                    controlAffinity:
                                                        ListTileControlAffinity
                                                            .leading,
                                                    onChanged: (isChecked) {
                                                      setState(() {
                                                        if (isChecked ??
                                                            false) {
                                                          selctedOptionsToDisplayResults
                                                              .add(item);
                                                        } else {
                                                          selctedOptionsToDisplayResults
                                                              .remove(item);
                                                        }
                                                      });
                                                    },
                                                  ),
                                                ))
                                            .toList()
                                      ],
                                    )
                                  ],
                                ),
                              )
                            : SizedBox(),
                        //show results options end
                        //show results btn start
                        SizedBox(
                          width: double.infinity,
                          height: 50.h,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: groundFloorAreaCtrl.text.isNotEmpty &&
                                          soilTypegroupVal != null &&
                                          selctedOptionsToDisplayResults
                                              .isNotEmpty &&
                                          ownerCtrl.text.isNotEmpty &&
                                          (floorNogroupVal == 1 ||
                                              (floorNogroupVal == 2 &&
                                                  ((isAttachedFloorgroupVal == false && firstRepeatedFloorAreaCtrl.text.isNotEmpty) ||
                                                      (isAttachedFloorgroupVal == true &&
                                                          attachedFloorCtrl.text
                                                              .isNotEmpty))) ||
                                              (floorNogroupVal == 3 &&
                                                  firstRepeatedFloorAreaCtrl
                                                      .text.isNotEmpty &&
                                                  ((isAttachedFloorgroupVal == false && secondRepeatedFloorAreaCtrl.text.isNotEmpty) ||
                                                      (isAttachedFloorgroupVal == true &&
                                                          attachedFloorCtrl.text
                                                              .isNotEmpty))) ||
                                              (floorNogroupVal == 4 &&
                                                  firstRepeatedFloorAreaCtrl
                                                      .text.isNotEmpty &&
                                                  secondRepeatedFloorAreaCtrl
                                                      .text.isNotEmpty &&
                                                  ((isAttachedFloorgroupVal == false && thirdRepeatedFloorAreaCtrl.text.isNotEmpty) ||
                                                      (isAttachedFloorgroupVal == true && attachedFloorCtrl.text.isNotEmpty))) ||
                                              (floorNogroupVal == 5 && firstRepeatedFloorAreaCtrl.text.isNotEmpty && secondRepeatedFloorAreaCtrl.text.isNotEmpty && thirdRepeatedFloorAreaCtrl.text.isNotEmpty && ((isAttachedFloorgroupVal == false && fourthRepeatedFloorAreaCtrl.text.isNotEmpty) || (isAttachedFloorgroupVal == true && attachedFloorCtrl.text.isNotEmpty))))
                                      ? Theme.of(context).primaryColor
                                      : Colors.grey,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.sp))),
                              onPressed: () {
                                print(floorNogroupVal);
                                if (groundFloorAreaCtrl.text.isNotEmpty &&
                                    soilTypegroupVal != null &&
                                    selctedOptionsToDisplayResults.isNotEmpty &&
                                    ownerCtrl.text.isNotEmpty &&
                                    (floorNogroupVal == 1 ||
                                        (floorNogroupVal == 2 &&
                                            ((isAttachedFloorgroupVal == false &&
                                                    firstRepeatedFloorAreaCtrl
                                                        .text.isNotEmpty) ||
                                                (isAttachedFloorgroupVal == true &&
                                                    attachedFloorCtrl
                                                        .text.isNotEmpty))) ||
                                        (floorNogroupVal == 3 &&
                                            firstRepeatedFloorAreaCtrl
                                                .text.isNotEmpty &&
                                            ((isAttachedFloorgroupVal == false &&
                                                    secondRepeatedFloorAreaCtrl
                                                        .text.isNotEmpty) ||
                                                (isAttachedFloorgroupVal == true &&
                                                    attachedFloorCtrl
                                                        .text.isNotEmpty))) ||
                                        (floorNogroupVal == 4 &&
                                            firstRepeatedFloorAreaCtrl
                                                .text.isNotEmpty &&
                                            secondRepeatedFloorAreaCtrl
                                                .text.isNotEmpty &&
                                            ((isAttachedFloorgroupVal == false &&
                                                    thirdRepeatedFloorAreaCtrl
                                                        .text.isNotEmpty) ||
                                                (isAttachedFloorgroupVal ==
                                                        true &&
                                                    attachedFloorCtrl
                                                        .text.isNotEmpty))) ||
                                        (floorNogroupVal == 5 &&
                                            firstRepeatedFloorAreaCtrl
                                                .text.isNotEmpty &&
                                            secondRepeatedFloorAreaCtrl
                                                .text.isNotEmpty &&
                                            thirdRepeatedFloorAreaCtrl
                                                .text.isNotEmpty &&
                                            ((isAttachedFloorgroupVal ==
                                                        false &&
                                                    fourthRepeatedFloorAreaCtrl
                                                        .text.isNotEmpty) ||
                                                (isAttachedFloorgroupVal ==
                                                        true &&
                                                    attachedFloorCtrl
                                                        .text.isNotEmpty))))) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => SchedulePDFViewer(
                                          ownerName: ownerCtrl.text,
                                          selctedOptionsToDisplayResults:
                                              selctedOptionsToDisplayResults,
                                          soilConstant: soilTypegroupVal!,
                                          floorNo: floorNogroupVal!,
                                          groundFloorArea: groundFloorAreaCtrl
                                                  .text.isNotEmpty
                                              ? double.parse(
                                                  groundFloorAreaCtrl.text)
                                              : null,
                                          firstFloorArea:
                                              firstRepeatedFloorAreaCtrl
                                                      .text.isNotEmpty
                                                  ? double.parse(
                                                      firstRepeatedFloorAreaCtrl
                                                          .text)
                                                  : null,
                                          secondFloorArea:
                                              secondRepeatedFloorAreaCtrl
                                                      .text.isNotEmpty
                                                  ? double.parse(
                                                      secondRepeatedFloorAreaCtrl
                                                          .text)
                                                  : null,
                                          thirdFloorArea:
                                              thirdRepeatedFloorAreaCtrl
                                                      .text.isNotEmpty
                                                  ? double.parse(
                                                      thirdRepeatedFloorAreaCtrl
                                                          .text)
                                                  : null,
                                          fourthFloorArea:
                                              fourthRepeatedFloorAreaCtrl
                                                      .text.isNotEmpty
                                                  ? double.parse(
                                                      fourthRepeatedFloorAreaCtrl
                                                          .text)
                                                  : null,
                                          attachedFloorArea:
                                              attachedFloorCtrl.text.isNotEmpty
                                                  ? double.parse(
                                                      attachedFloorCtrl.text)
                                                  : null,
                                        ),
                                      ));
                                }
                              },
                              child: Text(
                                'عرض النتائج',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                        //show result btn end
                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    ),
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
