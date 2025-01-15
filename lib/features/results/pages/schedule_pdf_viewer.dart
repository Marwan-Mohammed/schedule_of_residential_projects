import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:intl/intl.dart';
import 'package:schedule_of_residential_projects/core/extensions/size_config.dart';

import '../../../core/models.dart';
import '../../../core/util/enums.dart';

class SchedulePDFViewer extends StatefulWidget {
  final String ownerName;
  final List<OptionsToDisplayResults> selctedOptionsToDisplayResults;
  final double soilConstant;
  final int floorNo;
  final DateTime projectStartDate;
  final double? groundFloorArea;
  final double? firstFloorArea;
  final double? secondFloorArea;
  final double? thirdFloorArea;
  final double? fourthFloorArea;
  final double? attachedFloorArea;

  SchedulePDFViewer({
    Key? key,
    required this.ownerName,
    required this.selctedOptionsToDisplayResults,
    required this.soilConstant,
    required this.floorNo,
    required this.projectStartDate,
    required this.groundFloorArea,
    required this.firstFloorArea,
    required this.secondFloorArea,
    required this.thirdFloorArea,
    required this.fourthFloorArea,
    required this.attachedFloorArea,
    //required this.order,
  }) : super(key: key);

  @override
  State<SchedulePDFViewer> createState() => _SchedulePDFViewerState();
}

class _SchedulePDFViewerState extends State<SchedulePDFViewer> {
  final String title = 'جدول زمني لمشروع سكني';
  int projectDaysNo = 0;
  late DateTime date;
  bool isFirstTermInProject = true;

  getTermStartDate() {
    late DateTime termDate;
    if (isFirstTermInProject) {
      isFirstTermInProject = false;
      termDate = date;
    } else if (DateFormat('EEEE', 'ar').format(date.add(Duration(days: 1))) ==
        'الجمعة') {
      date = date.add(Duration(days: 2));
      termDate = date;
    } else {
      date = date.add(Duration(days: 1));
      termDate = date;
    }
    return DateFormat('EEEE, d MMMM', 'ar').format(termDate);
  }

  getTermEndDate(int timePeriodTotal) {
    late DateTime termDate;
    int duration = timePeriodTotal - 1;
    for (int counter = 0; counter < timePeriodTotal; ++counter) {
      if (DateFormat('EEEE', 'ar').format(date.add(Duration(days: counter))) ==
          'الجمعة') {
        duration = duration + 1;
      }
    }
    if (DateFormat('EEEE', 'ar').format(date.add(Duration(days: duration))) ==
        'الجمعة') {
      duration = duration + 1;
    }
    date = date.add(Duration(days: duration));
    termDate = date;
    return DateFormat('EEEE, d MMMM', 'ar').format(termDate);
  }

