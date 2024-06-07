import 'dart:io';

import 'package:file_saver/file_saver.dart';
import 'package:open_file/open_file.dart';
import 'package:pdf/widgets.dart';

class PdfApi {
  static Future<void> generatePdf(
    String schule,
    List<int> admin,
    List<int> sv,
    List<int> ids,
  ) async {
    final pdf = Document();
    pdf.addPage(Page(
      build: (context) => Center(
        child: Text(schule, style: const TextStyle(fontSize: 30)),
      ),
    ));
    pdf.addPage(
      MultiPage(
        build: (context) => [
          Text('Admin'),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              BarcodeWidget(
                data: admin.first.toString(),
                barcode: Barcode.qrCode(),
                width: 70,
                height: 70,
              ),
              SizedBox(width: 30),
              SizedBox(
                width: 90,
                child: Text(
                  admin.first.toString(),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Text('SV'),
          SizedBox(
            height: 20,
          ),
          Table(
            children: List.generate(
              (sv.length / 2).round(),
              (index) {
                return TableRow(
                  children: [
                    Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BarcodeWidget(
                                data: sv[index * 2].toString(),
                                barcode: Barcode.qrCode(),
                                width: 70,
                                height: 70,
                              ),
                              SizedBox(width: 30),
                              SizedBox(
                                width: 90,
                                child: Text(
                                  sv[index * 2].toString(),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 70),
                          index + 1 == (sv.length / 2).round()
                              ? Container()
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    BarcodeWidget(
                                      data: sv[index * 2 + 1].toString(),
                                      barcode: Barcode.qrCode(),
                                      width: 70,
                                      height: 70,
                                    ),
                                    SizedBox(width: 30),
                                    SizedBox(
                                      width: 90,
                                      child: Text(
                                        sv[index * 2 + 1].toString(),
                                      ),
                                    )
                                  ],
                                ),
                        ],
                      ),
                      SizedBox(height: 30),
                    ])
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
    pdf.addPage(
      MultiPage(
        build: (context) => [
          Text('User'),
          SizedBox(
            height: 20,
          ),
          Table(
            children: List.generate(
              (ids.length / 2).round(),
              (index) {
                return TableRow(
                  children: [
                    Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BarcodeWidget(
                                data: ids[index * 2].toString(),
                                barcode: Barcode.qrCode(),
                                width: 70,
                                height: 70,
                              ),
                              SizedBox(width: 30),
                              SizedBox(
                                width: 90,
                                child: Text(
                                  ids[index * 2].toString(),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 70),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BarcodeWidget(
                                data: ids[index * 2 + 1].toString(),
                                barcode: Barcode.qrCode(),
                                width: 70,
                                height: 70,
                              ),
                              SizedBox(width: 30),
                              SizedBox(
                                width: 90,
                                child: Text(
                                  ids[index * 2 + 1].toString(),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                    ])
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );

    saveDocument(name: schule, pdf: pdf);
  }

  static Future<void> saveDocument({
    required String name,
    required Document pdf,
  }) async {
    final bytes = await pdf.save();
    await FileSaver.instance
        .saveFile(name: name, bytes: bytes, ext: 'pdf', mimeType: MimeType.pdf);
  }

  static Future openFile(File file) async {
    final url = file.path;

    await OpenFile.open(url);
  }
}
