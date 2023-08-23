import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:math';

import '../store/colors.dart';
import '../store/store.dart';

class ShowResult extends StatefulWidget {
  final int index;
  final int termIndex;
  const ShowResult({Key key, this.index, this.termIndex}) : super(key: key);

  @override
  State<ShowResult> createState() => _ShowResultState();
}

class _ShowResultState extends State<ShowResult> {
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
        build: (format) => generateDocument(PdfPageFormat.a4),
      ),
    );
  }

  Future<Uint8List> generateDocument(PdfPageFormat format) async {
    final doc = pw.Document(pageMode: PdfPageMode.outlines);
    final ByteData byte = await rootBundle.load('assets/stamp.jpg');
    final Uint8List list = byte.buffer.asUint8List();

    final ByteData byte1 = await rootBundle.load('assets/logo.png');
    final Uint8List list1 = byte1.buffer.asUint8List();

    for (int i = 0;
        i <
            MainStore
                .classes[widget.index].terms[widget.termIndex].students.length;
        i++) {
      doc.addPage(
        pw.Page(
          pageFormat: format.applyMargin(left: 0, top: 0, right: 0, bottom: 0),
          build: (context) {
            return pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      children: [
                        pw.Container(
                            width: double.maxFinite,
                            height: 160,
                            decoration: const pw.BoxDecoration(
                                color: PdfColors.blue900),
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
                                          'TERMLY CONTINOUS ASSESSMENT FOR PRIMARY SCHOOL',
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
                  pw.SizedBox(height: 3),
                  pw.Row(children: [
                    pw.Text(
                        'Name of Pupil: ${MainStore.classes[widget.index].terms[widget.termIndex].students[i].name}',
                        style: pw.TextStyle(
                          fontSize: 12,
                          fontWeight: pw.FontWeight.bold,
                        )),
                    pw.Expanded(child: pw.Container()),
                    pw.Text(
                        'Term: ${MainStore.classes[widget.index].terms[widget.termIndex].termName}',
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
                  pw.SizedBox(height: 3),
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
                  pw.SizedBox(height: 3),
                  pw.Row(children: [
                    pw.Text(
                        "Number in Class: ${MainStore.classes[widget.index].terms[widget.termIndex].students.length}",
                        style: pw.TextStyle(
                          fontSize: 12,
                          fontWeight: pw.FontWeight.bold,
                        )),
                    pw.Expanded(child: pw.Container()),
                    pw.Text(
                        'Position: ${MainStore.classes[widget.index].terms[widget.termIndex].students[i].position}',
                        style: pw.TextStyle(
                          fontSize: 12,
                          fontWeight: pw.FontWeight.bold,
                        )),
                  ]),
                  pw.SizedBox(height: 3),
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Row(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Container(
                              decoration:
                                  pw.BoxDecoration(border: pw.Border.all()),
                              height: 40,
                              width: 110,
                              child: pw.Center(
                                  child: pw.Text("        'A'\nSUBJECTS",
                                      style: pw.TextStyle(
                                        fontWeight: pw.FontWeight.bold,
                                      ))),
                            ),
                            pw.Row(children: [
                              pw.Container(
                                  padding: const pw.EdgeInsets.only(left: 2),
                                  decoration:
                                      pw.BoxDecoration(border: pw.Border.all()),
                                  height: 40,
                                  width: 82,
                                  child: pw.Center(
                                      child: pw.Text('1ST ASS\nWEEK 1-6',
                                          style: pw.TextStyle(
                                            fontSize: 8,
                                            fontWeight: pw.FontWeight.bold,
                                          )))),
                              pw.Container(
                                  padding: const pw.EdgeInsets.only(left: 2),
                                  decoration:
                                      pw.BoxDecoration(border: pw.Border.all()),
                                  height: 40,
                                  width: 82,
                                  child: pw.Center(
                                      child: pw.Text('2ND ASS\nWEEK 1-6',
                                          style: pw.TextStyle(
                                            fontSize: 8,
                                            fontWeight: pw.FontWeight.bold,
                                          )))),
                              pw.Container(
                                  decoration:
                                      pw.BoxDecoration(border: pw.Border.all()),
                                  height: 40,
                                  width: 25,
                                  child: pw.Transform.rotate(
                                    angle: pi / 2,
                                    child: pw.Center(
                                        child: pw.Text('TERM\nEXAM',
                                            style: pw.TextStyle(
                                              fontSize: 8,
                                              fontWeight: pw.FontWeight.bold,
                                            ))),
                                  )),
                              pw.Container(
                                  decoration:
                                      pw.BoxDecoration(border: pw.Border.all()),
                                  height: 40,
                                  width: 32,
                                  child: pw.Transform.rotate(
                                    angle: pi / 2,
                                    child: pw.Center(
                                        child: pw.Text('TERM\nTOTAL',
                                            overflow: pw.TextOverflow.visible,
                                            style: pw.TextStyle(
                                              fontSize: 7,
                                              fontWeight: pw.FontWeight.bold,
                                            ))),
                                  )),
                              pw.Container(
                                  decoration:
                                      pw.BoxDecoration(border: pw.Border.all()),
                                  height: 40,
                                  width: 35,
                                  child: pw.Transform.rotate(
                                    angle: pi / 2,
                                    child: pw.Center(
                                        child: pw.Text('CLASS\nAVERAGE',
                                            overflow: pw.TextOverflow.visible,
                                            style: pw.TextStyle(
                                              fontSize: 7,
                                              fontWeight: pw.FontWeight.bold,
                                            ))),
                                  )),
                              pw.Container(
                                  decoration:
                                      pw.BoxDecoration(border: pw.Border.all()),
                                  height: 40,
                                  width: 33,
                                  child: pw.Transform.rotate(
                                    angle: pi / 2,
                                    child: pw.Center(
                                        child: pw.Text('HIGHEST\nIN CLASS',
                                            overflow: pw.TextOverflow.visible,
                                            style: pw.TextStyle(
                                              fontSize: 7,
                                              fontWeight: pw.FontWeight.bold,
                                            ))),
                                  )),
                              pw.Container(
                                  decoration:
                                      pw.BoxDecoration(border: pw.Border.all()),
                                  height: 40,
                                  width: 33,
                                  child: pw.Transform.rotate(
                                    angle: pi / 2,
                                    child: pw.Center(
                                        child: pw.Text('LOWEST\nIN CLASS',
                                            overflow: pw.TextOverflow.visible,
                                            style: pw.TextStyle(
                                              fontSize: 7,
                                              fontWeight: pw.FontWeight.bold,
                                            ))),
                                  )),
                              pw.Container(
                                  decoration:
                                      pw.BoxDecoration(border: pw.Border.all()),
                                  height: 40,
                                  width: 34,
                                  child: pw.Transform.rotate(
                                    angle: pi / 2,
                                    child: pw.Center(
                                        child: pw.Text('POSITION\nIN CLASS',
                                            overflow: pw.TextOverflow.visible,
                                            style: pw.TextStyle(
                                              fontSize: 7,
                                              fontWeight: pw.FontWeight.bold,
                                            ))),
                                  )),
                              pw.Container(
                                  decoration:
                                      pw.BoxDecoration(border: pw.Border.all()),
                                  height: 40,
                                  width: 26,
                                  child: pw.Transform.rotate(
                                    angle: pi / 2,
                                    child: pw.Center(
                                        child: pw.Text('GRADE',
                                            overflow: pw.TextOverflow.visible,
                                            style: pw.TextStyle(
                                              fontSize: 7,
                                              fontWeight: pw.FontWeight.bold,
                                            ))),
                                  )),
                            ])
                          ]),
                      pw.Row(children: [
                        pw.Container(
                          decoration: pw.BoxDecoration(border: pw.Border.all()),
                          height: 30,
                          width: 110,
                          child: pw.Center(
                              child: pw.Text("",
                                  style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold,
                                  ))),
                        ),
                        pw.Container(
                            decoration:
                                pw.BoxDecoration(border: pw.Border.all()),
                            height: 30,
                            width: 17,
                            child: pw.Transform.rotate(
                              angle: pi / 2,
                              child: pw.Center(
                                  child: pw.Text('ASS',
                                      style: pw.TextStyle(
                                        fontSize: 8,
                                        fontWeight: pw.FontWeight.bold,
                                      ))),
                            )),
                        pw.Container(
                            decoration:
                                pw.BoxDecoration(border: pw.Border.all()),
                            height: 30,
                            width: 17,
                            child: pw.Transform.rotate(
                              angle: pi / 2,
                              child: pw.Center(
                                  child: pw.Text('ASS',
                                      style: pw.TextStyle(
                                        fontSize: 8,
                                        fontWeight: pw.FontWeight.bold,
                                      ))),
                            )),
                        pw.Container(
                            decoration:
                                pw.BoxDecoration(border: pw.Border.all()),
                            height: 30,
                            width: 21,
                            child: pw.Transform.rotate(
                              angle: pi / 2,
                              child: pw.Center(
                                  child: pw.Text('TEST',
                                      style: pw.TextStyle(
                                        fontSize: 8,
                                        fontWeight: pw.FontWeight.bold,
                                      ))),
                            )),
                        pw.Container(
                            decoration:
                                pw.BoxDecoration(border: pw.Border.all()),
                            height: 30,
                            width: 27,
                            child: pw.Transform.rotate(
                              angle: pi / 2,
                              child: pw.Center(
                                  child: pw.Text('TOTAL',
                                      style: pw.TextStyle(
                                        fontSize: 8,
                                        fontWeight: pw.FontWeight.bold,
                                      ))),
                            )),
                        pw.Container(
                            decoration:
                                pw.BoxDecoration(border: pw.Border.all()),
                            height: 30,
                            width: 17,
                            child: pw.Transform.rotate(
                              angle: pi / 2,
                              child: pw.Center(
                                  child: pw.Text('ASS',
                                      style: pw.TextStyle(
                                        fontSize: 8,
                                        fontWeight: pw.FontWeight.bold,
                                      ))),
                            )),
                        pw.Container(
                            decoration:
                                pw.BoxDecoration(border: pw.Border.all()),
                            height: 30,
                            width: 17,
                            child: pw.Transform.rotate(
                              angle: pi / 2,
                              child: pw.Center(
                                  child: pw.Text('ASS',
                                      style: pw.TextStyle(
                                        fontSize: 8,
                                        fontWeight: pw.FontWeight.bold,
                                      ))),
                            )),
                        pw.Container(
                            decoration:
                                pw.BoxDecoration(border: pw.Border.all()),
                            height: 30,
                            width: 21,
                            child: pw.Transform.rotate(
                              angle: pi / 2,
                              child: pw.Center(
                                  child: pw.Text('TEST',
                                      style: pw.TextStyle(
                                        fontSize: 8,
                                        fontWeight: pw.FontWeight.bold,
                                      ))),
                            )),
                        pw.Container(
                            decoration:
                                pw.BoxDecoration(border: pw.Border.all()),
                            height: 30,
                            width: 27,
                            child: pw.Transform.rotate(
                              angle: pi / 2,
                              child: pw.Center(
                                  child: pw.Text('TOTAL',
                                      style: pw.TextStyle(
                                        fontSize: 8,
                                        fontWeight: pw.FontWeight.bold,
                                      ))),
                            )),
                        pw.Container(
                          decoration: pw.BoxDecoration(border: pw.Border.all()),
                          height: 30,
                          width: 25,
                        ),
                        pw.Container(
                          decoration: pw.BoxDecoration(border: pw.Border.all()),
                          height: 30,
                          width: 32,
                        ),
                        pw.Container(
                          decoration: pw.BoxDecoration(border: pw.Border.all()),
                          height: 30,
                          width: 35,
                        ),
                        pw.Container(
                          decoration: pw.BoxDecoration(border: pw.Border.all()),
                          height: 30,
                          width: 33,
                        ),
                        pw.Container(
                          decoration: pw.BoxDecoration(border: pw.Border.all()),
                          height: 30,
                          width: 33,
                        ),
                        pw.Container(
                          decoration: pw.BoxDecoration(border: pw.Border.all()),
                          height: 30,
                          width: 34,
                        ),
                        pw.Container(
                          decoration: pw.BoxDecoration(border: pw.Border.all()),
                          height: 30,
                          width: 26,
                        ),
                      ]),
                      pw.Row(children: [
                        pw.Container(
                          decoration: pw.BoxDecoration(border: pw.Border.all()),
                          height: 20,
                          width: 110,
                          child: pw.Center(
                              child: pw.Text("",
                                  style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold,
                                  ))),
                        ),
                        pw.Container(
                            decoration:
                                pw.BoxDecoration(border: pw.Border.all()),
                            height: 20,
                            width: 17,
                            child: pw.Transform.rotate(
                              angle: pi / 2,
                              child: pw.Center(
                                  child: pw.Text('5%',
                                      style: pw.TextStyle(
                                        fontSize: 8,
                                        fontWeight: pw.FontWeight.bold,
                                      ))),
                            )),
                        pw.Container(
                            decoration:
                                pw.BoxDecoration(border: pw.Border.all()),
                            height: 20,
                            width: 17,
                            child: pw.Transform.rotate(
                              angle: pi / 2,
                              child: pw.Center(
                                  child: pw.Text('5%',
                                      style: pw.TextStyle(
                                        fontSize: 8,
                                        fontWeight: pw.FontWeight.bold,
                                      ))),
                            )),
                        pw.Container(
                            decoration:
                                pw.BoxDecoration(border: pw.Border.all()),
                            height: 20,
                            width: 21,
                            child: pw.Transform.rotate(
                              angle: pi / 2,
                              child: pw.Center(
                                  child: pw.Text('15%',
                                      style: pw.TextStyle(
                                        fontSize: 8,
                                        fontWeight: pw.FontWeight.bold,
                                      ))),
                            )),
                        pw.Container(
                            decoration:
                                pw.BoxDecoration(border: pw.Border.all()),
                            height: 20,
                            width: 27,
                            child: pw.Transform.rotate(
                              angle: pi / 2,
                              child: pw.Center(
                                  child: pw.Text('25%',
                                      style: pw.TextStyle(
                                        fontSize: 8,
                                        fontWeight: pw.FontWeight.bold,
                                      ))),
                            )),
                        pw.Container(
                            decoration:
                                pw.BoxDecoration(border: pw.Border.all()),
                            height: 20,
                            width: 17,
                            child: pw.Transform.rotate(
                              angle: pi / 2,
                              child: pw.Center(
                                  child: pw.Text('5%',
                                      style: pw.TextStyle(
                                        fontSize: 8,
                                        fontWeight: pw.FontWeight.bold,
                                      ))),
                            )),
                        pw.Container(
                            decoration:
                                pw.BoxDecoration(border: pw.Border.all()),
                            height: 20,
                            width: 17,
                            child: pw.Transform.rotate(
                              angle: pi / 2,
                              child: pw.Center(
                                  child: pw.Text('5%',
                                      style: pw.TextStyle(
                                        fontSize: 8,
                                        fontWeight: pw.FontWeight.bold,
                                      ))),
                            )),
                        pw.Container(
                            decoration:
                                pw.BoxDecoration(border: pw.Border.all()),
                            height: 20,
                            width: 21,
                            child: pw.Transform.rotate(
                              angle: pi / 2,
                              child: pw.Center(
                                  child: pw.Text('15%',
                                      style: pw.TextStyle(
                                        fontSize: 8,
                                        fontWeight: pw.FontWeight.bold,
                                      ))),
                            )),
                        pw.Container(
                            decoration:
                                pw.BoxDecoration(border: pw.Border.all()),
                            height: 20,
                            width: 27,
                            child: pw.Transform.rotate(
                              angle: pi / 2,
                              child: pw.Center(
                                  child: pw.Text('25%',
                                      style: pw.TextStyle(
                                        fontSize: 8,
                                        fontWeight: pw.FontWeight.bold,
                                      ))),
                            )),
                        pw.Container(
                          decoration: pw.BoxDecoration(border: pw.Border.all()),
                          height: 20,
                          width: 25,
                        ),
                        pw.Container(
                          decoration: pw.BoxDecoration(border: pw.Border.all()),
                          height: 20,
                          width: 32,
                        ),
                        pw.Container(
                          decoration: pw.BoxDecoration(border: pw.Border.all()),
                          height: 20,
                          width: 35,
                        ),
                        pw.Container(
                          decoration: pw.BoxDecoration(border: pw.Border.all()),
                          height: 20,
                          width: 33,
                        ),
                        pw.Container(
                          decoration: pw.BoxDecoration(border: pw.Border.all()),
                          height: 20,
                          width: 33,
                        ),
                        pw.Container(
                          decoration: pw.BoxDecoration(border: pw.Border.all()),
                          height: 20,
                          width: 34,
                        ),
                        pw.Container(
                          decoration: pw.BoxDecoration(border: pw.Border.all()),
                          height: 20,
                          width: 26,
                        ),
                      ]),
                      pw.Column(
                        children: _listWidgets(i),
                      ),
                      pw.SizedBox(height: 3),
                      pw.Row(children: [
                        pw.Text(
                            'Total Scores: ${MainStore.classes[widget.index].terms[widget.termIndex].students[i].total}',
                            style: pw.TextStyle(
                              fontSize: 12,
                              fontWeight: pw.FontWeight.bold,
                            )),
                        pw.Expanded(child: pw.Container()),
                        pw.Text(
                            'Maximum Scores: ${MainStore.classes[widget.index].terms[widget.termIndex].subjects.length * 100}',
                            style: pw.TextStyle(
                              fontSize: 12,
                              fontWeight: pw.FontWeight.bold,
                            )),
                        pw.Expanded(child: pw.Container()),
                        pw.Text(
                            'Average Marks: ${MainStore.classes[widget.index].terms[widget.termIndex].students[i].average.toStringAsFixed(2)}',
                            style: pw.TextStyle(
                              fontSize: 12,
                              fontWeight: pw.FontWeight.bold,
                            )),
                      ]),
                      pw.SizedBox(height: 8),
                      pw.Text(
                          "Class Teacher's Remark: ${ftremarkHelper(MainStore.classes[widget.index].terms[widget.termIndex].students[i].average)}",
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
                      pw.SizedBox(height: 5),
                      pw.Text(
                          "Head Teacher's Remark: ${htremarkHelper(MainStore.classes[widget.index].terms[widget.termIndex].students[i].average)}",
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
                      pw.SizedBox(height: 3),
                      pw.Container(
                        decoration:
                            const pw.BoxDecoration(color: PdfColors.blue900),
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
                    ],
                  ),
                ]);
          },
        ),
      );
    }

    return await doc.save();
  }

  _listWidgets(int stdIndex) {
    List<pw.Widget> temp = [];
    for (int i = 0;
        i <
            MainStore
                .classes[widget.index].terms[widget.termIndex].subjects.length;
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
        width: 110,
        child: pw.Center(
            child: pw.Text(
                MainStore.classes[widget.index].terms[widget.termIndex]
                    .subjects[sub],
                style: pw.TextStyle(
                  fontSize: 8.5,
                  fontWeight: pw.FontWeight.bold,
                ))),
      ),
      pw.Container(
        decoration: pw.BoxDecoration(border: pw.Border.all()),
        height: 16,
        width: 17,
        child: pw.Center(
            child: pw.Text(
                MainStore.classes[widget.index].terms[widget.termIndex]
                    .students[stdIndex].subjects[sub].ass[0]
                    .toString(),
                style: pw.TextStyle(
                  fontSize: 8,
                  fontWeight: pw.FontWeight.bold,
                ))),
      ),
      pw.Container(
        decoration: pw.BoxDecoration(border: pw.Border.all()),
        height: 16,
        width: 17,
        child: pw.Center(
            child: pw.Text(
                MainStore.classes[widget.index].terms[widget.termIndex]
                    .students[stdIndex].subjects[sub].ass[1]
                    .toString(),
                style: pw.TextStyle(
                  fontSize: 8,
                  fontWeight: pw.FontWeight.bold,
                ))),
      ),
      pw.Container(
        decoration: pw.BoxDecoration(border: pw.Border.all()),
        height: 16,
        width: 21,
        child: pw.Center(
            child: pw.Text(
                MainStore.classes[widget.index].terms[widget.termIndex]
                    .students[stdIndex].subjects[sub].ass[2]
                    .toString(),
                style: pw.TextStyle(
                  fontSize: 8,
                  fontWeight: pw.FontWeight.bold,
                ))),
      ),
      pw.Container(
        decoration: pw.BoxDecoration(border: pw.Border.all()),
        height: 16,
        width: 27,
        child: pw.Center(
            child: pw.Text(
                MainStore.classes[widget.index].terms[widget.termIndex]
                    .students[stdIndex].subjects[sub].ass[3]
                    .toString(),
                style: pw.TextStyle(
                  fontSize: 8,
                  fontWeight: pw.FontWeight.bold,
                ))),
      ),
      pw.Container(
        decoration: pw.BoxDecoration(border: pw.Border.all()),
        height: 16,
        width: 17,
        child: pw.Center(
            child: pw.Text(
                MainStore.classes[widget.index].terms[widget.termIndex]
                    .students[stdIndex].subjects[sub].ass[4]
                    .toString(),
                style: pw.TextStyle(
                  fontSize: 8,
                  fontWeight: pw.FontWeight.bold,
                ))),
      ),
      pw.Container(
        decoration: pw.BoxDecoration(border: pw.Border.all()),
        height: 16,
        width: 17,
        child: pw.Center(
            child: pw.Text(
                MainStore.classes[widget.index].terms[widget.termIndex]
                    .students[stdIndex].subjects[sub].ass[5]
                    .toString(),
                style: pw.TextStyle(
                  fontSize: 8,
                  fontWeight: pw.FontWeight.bold,
                ))),
      ),
      pw.Container(
        decoration: pw.BoxDecoration(border: pw.Border.all()),
        height: 16,
        width: 21,
        child: pw.Center(
            child: pw.Text(
                MainStore.classes[widget.index].terms[widget.termIndex]
                    .students[stdIndex].subjects[sub].ass[6]
                    .toString(),
                style: pw.TextStyle(
                  fontSize: 8,
                  fontWeight: pw.FontWeight.bold,
                ))),
      ),
      pw.Container(
        decoration: pw.BoxDecoration(border: pw.Border.all()),
        height: 16,
        width: 27,
        child: pw.Center(
            child: pw.Text(
                MainStore.classes[widget.index].terms[widget.termIndex]
                    .students[stdIndex].subjects[sub].ass[7]
                    .toString(),
                style: pw.TextStyle(
                  fontSize: 8,
                  fontWeight: pw.FontWeight.bold,
                ))),
      ),
      pw.Container(
        decoration: pw.BoxDecoration(border: pw.Border.all()),
        height: 16,
        width: 25,
        child: pw.Center(
            child: pw.Text(
                MainStore.classes[widget.index].terms[widget.termIndex]
                    .students[stdIndex].subjects[sub].ass[8]
                    .toString(),
                style: pw.TextStyle(
                  fontSize: 8,
                  fontWeight: pw.FontWeight.bold,
                ))),
      ),
      pw.Container(
        decoration: pw.BoxDecoration(border: pw.Border.all()),
        height: 16,
        width: 32,
        child: pw.Center(
            child: pw.Text(
                MainStore.classes[widget.index].terms[widget.termIndex]
                    .students[stdIndex].subjects[sub].total
                    .toString(),
                style: pw.TextStyle(
                  fontSize: 8,
                  fontWeight: pw.FontWeight.bold,
                ))),
      ),
      pw.Container(
        decoration: pw.BoxDecoration(border: pw.Border.all()),
        height: 16,
        width: 35,
        child: pw.Center(
            child: pw.Text(
                MainStore.classes[widget.index].terms[widget.termIndex]
                    .students[stdIndex].subjects[sub].average
                    .toString(),
                style: pw.TextStyle(
                  fontSize: 8,
                  fontWeight: pw.FontWeight.bold,
                ))),
      ),
      pw.Container(
        decoration: pw.BoxDecoration(border: pw.Border.all()),
        height: 16,
        width: 33,
        child: pw.Center(
            child: pw.Text(
                MainStore.classes[widget.index].terms[widget.termIndex]
                    .students[stdIndex].subjects[sub].highest
                    .toString(),
                style: pw.TextStyle(
                  fontSize: 8,
                  fontWeight: pw.FontWeight.bold,
                ))),
      ),
      pw.Container(
        decoration: pw.BoxDecoration(border: pw.Border.all()),
        height: 16,
        width: 33,
        child: pw.Center(
            child: pw.Text(
                MainStore.classes[widget.index].terms[widget.termIndex]
                    .students[stdIndex].subjects[sub].lowest
                    .toString(),
                style: pw.TextStyle(
                  fontSize: 8,
                  fontWeight: pw.FontWeight.bold,
                ))),
      ),
      pw.Container(
        decoration: pw.BoxDecoration(border: pw.Border.all()),
        height: 16,
        width: 34,
        child: pw.Center(
            child: pw.Text(
                MainStore.classes[widget.index].terms[widget.termIndex]
                    .students[stdIndex].subjects[sub].pos
                    .toString(),
                style: pw.TextStyle(
                  fontSize: 8,
                  fontWeight: pw.FontWeight.bold,
                ))),
      ),
      pw.Container(
        decoration: pw.BoxDecoration(border: pw.Border.all()),
        height: 16,
        width: 26,
        child: pw.Center(
            child: pw.Text(
                MainStore.classes[widget.index].terms[widget.termIndex]
                    .students[stdIndex].subjects[sub].grade
                    .toString(),
                style: pw.TextStyle(
                  fontSize: 8,
                  fontWeight: pw.FontWeight.bold,
                ))),
      ),
    ]);
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
