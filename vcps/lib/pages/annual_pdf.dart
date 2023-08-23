import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart' as pw;

import '../store/colors.dart';
import '../store/store.dart';

class Annual extends StatefulWidget {
  final int index;
  const Annual({Key key, this.index}) : super(key: key);

  @override
  State<Annual> createState() => _AnnualState();
}

class _AnnualState extends State<Annual> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackground,
      appBar: AppBar(
        title: const Text('Results PDF Preview'),
      ),
      body: PdfPreview(
        dynamicLayout: false,
        canChangePageFormat: false,
        canDebug: false,
        maxPageWidth: 700,
        build: (format) => generateDocument(format),
      ),
    );
  }

  Future<Uint8List> generateDocument(PdfPageFormat format) async {
    final doc = pw.Document(pageMode: PdfPageMode.outlines);

    final ByteData byte1 = await rootBundle.load('assets/logo.png');
    final Uint8List list1 = byte1.buffer.asUint8List();

    for (int i = 0;
        i < MainStore.classes[widget.index].studentsAnnual.length;
        i++) {
      doc.addPage(
        pw.Page(
          build: (context) {
            return pw.Padding(
              padding: const pw.EdgeInsets.only(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
              ),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      children: [
                        pw.Container(
                            width: double.maxFinite,
                            height: 160,
                            decoration: const pw.BoxDecoration(
                                color: PdfColors.green200),
                            child: pw.Stack(children: [
                              pw.Align(
                                  alignment: pw.Alignment.bottomCenter,
                                  child: pw.Container(
                                      height: 65,
                                      width: double.maxFinite,
                                      color: PdfColors.white,
                                      margin: const pw.EdgeInsets.all(3))),
                              pw.Container(
                                  margin: const pw.EdgeInsets.only(
                                      top: 27, left: 8),
                                  child: pw.Align(
                                    alignment: pw.Alignment.topLeft,
                                    child: pw.SizedBox(
                                      height: 80,
                                      width: 80,
                                      child: pw.Image(pw.MemoryImage(list1)),
                                    ),
                                  )),
                              pw.Align(
                                  alignment: pw.Alignment.topCenter,
                                  child: pw.Row(
                                      mainAxisAlignment:
                                          pw.MainAxisAlignment.center,
                                      children: [
                                        pw.Transform.rotate(
                                            angle: pi * 0.1,
                                            child: pw.Text('V',
                                                style: pw.TextStyle(
                                                    fontSize: 60,
                                                    fontWeight:
                                                        pw.FontWeight.bold,
                                                    color: PdfColors.blue))),
                                        pw.Transform.rotate(
                                            angle: pi * 2,
                                            child: pw.Text('I',
                                                style: pw.TextStyle(
                                                    fontSize: 60,
                                                    fontWeight:
                                                        pw.FontWeight.bold,
                                                    color: PdfColors.yellow))),
                                        pw.Transform.rotate(
                                            angle: pi * 1.97,
                                            child: pw.Text('R',
                                                style: pw.TextStyle(
                                                    fontSize: 60,
                                                    fontWeight:
                                                        pw.FontWeight.bold,
                                                    color: PdfColors.pink200))),
                                        pw.Transform.rotate(
                                            angle: pi * 2,
                                            child: pw.Text('T',
                                                style: pw.TextStyle(
                                                    fontSize: 60,
                                                    fontWeight:
                                                        pw.FontWeight.bold,
                                                    color: PdfColors.black))),
                                        pw.Transform.rotate(
                                            angle: pi * 1.96,
                                            child: pw.Text('U',
                                                style: pw.TextStyle(
                                                    fontSize: 60,
                                                    fontWeight:
                                                        pw.FontWeight.bold,
                                                    color: PdfColors.red))),
                                        pw.Transform.rotate(
                                            angle: pi * 0.1,
                                            child: pw.Text('O',
                                                style: pw.TextStyle(
                                                    fontSize: 60,
                                                    fontWeight:
                                                        pw.FontWeight.bold,
                                                    color: PdfColors.blue))),
                                        pw.Transform.rotate(
                                            angle: pi * 1.96,
                                            child: pw.Text('U',
                                                style: pw.TextStyle(
                                                    fontSize: 60,
                                                    fontWeight:
                                                        pw.FontWeight.bold,
                                                    color: PdfColors.pink200))),
                                        pw.Transform.rotate(
                                            angle: pi * 0.05,
                                            child: pw.Text('S',
                                                style: pw.TextStyle(
                                                    fontSize: 60,
                                                    fontWeight:
                                                        pw.FontWeight.bold,
                                                    color: PdfColors.red)))
                                      ])),
                              pw.Align(
                                  alignment: pw.Alignment.center,
                                  child: pw.Container(
                                      child: pw.Text('CHILDREN SCHOOL, GBOKO',
                                          style: pw.TextStyle(
                                              fontSize: 21,
                                              fontWeight: pw.FontWeight.bold,
                                              color: PdfColors.white)))),
                              pw.Align(
                                  alignment: pw.Alignment.centerRight,
                                  child: pw.Container(
                                      height: 87,
                                      width: 70,
                                      decoration: pw.BoxDecoration(
                                          color: PdfColors.white,
                                          border: pw.Border.all()),
                                      padding: const pw.EdgeInsets.all(3),
                                      margin: const pw.EdgeInsets.only(
                                        right: 8,
                                      ),
                                      child: pw.Center(
                                          child: pw.Text(
                                              '   Recent\n  Passport\nPhotograph')))),
                              pw.Align(
                                  alignment: pw.Alignment.bottomCenter,
                                  child: pw.Container(
                                      margin:
                                          const pw.EdgeInsets.only(bottom: 10),
                                      decoration: const pw.BoxDecoration(
                                          border: pw.Border.symmetric(
                                              horizontal: pw.BorderSide(
                                                  color: PdfColors.black,
                                                  width: 1)),
                                          color: PdfColors.red),
                                      child: pw.Text(
                                          'ANNUAL CONTINOUS ASSESSMENT FOR NURSERY SCHOOL',
                                          style: pw.TextStyle(
                                              fontSize: 15,
                                              fontWeight: pw.FontWeight.bold,
                                              color: PdfColors.white)))),
                              pw.Align(
                                  alignment: pw.Alignment.bottomCenter,
                                  child: pw.Container(
                                      margin:
                                          const pw.EdgeInsets.only(bottom: 53),
                                      child: pw.Text(
                                          'No. 12 Danmagana Street GRA Gboko, Benue State',
                                          style: pw.TextStyle(
                                              fontSize: 12,
                                              fontWeight: pw.FontWeight.bold,
                                              color: PdfColors.red900)))),
                              pw.Align(
                                  alignment: pw.Alignment.bottomCenter,
                                  child: pw.Container(
                                      margin:
                                          const pw.EdgeInsets.only(bottom: 36),
                                      child: pw.Text('Character Excellence',
                                          style: pw.TextStyle(
                                              fontSize: 14,
                                              fontStyle: pw.FontStyle.italic,
                                              fontWeight: pw.FontWeight.bold,
                                              letterSpacing: 1,
                                              color: PdfColors.blue900))))
                            ])),
                      ]),
                  pw.SizedBox(height: 10),
                  pw.Row(children: [
                    pw.Text(
                        'Name of Pupil: ${MainStore.classes[widget.index].studentsAnnual[i].name}',
                        style: pw.TextStyle(
                          fontSize: 12,
                          fontWeight: pw.FontWeight.bold,
                        )),
                    pw.Expanded(child: pw.Container()),
                    pw.Text(
                        'Session: ${MainStore.classes[widget.index].session}',
                        style: pw.TextStyle(
                          fontSize: 12,
                          fontWeight: pw.FontWeight.bold,
                        )),
                    pw.Expanded(child: pw.Container()),
                    pw.Text(
                        'Class: ${MainStore.classes[widget.index].className}',
                        style: pw.TextStyle(
                          fontSize: 12,
                          fontWeight: pw.FontWeight.bold,
                        )),
                  ]),
                  pw.SizedBox(height: 5),
                  pw.Row(children: [
                    pw.Text("Maximum Attendance: ",
                        style: pw.TextStyle(
                          fontSize: 12,
                          fontWeight: pw.FontWeight.bold,
                        )),
                    pw.Expanded(child: pw.Container()),
                    pw.Text("Time Present: ",
                        style: pw.TextStyle(
                          fontSize: 12,
                          fontWeight: pw.FontWeight.bold,
                        )),
                    pw.Expanded(child: pw.Container()),
                    pw.Text("Time Absent:          ",
                        style: pw.TextStyle(
                          fontSize: 12,
                          fontWeight: pw.FontWeight.bold,
                        )),
                  ]),
                  pw.SizedBox(height: 5),
                  pw.Row(children: [
                    pw.Text(
                        "Number in Class: ${MainStore.classes[widget.index].studentsAnnual.length}",
                        style: pw.TextStyle(
                          fontSize: 12,
                          fontWeight: pw.FontWeight.bold,
                        )),
                    pw.Expanded(child: pw.Container()),
                    pw.Text(
                        'Position: ${MainStore.classes[widget.index].studentsAnnual[i].overAllPosition}',
                        style: pw.TextStyle(
                          fontSize: 12,
                          fontWeight: pw.FontWeight.bold,
                        )),
                  ]),
                  pw.SizedBox(height: 5),
                  pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Row(children: [
                          pw.Container(
                            decoration:
                                pw.BoxDecoration(border: pw.Border.all()),
                            height: 50,
                            width: 140,
                            child: pw.Center(
                                child: pw.Text("SUBJECTS",
                                    style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold,
                                    ))),
                          ),
                          pw.Container(
                            decoration:
                                pw.BoxDecoration(border: pw.Border.all()),
                            height: 50,
                            width: 55,
                            child: pw.Center(
                                child: pw.Text('1ST TERM\n  TOTAL\n    100%',
                                    style: pw.TextStyle(
                                      fontSize: 10,
                                      fontWeight: pw.FontWeight.bold,
                                    ))),
                          ),
                          pw.Container(
                            decoration:
                                pw.BoxDecoration(border: pw.Border.all()),
                            height: 50,
                            width: 55,
                            child: pw.Center(
                                child: pw.Text('2ND TERM\n  TOTAL\n    100%',
                                    style: pw.TextStyle(
                                      fontSize: 10,
                                      fontWeight: pw.FontWeight.bold,
                                    ))),
                          ),
                          pw.Container(
                            decoration:
                                pw.BoxDecoration(border: pw.Border.all()),
                            height: 50,
                            width: 55,
                            child: pw.Center(
                                child: pw.Text('3RD TERM\n  TOTAL\n    100%',
                                    style: pw.TextStyle(
                                      fontSize: 10,
                                      fontWeight: pw.FontWeight.bold,
                                    ))),
                          ),
                          pw.Container(
                            decoration:
                                pw.BoxDecoration(border: pw.Border.all()),
                            height: 50,
                            width: 55,
                            child: pw.Center(
                                child: pw.Text('  YEAR\n  TOTAL\n    300%',
                                    style: pw.TextStyle(
                                      fontSize: 10,
                                      fontWeight: pw.FontWeight.bold,
                                    ))),
                          ),
                          pw.Container(
                            decoration:
                                pw.BoxDecoration(border: pw.Border.all()),
                            height: 50,
                            width: 50,
                            child: pw.Center(
                                child: pw.Text('LETTER\nGRADE',
                                    style: pw.TextStyle(
                                      fontSize: 10,
                                      fontWeight: pw.FontWeight.bold,
                                    ))),
                          ),
                          pw.Container(
                            decoration:
                                pw.BoxDecoration(border: pw.Border.all()),
                            height: 50,
                            width: 70,
                            child: pw.Center(
                                child: pw.Text(
                                    'SUBJECTS\nTEACHERS\nREMARK &\nSIGNATURE',
                                    style: pw.TextStyle(
                                      fontSize: 10,
                                      fontWeight: pw.FontWeight.bold,
                                    ))),
                          ),
                        ]),
                           pw.Column(
                          children: _listWidgets(i),
                        ),
                        pw.SizedBox(height: 10),
                        pw.Row(children: [
                          pw.Text(
                              'Total Scores: ${MainStore.classes[widget.index].studentsAnnual[i].overAllTotal}',
                              style: pw.TextStyle(
                                fontSize: 12,
                                fontWeight: pw.FontWeight.bold,
                              )),
                          pw.Expanded(child: pw.Container()),
                          pw.Text(
                              'Maximum Scores: ${(MainStore.classes[widget.index].studentsAnnual[i].subjects.length * 300).toString()}',
                              style: pw.TextStyle(
                                fontSize: 12,
                                fontWeight: pw.FontWeight.bold,
                              )),
                          pw.Expanded(child: pw.Container()),
                          pw.Text(
                              'Average Marks: ${MainStore.classes[widget.index].studentsAnnual[i].overAllAverage.toStringAsFixed(2)}',
                              style: pw.TextStyle(
                                fontSize: 12,
                                fontWeight: pw.FontWeight.bold,
                              )),
                        ]),
                        pw.SizedBox(height: 8),
                        pw.Text(
                            "Class Teacher's Remark: ${ftremarkHelper(MainStore.classes[widget.index].studentsAnnual[i].overAllAverage)}",
                            style: pw.TextStyle(
                              fontSize: 12,
                              fontWeight: pw.FontWeight.bold,
                            )),
                        pw.SizedBox(height: 5),
                        pw.Text(
                            "Class Teacher's Name: ${MainStore.classes[widget.index].ftName}",
                            style: pw.TextStyle(
                              fontSize: 12,
                              fontWeight: pw.FontWeight.bold,
                            )),
                        pw.SizedBox(height: 5),
                        pw.Text("Signature: ",
                            style: pw.TextStyle(
                              fontSize: 12,
                              fontWeight: pw.FontWeight.bold,
                            )),
                        pw.SizedBox(height: 8),
                        pw.Text(
                            "Head Teacher's Remark: ${htremarkHelper(MainStore.classes[widget.index].studentsAnnual[i].overAllAverage)}",
                            style: pw.TextStyle(
                              fontSize: 12,
                              fontWeight: pw.FontWeight.bold,
                            )),
                        pw.SizedBox(height: 5),
                        pw.Text("Head Teacher's Name: ${MainStore.htName}",
                            style: pw.TextStyle(
                              fontSize: 12,
                              fontWeight: pw.FontWeight.bold,
                            )),
                        pw.SizedBox(height: 5),
                        pw.Text("Signature: ",
                            style: pw.TextStyle(
                              fontSize: 12,
                              fontWeight: pw.FontWeight.bold,
                            )),
                        pw.SizedBox(height: 10),
                        pw.Container(
                          decoration:
                              const pw.BoxDecoration(color: PdfColors.green700),
                          padding: const pw.EdgeInsets.all(4),
                          child: pw.Text("GRADING SCORES",
                              style: pw.TextStyle(
                                fontSize: 12,
                                color: PdfColors.white,
                                fontWeight: pw.FontWeight.bold,
                              )),
                        ),
                        pw.Row(children: [
                          pw.Text(
                              "A. 80% and above  Excellent  B. 70-79%  Very Good  C. 60-69%  Good\nD. 50-59%                Fair           E. 40-49%  Average   F. Below 39%  Fail",
                              style: pw.TextStyle(
                                fontSize: 12,
                                fontWeight: pw.FontWeight.bold,
                              )),
                          pw.SizedBox(width: 10),
                          pw.Column(children: [
                            pw.Row(children: [
                              pw.Container(
                                decoration:
                                    pw.BoxDecoration(border: pw.Border.all()),
                                height: 20,
                                width: 55,
                                child: pw.Center(
                                    child: pw.Text(' NEXT TERM\n BEGINS',
                                        style: pw.TextStyle(
                                          fontSize: 8,
                                          fontWeight: pw.FontWeight.bold,
                                        ))),
                              ),
                              pw.Container(
                                decoration:
                                    pw.BoxDecoration(border: pw.Border.all()),
                                height: 20,
                                width: 40,
                                child: pw.Center(
                                    child: pw.Text('',
                                        style: pw.TextStyle(
                                          fontSize: 9,
                                          fontWeight: pw.FontWeight.bold,
                                        ))),
                              ),
                            ]),
                            pw.Row(children: [
                              pw.Container(
                                decoration:
                                    pw.BoxDecoration(border: pw.Border.all()),
                                height: 20,
                                width: 55,
                                child: pw.Center(
                                    child: pw.Text(' FEES\n OWED',
                                        style: pw.TextStyle(
                                          fontSize: 8,
                                          fontWeight: pw.FontWeight.bold,
                                        ))),
                              ),
                              pw.Container(
                                decoration:
                                    pw.BoxDecoration(border: pw.Border.all()),
                                height: 20,
                                width: 40,
                                child: pw.Center(
                                    child: pw.Text('',
                                        style: pw.TextStyle(
                                          fontSize: 9,
                                          fontWeight: pw.FontWeight.bold,
                                        ))),
                              ),
                            ]),
                            pw.Row(children: [
                              pw.Container(
                                decoration:
                                    pw.BoxDecoration(border: pw.Border.all()),
                                height: 20,
                                width: 55,
                                child: pw.Center(
                                    child: pw.Text(' BILL FOR\n NEXT TERM',
                                        style: pw.TextStyle(
                                          fontSize: 8,
                                          fontWeight: pw.FontWeight.bold,
                                        ))),
                              ),
                              pw.Container(
                                decoration:
                                    pw.BoxDecoration(border: pw.Border.all()),
                                height: 20,
                                width: 40,
                                child: pw.Center(
                                    child: pw.Text('',
                                        style: pw.TextStyle(
                                          fontSize: 9,
                                          fontWeight: pw.FontWeight.bold,
                                        ))),
                              ),
                            ])
                          ])
                        ])
                      ])
                ],
              ),
            );
          },
        ),
      );
    }

    return await doc.save();
  }

  _listWidgets(int stdIndex) {
    List<pw.Widget> temp = [];
    for (int i = 0;
        i < MainStore.classes[widget.index].studentsAnnual[stdIndex].subjects.length;
        i++) {
      temp.add(_sujectRow(i, stdIndex));
    }
    return temp;
  }

  _sujectRow(int sub, int stdIndex) {
    return pw.Row(children: [
      pw.Container(
        decoration: pw.BoxDecoration(border: pw.Border.all()),
        height: 16,
        width: 140,
        child: pw.Center(
            child: pw.Text(
                MainStore.classes[widget.index].studentsAnnual[stdIndex]
                    .subjects[sub].name,
                style: pw.TextStyle(
                  fontSize: 9,
                  fontWeight: pw.FontWeight.bold,
                ))),
      ),
      pw.Container(
        decoration: pw.BoxDecoration(border: pw.Border.all()),
        height: 16,
        width: 55,
        child: pw.Center(
            child: pw.Text(
                MainStore.classes[widget.index].studentsAnnual[stdIndex]
                    .subjects[sub].termTotal[0]
                    .toString(),
                style: pw.TextStyle(
                  fontSize: 9,
                  fontWeight: pw.FontWeight.bold,
                ))),
      ),
      pw.Container(
        decoration: pw.BoxDecoration(border: pw.Border.all()),
        height: 16,
        width: 55,
        child: pw.Center(
            child: pw.Text(
                MainStore.classes[widget.index].studentsAnnual[stdIndex]
                    .subjects[sub].termTotal[1]
                    .toString(),
                style: pw.TextStyle(
                  fontSize: 9,
                  fontWeight: pw.FontWeight.bold,
                ))),
      ),
      pw.Container(
        decoration: pw.BoxDecoration(border: pw.Border.all()),
        height: 16,
        width: 55,
        child: pw.Center(
            child: pw.Text(
                MainStore.classes[widget.index].studentsAnnual[stdIndex]
                    .subjects[sub].termTotal[2]
                    .toString(),
                style: pw.TextStyle(
                  fontSize: 9,
                  fontWeight: pw.FontWeight.bold,
                ))),
      ),
      pw.Container(
        decoration: pw.BoxDecoration(border: pw.Border.all()),
        height: 16,
        width: 55,
        child: pw.Center(
            child: pw.Text(
                MainStore.classes[widget.index].studentsAnnual[stdIndex]
                    .subjects[sub].yearTotal
                    .toString(),
                style: pw.TextStyle(
                  fontSize: 9,
                  fontWeight: pw.FontWeight.bold,
                ))),
      ),
      pw.Container(
        decoration: pw.BoxDecoration(border: pw.Border.all()),
        height: 16,
        width: 50,
        child: pw.Center(
            child: pw.Text(
                gradeHelper(MainStore.classes[widget.index]
                    .studentsAnnual[stdIndex].subjects[sub].average),
                style: pw.TextStyle(
                  fontSize: 9,
                  fontWeight: pw.FontWeight.bold,
                ))),
      ),
      pw.Container(
        decoration: pw.BoxDecoration(border: pw.Border.all()),
        height: 16,
        width: 70,
        child: pw.Center(
            child: pw.Text(remarkHelper(0),
                style: pw.TextStyle(
                  fontSize: 9,
                  fontWeight: pw.FontWeight.bold,
                ))),
      ),
    ]);
  }
}