  pw.Widget header(image, ownerName, textStyle) => pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        crossAxisAlignment: pw.CrossAxisAlignment.center,
        children: [
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text('تاريخ الإصدار', style: textStyle),
                  pw.SizedBox(width: 3 * PdfPageFormat.mm),
                  pw.Text(
                      "${DateFormat(
                        'a KK:mm  dd/MM/yyyy',
                      ).format(DateTime.now())}",
                      style: textStyle),
                ],
              ),
              pw.SizedBox(height: 0.5 * PdfPageFormat.cm),
              pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text('المالك', style: textStyle),
                  pw.SizedBox(width: 3 * PdfPageFormat.mm),
                  pw.Text(ownerName, style: textStyle),
                ],
              ),
              // pw.SizedBox(height: 0.5 * PdfPageFormat.cm),
              // pw.Row(
              //   crossAxisAlignment: pw.CrossAxisAlignment.start,
              //   children: [
              //     pw.Text('تاريخ بداية المشروع', style: textStyle),
              //     pw.SizedBox(width: 3 * PdfPageFormat.mm),
              //     pw.Text(DateFormat('EEEE, d MMMM yyyy', 'ar').format(date),
              //         style: textStyle),
              //   ],
              // ),
            ],
          ),
          pw.SizedBox(width: 20 * PdfPageFormat.mm),
          pw.Expanded(
            child: pw.Center(
                child: pw.Text('جدول زمني لمشروع  سكني',
                    textAlign: pw.TextAlign.center)),
          ),
          pw.SizedBox(width: 20 * PdfPageFormat.mm),
          pw.Image(image,
              width: 3 * PdfPageFormat.cm, height: 3 * PdfPageFormat.cm)
        ],
      );
  @override
  void initState() {
    date = widget.projectStartDate;
    super.initState();
  }

  //final MyOrders order;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'جدول زمني لمشروع سكني',
      )),
      body: PdfPreview(
        build: (format) => _generatePdf(format, title),
        pdfFileName: 'جدول زمني لمشروع سكني.pdf',
        canChangeOrientation: true,
        canChangePageFormat: true,
        canDebug: false,
      ),
    );
  }

  Future<Uint8List> _generatePdf(PdfPageFormat format, String title) async {
    final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);
    final font =
        pw.Font.ttf(await rootBundle.load("assets/fonts/Almarai-Regular.ttf"));
    final image = await imageFromAssetBundle('assets/images/tazmin_logo3.png');
    final textStyle = pw.TextStyle(
      fontSize: 10,
      lineSpacing: 5,
    );
    final headers = [
      'الفترة الكلية للبند (يوم)',
      'عدد العمال/الآلة',
      'فترة إنتظار (رش + فك نجارة)',
      'الفترة الزمنية الصافية (يوم)',
      'تاريخ البدء - تاريخ الإنتهاء',
      'البند',
    ];

    pdf.addPage(pw.MultiPage(
        textDirection: pw.TextDirection.rtl,
        margin: pw.EdgeInsets.symmetric(horizontal: 25.w, vertical: 25.h),
        theme: pw.ThemeData.withFont(base: font, bold: pw.Font.helvetica()),
        pageFormat: PdfPageFormat.a4,
        build: (context) => [
              header(image, widget.ownerName, textStyle),
              pw.Divider(thickness: 0.7),
              //underground works start
              widget.selctedOptionsToDisplayResults
                      .contains(OptionsToDisplayResults.undergroundWorks)
                  ? floorTermsTable(
                      textStyle,
                      null,
                      OptionsToDisplayResults.undergroundWorks.name,
                      widget.groundFloorArea,
                      headers,
                    )
                  : pw.SizedBox(),
              //underground works start
              //ground floor start
              widget.selctedOptionsToDisplayResults
                      .contains(OptionsToDisplayResults.groundFloor)
                  ? floorTermsTable(
                      textStyle,
                      1,
                      OptionsToDisplayResults.groundFloor.name,
                      widget.groundFloorArea,
                      headers,
                    )
                  : pw.SizedBox(),
              //ground floor end
              //first floor start
              widget.selctedOptionsToDisplayResults
                      .contains(OptionsToDisplayResults.firstFloor)
                  ? floorTermsTable(
                      textStyle,
                      2,
                      OptionsToDisplayResults.firstFloor.name,
                      widget.firstFloorArea,
                      headers,
                    )
                  : pw.SizedBox(),
              //first floor end
              //second floor start
              widget.selctedOptionsToDisplayResults
                      .contains(OptionsToDisplayResults.secondFloor)
                  ? floorTermsTable(
                      textStyle,
                      3,
                      OptionsToDisplayResults.secondFloor.name,
                      widget.secondFloorArea,
                      headers,
                    )
                  : pw.SizedBox(),
              //second floor end
              //third floor start
              widget.selctedOptionsToDisplayResults
                      .contains(OptionsToDisplayResults.thirdFloor)
                  ? floorTermsTable(
                      textStyle,
                      4,
                      OptionsToDisplayResults.thirdFloor.name,
                      widget.thirdFloorArea,
                      headers,
                    )
                  : pw.SizedBox(),
              //third floor end
              //fourth floor start
              widget.selctedOptionsToDisplayResults
                      .contains(OptionsToDisplayResults.fourthFloor)
                  ? floorTermsTable(
                      textStyle,
                      5,
                      OptionsToDisplayResults.fourthFloor.name,
                      widget.fourthFloorArea,
                      headers,
                    )
                  : pw.SizedBox(),
              //forth floor end
              //attached floor start
              widget.selctedOptionsToDisplayResults
                      .contains(OptionsToDisplayResults.attachedFloor)
                  ? floorTermsTable(
                      textStyle,
                      null,
                      OptionsToDisplayResults.attachedFloor.name,
                      widget.attachedFloorArea,
                      headers,
                    )
                  : pw.SizedBox(),
              projectTimePeriodtotal(textStyle)
              //attached floor end
              // barCode()
            ]));

    return pdf.save();
  }

  //underground Works Terms Table method
  pw.Widget floorTermsTable(
    textStyle,
    floorOrderNo,
    floorName,
    floorArea,
    headers,
  ) {
    List<FloorTerm> floorTerms = [];
    if (floorName == OptionsToDisplayResults.undergroundWorks.name) {
      FloorTerm floorTerm1 = FloorTerm(
          name: 'الحفر',
          constant: widget.soilConstant,
          floorArea: floorArea,
          waitingPeriod: 2,
          workersNoMachine: widget.soilConstant == 0.02437 ? 'حفار' : 'شيول');
      FloorTerm floorTerm2 = FloorTerm(
          name: 'نجارة القواعد العادية',
          constant: 0.00480,
          floorArea: floorArea,
          waitingPeriod: 0,
          workersNoMachine: '2 نجارين + 2 مساعدين');
      FloorTerm floorTerm3 = FloorTerm(
          name: 'صب القواعد العادية',
          constant: 0.00345,
          floorArea: floorArea,
          waitingPeriod: 0,
          workersNoMachine: '5 عمال / خلاطة مركزية');
      FloorTerm floorTerm4 = FloorTerm(
          name: 'نجارة القواعد المسلحة',
          constant: 0.01554,
          floorArea: floorArea,
          waitingPeriod: 0,
          workersNoMachine: '2 نجارين + 2 مساعدين');
      FloorTerm floorTerm5 = FloorTerm(
          name: 'حدادة القواعد المسلحة',
          constant: 0.01554,
          floorArea: floorArea,
          waitingPeriod: 0,
          workersNoMachine: '2 حدادين + 2 مساعدين');
      FloorTerm floorTerm6 = FloorTerm(
          name: 'صب القواعد المسلحة',
          constant: 0.00345,
          floorArea: floorArea,
          waitingPeriod: 0,
          workersNoMachine: '5 عمال / خلاطة مركزية');
      FloorTerm floorTerm7 = FloorTerm(
          name: 'نجارة الرقاب',
          constant: 0.00511,
          floorArea: floorArea,
          waitingPeriod: 0,
          workersNoMachine: '2 نجارين + 2 مساعدين');
      FloorTerm floorTerm8 = FloorTerm(
          name: 'حدادة الرقاب',
          constant: 0.00404,
          floorArea: floorArea,
          waitingPeriod: 0,
          workersNoMachine: '2 حدادين + 2 مساعدين');
      FloorTerm floorTerm9 = FloorTerm(
          name: 'صب الرقاب',
          constant: 0.00336,
          floorArea: floorArea,
          waitingPeriod: 7,
          workersNoMachine: '4 عمال / خلاطة مركزية');
      FloorTerm floorTerm10 = FloorTerm(
          name: 'نجارة الميدة',
          constant: 0.01749,
          floorArea: floorArea,
          waitingPeriod: 0,
          workersNoMachine: '2 نجارين + 2 مساعدين');
      FloorTerm floorTerm11 = FloorTerm(
          name: 'حدادة الميدة',
          constant: 0.01532,
          floorArea: floorArea,
          waitingPeriod: 0,
          workersNoMachine: '2 حدادين + 2 مساعدين');
      FloorTerm floorTerm12 = FloorTerm(
          name: 'صب الميدات',
          constant: 0.00336,
          floorArea: floorArea,
          waitingPeriod: 7,
          workersNoMachine: '5 عمال / خلاطة مركزية');
      FloorTerm floorTerm13 = FloorTerm(
          name: 'بناء الكرسي الحجرى',
          constant: 0.02106,
          floorArea: floorArea,
          waitingPeriod: 3,
          workersNoMachine: '4 عمال');
      FloorTerm floorTerm14 = FloorTerm(
          name: 'عزل القواعد والرقاب',
          constant: 0.00998,
          floorArea: floorArea,
          waitingPeriod: 2,
          workersNoMachine: '4 عمال');
      FloorTerm floorTerm15 = FloorTerm(
          name: 'عزل الميدات',
          constant: 0.01063,
          floorArea: floorArea,
          waitingPeriod: 2,
          workersNoMachine: '4 عمال');
      FloorTerm floorTerm16 = FloorTerm(
          name: 'ردم إلى منسوب أسفل الميدة',
          constant: 0.00759,
          floorArea: floorArea,
          waitingPeriod: 0,
          workersNoMachine: '3 عمال / شيول + دكاكة');
      FloorTerm floorTerm17 = FloorTerm(
          name: 'ردم داخل الميدات',
          constant: 0.00336,
          floorArea: floorArea,
          waitingPeriod: 0,
          workersNoMachine: 'شيول');
      floorTerms = [
        floorTerm1,
        floorTerm2,
        floorTerm3,
        floorTerm4,
        floorTerm5,
        floorTerm6,
        floorTerm7,
        floorTerm8,
        floorTerm9,
        floorTerm10,
        floorTerm11,
        floorTerm12,
        floorTerm13,
        floorTerm14,
        floorTerm15,
        floorTerm16,
        floorTerm17
      ];
    } else if (floorName == OptionsToDisplayResults.groundFloor.name) {
      FloorTerm floorTerm1 = FloorTerm(
          name: 'نجارة الأعمدة الأرضي',
          constant: 0.01598,
          floorArea: floorArea,
          waitingPeriod: 0,
          workersNoMachine: '2 نجارين + 2 مساعدين');
      FloorTerm floorTerm2 = FloorTerm(
          name: 'حدادة الأعمدة الأرضي',
          constant: 0.01178,
          floorArea: floorArea,
          waitingPeriod: 0,
          workersNoMachine: '2 حدادين + 2 مساعدين');
      FloorTerm floorTerm3 = FloorTerm(
          name: 'صب  الأعمدة الأرضي',
          constant: 0.00337,
          floorArea: floorArea,
          waitingPeriod: 0,
          workersNoMachine: '4 عمال / خلاطة مركزية');
      FloorTerm floorTerm4 = FloorTerm(
          name: 'نجارة سقف الأرضي',
          constant: 0.03131,
          floorArea: floorArea,
          waitingPeriod: 0,
          workersNoMachine: '4 نجارين + 4 مساعدين');
      FloorTerm floorTerm5 = FloorTerm(
          name: 'حدادة سقف الأرضي',
          constant: 0.03131,
          floorArea: floorArea,
          waitingPeriod: 0,
          workersNoMachine: '2 حدادين + 2 مساعدين');
      FloorTerm floorTerm6 = FloorTerm(
          name: 'صب سقف الأرضي',
          constant: 0.00337,
          floorArea: floorArea,
          waitingPeriod: 14,
          workersNoMachine: '5 عمال / خلاطة مركزية');
      FloorTerm floorTerm7 = FloorTerm(
          name: 'مباني الدور الأرضي',
          constant: 0.04395,
          floorArea: floorArea,
          waitingPeriod: 0,
          workersNoMachine: '4 عمال');
      floorTerms = [
        floorTerm1,
        floorTerm2,
        floorTerm3,
        floorTerm4,
        floorTerm5,
        floorTerm6,
        floorTerm7,
      ];
    } else if (floorName == OptionsToDisplayResults.firstFloor.name) {
      FloorTerm floorTerm1 = FloorTerm(
          name: 'نجارة الأعمدة الأول',
          constant: 0.01444,
          floorArea: floorArea,
          waitingPeriod: 0,
          workersNoMachine: '2 نجارين + 2 مساعدين');
      FloorTerm floorTerm2 = FloorTerm(
          name: 'حدادة الأعمدة الأول',
          constant: 0.01044,
          floorArea: floorArea,
          waitingPeriod: 0,
          workersNoMachine: '2 حدادين + 2 مساعدين');
      FloorTerm floorTerm3 = FloorTerm(
          name: 'صب  الأعمدة الأول',
          constant: 0.00337,
          floorArea: floorArea,
          waitingPeriod: 0,
          workersNoMachine: '4 عمال / خلاطة مركزية');
      FloorTerm floorTerm4 = FloorTerm(
          name: 'نجارة سقف الأول',
          constant: 0.03120,
          floorArea: floorArea,
          waitingPeriod: 0,
          workersNoMachine: '4 نجارين + 4 مساعدين');
      FloorTerm floorTerm5 = FloorTerm(
          name: 'حدادة سقف الأول',
          constant: 0.03120,
          floorArea: floorArea,
          waitingPeriod: 0,
          workersNoMachine: '2 حدادين + 2 مساعدين');
      FloorTerm floorTerm6 = FloorTerm(
          name: 'صب سقف الأول',
          constant: 0.00337,
          floorArea: floorArea,
          waitingPeriod: 14,
          workersNoMachine: '5 عمال / خلاطة مركزية');
      FloorTerm floorTerm7 = FloorTerm(
          name: 'مباني الدور الأول',
          constant: 0.04217,
          floorArea: floorArea,
          waitingPeriod: 0,
          workersNoMachine: '4 عمال');
      floorTerms = [
        floorTerm1,
        floorTerm2,
        floorTerm3,
        floorTerm4,
        floorTerm5,
        floorTerm6,
        floorTerm7,
      ];
    } else if (floorName == OptionsToDisplayResults.secondFloor.name) {
      FloorTerm floorTerm1 = FloorTerm(
          name: 'نجارة الأعمدة الثاني',
          constant: 0.01362,
          floorArea: floorArea,
          waitingPeriod: 0,
          workersNoMachine: '2 نجارين + 2 مساعدين');
      FloorTerm floorTerm2 = FloorTerm(
          name: 'حدادة الأعمدة الثاني',
          constant: 0.01046,
          floorArea: floorArea,
          waitingPeriod: 0,
          workersNoMachine: '2 حدادين + 2 مساعدين');
      FloorTerm floorTerm3 = FloorTerm(
          name: 'صب  الأعمدة الثاني',
          constant: 0.00337,
          floorArea: floorArea,
          waitingPeriod: 0,
          workersNoMachine: '4 عمال / خلاطة مركزية');
      FloorTerm floorTerm4 = FloorTerm(
          name: 'نجارة سقف الثاني',
          constant: 0.03120,
          floorArea: floorArea,
          waitingPeriod: 0,
          workersNoMachine: '4 نجارين + 4 مساعدين');
      FloorTerm floorTerm5 = FloorTerm(
          name: 'حدادة سقف الثاني',
          constant: 0.03120,
          floorArea: floorArea,
          waitingPeriod: 0,
          workersNoMachine: '2 حدادين + 2 مساعدين');
      FloorTerm floorTerm6 = FloorTerm(
          name: 'صب سقف الثاني',
          constant: 0.00337,
          floorArea: floorArea,
          waitingPeriod: 14,
          workersNoMachine: '5 عمال / خلاطة مركزية');
      FloorTerm floorTerm7 = FloorTerm(
          name: 'مباني الدور الثاني',
          constant: 0.04217,
          floorArea: floorArea,
          waitingPeriod: 0,
          workersNoMachine: '4 عمال');
      floorTerms = [
        floorTerm1,
        floorTerm2,
        floorTerm3,
        floorTerm4,
        floorTerm5,
        floorTerm6,
        floorTerm7,
      ];
    } else if (floorName == OptionsToDisplayResults.thirdFloor.name) {
      FloorTerm floorTerm1 = FloorTerm(
          name: 'نجارة الأعمدة الثالث',
          constant: 0.01329,
          floorArea: floorArea,
          waitingPeriod: 0,
          workersNoMachine: '2 نجارين + 2 مساعدين');
      FloorTerm floorTerm2 = FloorTerm(
          name: 'حدادة الأعمدة الثالث',
          constant: 0.00941,
          floorArea: floorArea,
          waitingPeriod: 0,
          workersNoMachine: '2 حدادين + 2 مساعدين');
      FloorTerm floorTerm3 = FloorTerm(
          name: 'صب  الأعمدة الثالث',
          constant: 0.00337,
          floorArea: floorArea,
          waitingPeriod: 0,
          workersNoMachine: '4 عمال / خلاطة مركزية');
      FloorTerm floorTerm4 = FloorTerm(
          name: 'نجارة سقف الثالث',
          constant: 0.03120,
          floorArea: floorArea,
          waitingPeriod: 0,
          workersNoMachine: '4 نجارين + 4 مساعدين');
      FloorTerm floorTerm5 = FloorTerm(
          name: 'حدادة سقف الثالث',
          constant: 0.03120,
          floorArea: floorArea,
          waitingPeriod: 0,
          workersNoMachine: '2 حدادين + 2 مساعدين');
      FloorTerm floorTerm6 = FloorTerm(
          name: 'صب سقف الثالث',
          constant: 0.00337,
          floorArea: floorArea,
          waitingPeriod: 14,
          workersNoMachine: '5 عمال / خلاطة مركزية');
      FloorTerm floorTerm7 = FloorTerm(
          name: 'مباني الدور الثالث',
          constant: 0.04217,
          floorArea: floorArea,
          waitingPeriod: 0,
          workersNoMachine: '4 عمال');
      floorTerms = [
        floorTerm1,
        floorTerm2,
        floorTerm3,
        floorTerm4,
        floorTerm5,
        floorTerm6,
        floorTerm7,
      ];
    } else if (floorName == OptionsToDisplayResults.fourthFloor.name) {
      FloorTerm floorTerm1 = FloorTerm(
          name: 'نجارة الأعمدة الرابع',
          constant: 0.01227,
          floorArea: floorArea,
          waitingPeriod: 0,
          workersNoMachine: '2 نجارين + 2 مساعدين');
      FloorTerm floorTerm2 = FloorTerm(
          name: 'حدادة الأعمدة الرابع',
          constant: 0.00864,
          floorArea: floorArea,
          waitingPeriod: 0,
          workersNoMachine: '2 حدادين + 2 مساعدين');
      FloorTerm floorTerm3 = FloorTerm(
          name: 'صب  الأعمدة الرابع',
          constant: 0.00337,
          floorArea: floorArea,
          waitingPeriod: 0,
          workersNoMachine: '4 عمال / خلاطة مركزية');
      FloorTerm floorTerm4 = FloorTerm(
          name: 'نجارة سقف الرابع',
          constant: 0.03120,
          floorArea: floorArea,
          waitingPeriod: 0,
          workersNoMachine: '4 نجارين + 4 مساعدين');
      FloorTerm floorTerm5 = FloorTerm(
          name: 'حدادة سقف الرابع',
          constant: 0.03120,
          floorArea: floorArea,
          waitingPeriod: 0,
          workersNoMachine: '2 حدادين + 2 مساعدين');
      FloorTerm floorTerm6 = FloorTerm(
          name: 'صب سقف الرابع',
          constant: 0.00337,
          floorArea: floorArea,
          waitingPeriod: 14,
          workersNoMachine: '5 عمال / خلاطة مركزية');
      FloorTerm floorTerm7 = FloorTerm(
          name: 'مباني الدور الرابع',
          constant: 0.04217,
          floorArea: floorArea,
          waitingPeriod: 0,
          workersNoMachine: '4 عمال');
      floorTerms = [
        floorTerm1,
        floorTerm2,
        floorTerm3,
        floorTerm4,
        floorTerm5,
        floorTerm6,
        floorTerm7,
      ];
    } else if (floorName == OptionsToDisplayResults.attachedFloor.name) {
      FloorTerm floorTerm1 = FloorTerm(
          name: 'نجارة الأعمدة الملحق',
          constant: widget.floorNo == 2
              ? 0.01598
              : widget.floorNo == 3
                  ? 0.01444
                  : widget.floorNo == 4
                      ? 0.01362
                      : widget.floorNo == 5
                          ? 0.01329
                          : 0,
          floorArea: floorArea,
          waitingPeriod: 0,
          workersNoMachine: '2 نجارين + 2 مساعدين');
      FloorTerm floorTerm2 = FloorTerm(
          name: 'حدادة الأعمدة الملحق',
          constant: widget.floorNo == 2
              ? 0.01178
              : widget.floorNo == 3
                  ? 0.01044
                  : widget.floorNo == 4
                      ? 0.01046
                      : widget.floorNo == 5
                          ? 0.00941
                          : 0,
          floorArea: floorArea,
          waitingPeriod: 0,
          workersNoMachine: '2 حدادين + 2 مساعدين');
      FloorTerm floorTerm3 = FloorTerm(
          name: 'صب  الأعمدة الملحق',
          constant: widget.floorNo == 2
              ? 0.00337
              : widget.floorNo == 3
                  ? 0.00337
                  : widget.floorNo == 4
                      ? 0.00337
                      : widget.floorNo == 5
                          ? 0.00337
                          : 0,
          floorArea: floorArea,
          waitingPeriod: 0,
          workersNoMachine: '4 عمال / خلاطة مركزية');
      FloorTerm floorTerm4 = FloorTerm(
          name: 'نجارة سقف الملحق',
          constant: widget.floorNo == 2
              ? 0.03131
              : widget.floorNo == 3
                  ? 0.03120
                  : widget.floorNo == 4
                      ? 0.03120
                      : widget.floorNo == 5
                          ? 0.03120
                          : 0,
          floorArea: floorArea,
          waitingPeriod: 0,
          workersNoMachine: '4 نجارين + 4 مساعدين');
      FloorTerm floorTerm5 = FloorTerm(
          name: 'حدادة سقف الملحق',
          constant: widget.floorNo == 2
              ? 0.03131
              : widget.floorNo == 3
                  ? 0.03120
                  : widget.floorNo == 4
                      ? 0.03120
                      : widget.floorNo == 5
                          ? 0.03120
                          : 0,
          floorArea: floorArea,
          waitingPeriod: 0,
          workersNoMachine: '2 حدادين + 2 مساعدين');
      FloorTerm floorTerm6 = FloorTerm(
          name: 'صب سقف الملحق',
          constant: widget.floorNo == 2
              ? 0.00337
              : widget.floorNo == 3
                  ? 0.00337
                  : widget.floorNo == 4
                      ? 0.00337
                      : widget.floorNo == 5
                          ? 0.00337
                          : 0,
          floorArea: floorArea,
          waitingPeriod: 14,
          workersNoMachine: '5 عمال / خلاطة مركزية');
      FloorTerm floorTerm7 = FloorTerm(
          name: 'مباني الدور الملحق',
          constant: widget.floorNo == 2
              ? 0.04395
              : widget.floorNo == 3
                  ? 0.04217
                  : widget.floorNo == 4
                      ? 0.04217
                      : widget.floorNo == 5
                          ? 0.04217
                          : 0,
          floorArea: floorArea,
          waitingPeriod: 0,
          workersNoMachine: '4 عمال');
      floorTerms = [
        floorTerm1,
        floorTerm2,
        floorTerm3,
        floorTerm4,
        floorTerm5,
        floorTerm6,
        floorTerm7,
      ];
    }
    var data = floorTerms
        .map((e) => [
              e.name == 'ردم إلى منسوب أسفل الميدة'
                  ? e.timePeriodTotal(soilConstant: widget.soilConstant)
                  : (floorOrderNo != widget.floorNo &&
                              floorName != 'الدور الملحق') &&
                          e.name.startsWith('صب سقف')
                      ? e.netTimePeriod()
                      : e.timePeriodTotal(),
              e.workersNoMachine,
              e.waitingPeriod,
              e.name == 'ردم إلى منسوب أسفل الميدة'
                  ? e.netTimePeriod(soilConstant: widget.soilConstant)
                  : e.netTimePeriod(),
              '${getTermStartDate()} - ${getTermEndDate(e.name == 'ردم إلى منسوب أسفل الميدة' ? e.timePeriodTotal(soilConstant: widget.soilConstant) : (floorOrderNo != widget.floorNo && floorName != 'الدور الملحق') && e.name.startsWith('صب سقف') ? e.netTimePeriod() : e.timePeriodTotal())}',
              e.name,
            ])
        .toList();
    int daysNo = 0;
    for (var e in floorTerms) {
      daysNo += e.name == 'ردم إلى منسوب أسفل الميدة'
          ? e.timePeriodTotal(soilConstant: widget.soilConstant)
          : (floorOrderNo != widget.floorNo && floorName != 'الدور الملحق') &&
                  e.name.startsWith('صب سقف')
              ? e.netTimePeriod()
              : e.timePeriodTotal();
      projectDaysNo += e.name == 'ردم إلى منسوب أسفل الميدة'
          ? e.timePeriodTotal(soilConstant: widget.soilConstant)
          : (floorOrderNo != widget.floorNo && floorName != 'الدور الملحق') &&
                  e.name.startsWith('صب سقف')
              ? e.netTimePeriod()
              : e.timePeriodTotal();
    }

    return pw.Column(children: [
      pw.SizedBox(height: 0.5 * PdfPageFormat.cm),
      pw.Row(children: [
        pw.Text(
          floorName,
        ),
        pw.SizedBox(width: 0.5 * PdfPageFormat.cm),
        pw.Text('المساحة   ${floorArea} م²'),
      ]),
      pw.SizedBox(height: 0.5 * PdfPageFormat.cm),
      pw.TableHelper.fromTextArray(
        headers: headers,
        data: data,
        // headerDirection: pw.TextDirection.rtl,
        // tableDirection: pw.TextDirection.rtl,
        border: pw.TableBorder(
          verticalInside: pw.BorderSide(color: PdfColors.grey, width: 1),
          horizontalInside: pw.BorderSide(color: PdfColors.grey, width: 1),
          left: pw.BorderSide(color: PdfColors.grey, width: 1),
          right: pw.BorderSide(color: PdfColors.grey, width: 1),
          top: pw.BorderSide(color: PdfColors.grey, width: 1),
          bottom: pw.BorderSide(color: PdfColors.grey, width: 1),
        ),
        headerStyle: textStyle,
        headerDecoration: const pw.BoxDecoration(color: PdfColors.grey300),
        cellStyle: textStyle,
        cellHeight: 30,
        cellAlignments: {
          0: pw.Alignment.center,
          1: pw.Alignment.center,
          2: pw.Alignment.center,
          3: pw.Alignment.center,
          4: pw.Alignment.center,
          5: pw.Alignment.center,
        },
      ),
      pw.SizedBox(height: 0.5 * PdfPageFormat.cm),
      pw.Divider(color: PdfColors.grey),
      pw.SizedBox(height: 0.5 * PdfPageFormat.cm),
      floorTimePeriodtotal(textStyle, daysNo, floorName),
      pw.SizedBox(height: 0.5 * PdfPageFormat.cm),
      pw.Divider(color: PdfColors.grey),
      pw.SizedBox(height: 0.5 * PdfPageFormat.cm),
    ]);
  }

  // //ground floor Terms Table method
  pw.Widget floorTimePeriodtotal(textStyle, daysNo, floorName) {
    final customDecoration = pw.BoxDecoration(
      color: PdfColors.grey200,
    );
    final data = [
      [
        '$daysNo يوم',
        ' إجمالي الفترة الزمنية ل ${floorName}',
      ],
    ];

    return pw.TableHelper.fromTextArray(
      data: data,
      border: pw.TableBorder.all(color: PdfColors.white),
      headerDecoration: customDecoration,
      rowDecoration: customDecoration,
      cellStyle: textStyle,
      headerStyle: textStyle,
      cellHeight: 30,
      cellAlignments: {
        0: pw.Alignment.center,
      },
    );
  }

  pw.Widget projectTimePeriodtotal(textStyle) {
    final customDecoration = pw.BoxDecoration(
      color: PdfColors.grey200,
    );
    final data = [
      [
        '${DateFormat('EEEE, d MMMM yyyy', 'ar').format(widget.projectStartDate)}',
        'تاريخ بدء المشروع'
      ],
      [
        '${DateFormat('EEEE, d MMMM yyyy', 'ar').format(date)}',
        'تاريخ إنتهاء المشروع'
      ],
      [
        '$projectDaysNo يوم',
        ' إجمالي الفترة الزمنية للمشروع',
      ],
    ];
    isFirstTermInProject = true;
    projectDaysNo = 0;
    date = widget.projectStartDate;
    return pw.TableHelper.fromTextArray(
      data: data,
      border: pw.TableBorder.all(color: PdfColors.white),
      headerDecoration: customDecoration,
      rowDecoration: customDecoration,
      cellStyle: textStyle,
      headerStyle: textStyle,
      cellHeight: 30,
      cellAlignments: {
        0: pw.Alignment.center,
        1: pw.Alignment.center,
        2: pw.Alignment.center,
      },
    );
  }
}
