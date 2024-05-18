import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:intl/intl.dart';

class UnderGroundWorksPDFViewer extends StatelessWidget {
  const UnderGroundWorksPDFViewer({
    Key? key,
    //required this.order,
  }) : super(key: key);

  final String title = 'جدول زمني لمشروع سكني';
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
      lineSpacing: 10,
    );
    final headers = [
      'الفترة الكلية للبند (يوم)',
      'عدد العمال/الآلة',
      'فترة إنتظار (رش + فك نجارة)',
      'الفترة الزمنية الصافية (يوم)',
      'البند',
    ];

    pdf.addPage(pw.MultiPage(
        textDirection: pw.TextDirection.rtl,
        theme: pw.ThemeData.withFont(base: font, bold: pw.Font.helvetica()),
        pageFormat: PdfPageFormat.a4,
        build: (context) => [
              header(image, textStyle),
              pw.Divider(thickness: 0.7),
              //underground works start
              pw.SizedBox(height: 0.5 * PdfPageFormat.cm),
              pw.Row(children: [
                pw.Text(
                  'أعمال ماتحت الأرض',
                ),
              ]),
              pw.SizedBox(height: 0.5 * PdfPageFormat.cm),
              undergroundWorksTermsTable(textStyle, headers),
              pw.SizedBox(height: 0.5 * PdfPageFormat.cm),
              pw.Divider(color: PdfColors.grey),
              pw.SizedBox(height: 1 * PdfPageFormat.cm),
              total(textStyle, 200, 'أعمال ماتحت الأرض'),
              pw.Divider(color: PdfColors.grey),
              //underground works start
              //ground floor start
              pw.SizedBox(height: 0.5 * PdfPageFormat.cm),
              pw.Row(children: [
                pw.Text(
                  'الدور الأرضي',
                ),
                pw.SizedBox(width: 0.5 * PdfPageFormat.cm),
                pw.Text('المساحة  200 م²'),
              ]),
              pw.SizedBox(height: 0.5 * PdfPageFormat.cm),
              groundFloorTermsTable(textStyle, headers),
              pw.SizedBox(height: 0.5 * PdfPageFormat.cm),
              pw.Divider(color: PdfColors.grey),
              pw.SizedBox(height: 1 * PdfPageFormat.cm),
              total(textStyle, 220, 'لدور الأرضي'),
              pw.Divider(color: PdfColors.grey),
              pw.SizedBox(height: 1 * PdfPageFormat.cm),
              //ground floor end
              //first floor start
              pw.SizedBox(height: 0.5 * PdfPageFormat.cm),
              pw.Row(children: [
                pw.Text(
                  'الدور الأول',
                ),
                pw.SizedBox(width: 0.5 * PdfPageFormat.cm),
                pw.Text('المساحة  200 م²'),
              ]),
              pw.SizedBox(height: 0.5 * PdfPageFormat.cm),
              firstFloorTermsTable(textStyle, headers),
              pw.SizedBox(height: 0.5 * PdfPageFormat.cm),
              pw.Divider(color: PdfColors.grey),
              pw.SizedBox(height: 1 * PdfPageFormat.cm),
              total(textStyle, 130, 'لدور الأول'),
              pw.Divider(color: PdfColors.grey),
              pw.SizedBox(height: 1 * PdfPageFormat.cm),
              //first floor end
              //second floor start
              pw.SizedBox(height: 0.5 * PdfPageFormat.cm),
              pw.Row(children: [
                pw.Text(
                  'الدور الثاني',
                ),
                pw.SizedBox(width: 0.5 * PdfPageFormat.cm),
                pw.Text('المساحة  200 م²'),
              ]),
              pw.SizedBox(height: 0.5 * PdfPageFormat.cm),
              secondFloorTermsTable(textStyle, headers),
              pw.SizedBox(height: 0.5 * PdfPageFormat.cm),
              pw.Divider(color: PdfColors.grey),
              pw.SizedBox(height: 1 * PdfPageFormat.cm),
              total(textStyle, 130, 'لدور الثاني'),
              pw.Divider(color: PdfColors.grey),
              pw.SizedBox(height: 1 * PdfPageFormat.cm),
              //second floor end
              //third floor start
              pw.SizedBox(height: 0.5 * PdfPageFormat.cm),
              pw.Row(children: [
                pw.Text(
                  'الدور الثالث',
                ),
                pw.SizedBox(width: 0.5 * PdfPageFormat.cm),
                pw.Text('المساحة  200 م²'),
              ]),
              pw.SizedBox(height: 0.5 * PdfPageFormat.cm),
              thirdFloorTermsTable(textStyle, headers),
              pw.SizedBox(height: 0.5 * PdfPageFormat.cm),
              pw.Divider(color: PdfColors.grey),
              pw.SizedBox(height: 1 * PdfPageFormat.cm),
              total(textStyle, 130, 'لدور الثالث'),
              pw.Divider(color: PdfColors.grey),
              pw.SizedBox(height: 1 * PdfPageFormat.cm),
              //third floor end
              //fourth floor start
              pw.SizedBox(height: 0.5 * PdfPageFormat.cm),
              pw.Row(children: [
                pw.Text(
                  'الدور الرابع',
                ),
                pw.SizedBox(width: 0.5 * PdfPageFormat.cm),
                pw.Text('المساحة  200 م²'),
              ]),
              pw.SizedBox(height: 0.5 * PdfPageFormat.cm),
              fourthFloorTermsTable(textStyle, headers),
              pw.SizedBox(height: 0.5 * PdfPageFormat.cm),
              pw.Divider(color: PdfColors.grey),
              pw.SizedBox(height: 1 * PdfPageFormat.cm),
              total(textStyle, 130, 'لدور الرابع'),
              pw.Divider(color: PdfColors.grey),
              pw.SizedBox(height: 1 * PdfPageFormat.cm),
              //forth floor end
              // barCode()
            ]));

    return pdf.save();
  }

  static pw.Widget header(image, textStyle) => pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        crossAxisAlignment: pw.CrossAxisAlignment.center,
        children: [
          pw.Column(
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
                  pw.Text('فلان فلان فلان', style: textStyle),
                ],
              ),
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
  //underground Works Terms Table method
  pw.Widget undergroundWorksTermsTable(textStyle, headers) {
    final data = [
      [
        0,
        'شيول',
        2,
        0,
        'الحفر',
      ],
      [
        0,
        '-',
        0,
        0,
        'نجارة القواعد العادية',
      ],
      [
        0,
        '-',
        0,
        0,
        'صب القواعد العادية',
      ],
      [0, '2 نجارين + 2 مساعدين', 0, 0, 'نجارة القواعد المسلحة'],
      [0, '2 حدادين + 2 مساعدين', 0, 0, 'حدادة القواعد المسلحة'],
      [0, '5 عمال / خلاطة مركزية', 0, 0, 'صب القواعد المسلحة'],
      [0, '2 نجارين + 2 مساعدين', 0, 0, 'نجارة الرقاب'],
      [0, '2 حدادين + 2 مساعدين', 0, 0, 'حدادة الرقاب'],
      [0, '4 عمال / خلاطة مركزية', 7, 0, 'صب الرقاب'],
      [0, '2 نجارين + 2 مساعدين', 0, 0, 'نجارة الميدة'],
      [0, '2 حدادين + 2 مساعدين', 0, 0, 'حدادة الميدة'],
      [0, '5 عمال / خلاطة مركزية', 7, 0, 'صب الميدات'],
      [0, '4 عمال', 3, 0, 'بناء الكرسي الحجري'],
      [0, '4 عمال', 2, 0, 'عزل القواعد والرقاب'],
      [0, '4 عمال', 2, 0, 'عزل الميدات'],
      [0, 'شيول', 0, 0, 'ردم إلى منسوب أسفل الميدة'],
      [0, 'شيول', 0, 0, 'ردم داخل الميدات']
    ];

    return pw.TableHelper.fromTextArray(
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
      },
    );
  }

  //ground floor Terms Table method
  pw.Widget groundFloorTermsTable(textStyle, headers) {
    final data = [
      [
        0,
        '2 نجارين + 2 مساعدين',
        0,
        0,
        'نجارة الأعمدة الأرضي',
      ],
      [
        0,
        '2 حدادين + 2 مساعدين',
        0,
        0,
        'حدادة الأعمدة الأرضي',
      ],
      [
        0,
        '4 عمال / خلاطة مركزية',
        0,
        0,
        'صب  الأعمدة الأرضي',
      ],
      [0, '4 نجارين + 4 مساعدين', 0, 0, 'نجارة سقف الأرضي'],
      [0, '2 حدادين + 2 مساعدين', 0, 0, 'حدادة سقف الأرضي'],
      [0, '5 عمال / خلاطة مركزية', 14, 0, 'صب سقف الأرضي'],
      [0, '4 عمال', 0, 0, 'مباني الدور الأرضي'],
    ];

    return pw.TableHelper.fromTextArray(
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
      },
    );
  }

  //first floor Terms Table method
  pw.Widget firstFloorTermsTable(textStyle, headers) {
    final data = [
      [
        0,
        '2 نجارين + 2 مساعدين',
        0,
        0,
        'نجارة الأعمدة الأول',
      ],
      [
        0,
        '2 حدادين + 2 مساعدين',
        0,
        0,
        'حدادة الأعمدة الأول',
      ],
      [
        0,
        '4 عمال / خلاطة مركزية',
        0,
        0,
        'صب  الأعمدة الأول',
      ],
      [0, '4 نجارين + 4 مساعدين', 0, 0, 'نجارة سقف الأول'],
      [0, '2 حدادين + 2 مساعدين', 0, 0, 'حدادة سقف الأول'],
      [0, '5 عمال / خلاطة مركزية', 14, 0, 'صب سقف الأول'],
      [0, '4 عمال', 0, 0, 'مباني الدور الأول'],
    ];

    return pw.TableHelper.fromTextArray(
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
      },
    );
  }

  //second floor Terms Table method
  pw.Widget secondFloorTermsTable(textStyle, headers) {
    final data = [
      [
        0,
        '2 نجارين + 2 مساعدين',
        0,
        0,
        'نجارة الأعمدة الثاني',
      ],
      [
        0,
        '2 حدادين + 2 مساعدين',
        0,
        0,
        'حدادة الأعمدة الثاني',
      ],
      [
        0,
        '4 عمال / خلاطة مركزية',
        0,
        0,
        'صب الأعمدة الثاني',
      ],
      [0, '4 نجارين + 4 مساعدين', 0, 0, 'نجارة سقف الثاني'],
      [0, '2 حدادين + 2 مساعدين', 0, 0, 'حدادة سقف الثاني'],
      [0, '5 عمال / خلاطة مركزية', 14, 0, 'صب سقف الثاني'],
      [0, '4 عمال', 0, 0, 'مباني الدور الثاني'],
    ];

    return pw.TableHelper.fromTextArray(
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
      },
    );
  }

  //third floor Terms Table method
  pw.Widget thirdFloorTermsTable(textStyle, headers) {
    final data = [
      [
        0,
        '2 نجارين + 2 مساعدين',
        0,
        0,
        'نجارة الأعمدة الثالث',
      ],
      [
        0,
        '2 حدادين + 2 مساعدين',
        0,
        0,
        'حدادة الأعمدة الثالث',
      ],
      [
        0,
        '4 عمال / خلاطة مركزية',
        0,
        0,
        'صب الأعمدة الثالث',
      ],
      [0, '4 نجارين + 4 مساعدين', 0, 0, 'نجارة سقف الثالث'],
      [0, '2 حدادين + 2 مساعدين', 0, 0, 'حدادة سقف الثالث'],
      [0, '5 عمال / خلاطة مركزية', 14, 0, 'صب سقف الثالث'],
      [0, '4 عمال', 0, 0, 'مباني الدور الثالث'],
    ];

    return pw.TableHelper.fromTextArray(
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
      },
    );
  }

  //fourth floor Terms Table method
  pw.Widget fourthFloorTermsTable(textStyle, headers) {
    final data = [
      [
        0,
        '2 نجارين + 2 مساعدين',
        0,
        0,
        'نجارة الأعمدة الرابع',
      ],
      [
        0,
        '2 حدادين + 2 مساعدين',
        0,
        0,
        'حدادة الأعمدة الرابع',
      ],
      [
        0,
        '4 عمال / خلاطة مركزية',
        0,
        0,
        'صب الأعمدة الرابع',
      ],
      [0, '4 نجارين + 4 مساعدين', 0, 0, 'نجارة سقف الرابع'],
      [0, '2 حدادين + 2 مساعدين', 0, 0, 'حدادة سقف الرابع'],
      [0, '5 عمال / خلاطة مركزية', 14, 0, 'صب سقف الرابع'],
      [0, '4 عمال', 0, 0, 'مباني الدور الرابع'],
    ];

    return pw.TableHelper.fromTextArray(
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
      },
    );
  }

  pw.Widget total(textStyle, total, floorName) {
    final customDecoration = pw.BoxDecoration(
      color: PdfColors.grey200,
    );
    final data = [
      [
        '$total يوم',
        'إجمالي الفترة الزمنية ل${floorName}',
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

  // pw.Widget barCode() {
  //   return pw.Center(
  //       child: pw.BarcodeWidget(
  //           data: "1234567890",
  //           barcode: pw.Barcode.qrCode(),
  //           width: 4 * PdfPageFormat.cm,
  //           height: 4 * PdfPageFormat.cm));
  // }
}
