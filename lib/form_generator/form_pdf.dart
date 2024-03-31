import 'package:code0/form_generator/save_file_mobile.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class PdfGenerator extends StatefulWidget {
  const PdfGenerator({super.key});

  @override
  State<PdfGenerator> createState() => _PdfGeneratorState();
}

class _PdfGeneratorState extends State<PdfGenerator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              generatePdf();
            },
            child: const Text("Pdf")),
      ),
    );
  }
}

Future<void> generatePdf() async {
 
  PdfDocument document = PdfDocument();


  PdfPage page = document.pages.add();

  PdfFont font = PdfStandardFont(PdfFontFamily.helvetica, 12);

  page.graphics.drawString(
    'FIRST INFORMATION REPORT',
    PdfStandardFont(PdfFontFamily.courier, 18),
    bounds: Rect.fromLTWH(0, 50, page.getClientSize().width, 30),
    format: PdfStringFormat(
      alignment: PdfTextAlignment.center,
      lineAlignment: PdfVerticalAlignment.middle,
    ),
  );
  double y = 100;
  page.graphics.drawString(
    'TAMIL NADU POLICE\n(Under Section 154 Cr.P.C.)\nINTEGRATED INVESTIGATION FORM-1',
    PdfStandardFont(PdfFontFamily.timesRoman, 14),
    bounds: Rect.fromLTWH(0, y, page.getClientSize().width, 50),
    format: PdfStringFormat(
      alignment: PdfTextAlignment.center,
      lineAlignment: PdfVerticalAlignment.middle,
    ),
  );
  y += 100;

  double x1 = 50;

  PdfStringFormat fieldFormat = PdfStringFormat(
    alignment: PdfTextAlignment.left,
    lineAlignment: PdfVerticalAlignment.middle,
  );

  page.graphics.drawString(
    '${'1. District :'.padRight(35)}${'PS:'.padRight(35)}${'Year:'.padRight(35)}Fir No:',
    font,
    bounds: Rect.fromLTWH(x1, y, 500, 20),
    format: fieldFormat,
  );

  y += 30;

  page.graphics.drawString(
    '${'2. (i) Act:'.padRight(70)}${'Sections:'.padRight(75)}${'\n   (ii) Act:'.padRight(75)}${'Sections:'.padRight(75)}${'\n   (iii) Act:'.padRight(75)}${'Sections:'.padRight(75)}\n   (iv) Other Acts & Sections:',
    font,
    bounds: Rect.fromLTWH(x1, y, 500, 80),
    format: fieldFormat,
  );

  y += 100;
  page.graphics.drawString(
    '3. (a) Occurrence of Offence Day:'.padRight(70) +
        'Date from:'.padRight(30) +
        'Date to:'.padRight(30) +
        '\n    Time Period:'.padRight(50) +
        'Time from:'.padRight(50) +
        'Time to:'.padRight(50) +
        '\n   (b) Information Received at PS. Date:'.padRight(75) +
        'Time:'.padRight(50) +
        '\n   (c) General Diary Reference: Entry No(s)'.padRight(65) +
        'Time:'.padRight(50),
    font,
    bounds: Rect.fromLTWH(x1, y, 500, 100),
    format: fieldFormat,
  );

  y += 120;

  page.graphics.drawString(
    '4. Type of Information: Written/Oral:',
    font,
    bounds: Rect.fromLTWH(x1, y, 500, 20),
    format: fieldFormat,
  );

  y += 30;

  page.graphics.drawString(
    '${'5. Place of Occurrence\n(a) Direction and Distance from PS:'.padRight(45)}${'Beat Number: -\n(b) Address:\n\n(c) In case outside limit of this Police Station, then the Name of P.S :'.padRight(70)}District:',
    font,
    bounds: Rect.fromLTWH(x1, y, 500, 100),
    format: fieldFormat,
  );

  y += 120;

  page.graphics.drawString(
    '${'6. Complainant/Informant\n(a) Name:'.padRight(20)}${'Father\'s/Husband\'s Name:'.padRight(20)}${'\n(c) Date / Year of Birth:'.padRight(40)}${'Nationality:'.padRight(40)}${'PassPort No:'.padRight(40)}${'\n    Date of Issue:'.padRight(75)}Place of Issue:\n(f) Occupation:\n(g) Address:',
    font,
    bounds: Rect.fromLTWH(x1, y, 500, 100),
    format: fieldFormat,
  );

  y += 120;

  PdfPage page1 = document.pages.add();
  PdfStringFormat fieldFormat1 = PdfStringFormat(
    alignment: PdfTextAlignment.left,
    lineAlignment: PdfVerticalAlignment.middle,
  );

  y = 140;
  page1.graphics.drawString(
    '7. Details of Known/Suspected/Unknown accused with full particulars. (Attach separate sheet if necessary)',
    font,
    bounds: Rect.fromLTWH(x1, y, 500, 20),
    format: fieldFormat,
  );

  y += 30;

  page1.graphics.drawString(
    '8. Reasons for delay in reporting by the complainant / Informant:',
    font,
    bounds: Rect.fromLTWH(x1, y, 500, 20),
    format: fieldFormat1,
  );

  y += 30;

  page1.graphics.drawString(
    '9. Particulars of properties stolen / involved (Attach separate sheet if necessary)',
    font,
    bounds: Rect.fromLTWH(x1, y, 500, 20),
    format: fieldFormat1,
  );

  y += 30;

  page1.graphics.drawString(
    '10. FIR Contents (Attach separate sheet, if required):',
    font,
    bounds: Rect.fromLTWH(x1, y, 500, 20),
    format: fieldFormat1,
  );

  y += 30;
  
  page1.graphics.drawString(
    '13. Action taken : Since the above report reveals commission of offence(s) u/s as mentioned at item No.2 registered the case\nand took up the investigation / directed ........................... Rank........................... to take up the Investigation / Refused\nInvestigation / transferred to PS.............................................................on point of jurisdiction.',
    font,
    bounds: Rect.fromLTWH(x1, y, 500, 100),
    format: fieldFormat1,
  );

  y += 120;
  page1.graphics.drawString(
    'FIR read over to the Complainant / Informant, admitted to be correctly recorded and a copy given to the Complainant /\nInformant free of cost.',
    font,
    bounds: Rect.fromLTWH(x1, y, 500, 40),
    format: fieldFormat1,
  );

  y += 60;

  page1.graphics.drawString(
    'Signature / Thumb Impression of the Complainant',
    font,
    bounds: Rect.fromLTWH(x1, y, 500, 40),
    format: fieldFormat1,
  );
  y += 60;
  page1.graphics.drawString(
    'Informant Signature of the Officer in-charge, Police Station',
    font,
    bounds: Rect.fromLTWH(x1, y, 500, 40),
    format: fieldFormat1,
  );

  y += 60;

  page1.graphics.drawString(
    '${'Date & Time of despatch to the court:'.padRight(70)}${'Name:'.padRight(20)}Rank:',
    font,
    bounds: Rect.fromLTWH(x1, y, 500, 20),
    format: fieldFormat1,
  );

  final fileBytes = document.saveSync();
  await saveAndLaunchFile(fileBytes, 'Invoie.pdf');
}