String gradeHelper(score) {
  if (score <= 100 && score >= 80) {
    return "A";
  } else {
    if (score < 80 && score >= 70) {
      return "B";
    } else {
      if (score < 70 && score >= 60) {
        return "C";
      } else {
        if (score < 60 && score >= 50) {
          return "D";
        } else {
          if (score < 50 && score >= 40) {
            return "E";
          } else if (score < 40 && score >= 0) {
            return "F";
          } else {
            return "Null";
          }
        }
      }
    }
  }
}

String remarkHelper(score) {
  if (score <= 100 && score >= 80) {
    return "Excellent";
  } else {
    if (score < 80 && score >= 70) {
      return "Very Good";
    } else {
      if (score < 70 && score >= 60) {
        return "Good";
      } else {
        if (score < 60 && score >= 50) {
          return "Fair";
        } else {
          if (score < 50 && score >= 40) {
            return "Average";
          } else if (score < 40 && score >= 0) {
            return "Fail";
          } else {
            return "Null";
          }
        }
      }
    }
  }
}

String ftremarkHelper(score) {
  if (score <= 100 && score >= 80) {
    return "An Outstandinng result. Keep it up.";
  } else {
    if (score < 80 && score >= 70) {
      return "Excellent Result. Keep it up";
    } else {
      if (score < 70 && score >= 60) {
        return "A good Result. You can do better";
      } else {
        if (score < 60 && score >= 50) {
          return "Satisfactory performance. You can more.";
        } else {
          if (score < 50 && score >= 40) {
            return "Average performance, Sit up";
          } else if (score < 40 && score >= 0) {
            return "Poor result. Sit up";
          } else {
            return "Null";
          }
        }
      }
    }
  }
}

String htremarkHelper(score) {
  if (score <= 100 && score >= 80) {
    return "Wonderful performance. Keep it up.";
  } else {
    if (score < 80 && score >= 70) {
      return "An Amazing Result. Keep it up";
    } else {
      if (score < 70 && score >= 60) {
        return "Good Result. You can more";
      } else {
        if (score < 60 && score >= 50) {
          return "Satisfactory Result. You can better.";
        } else {
          if (score < 50 && score >= 40) {
            return "Average Result, Work harder";
          } else if (score < 40 && score >= 0) {
            return "Poor performance. Do better next time.";
          } else {
            return "Null";
          }
        }
      }
    }
  }
}
