import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:instrumen_hypoglyrisk/utils/constant/my_color.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class SOPScreen extends StatefulWidget {
  const SOPScreen({super.key});

  @override
  State<SOPScreen> createState() => _SOPScreenState();
}

class _SOPScreenState extends State<SOPScreen> {
  String? pdfPath;
  int currentPage = 1;
  int totalPages = 0;
  PDFViewController? pdfViewController;

  @override
  void initState() {
    super.initState();
    loadPDF();
  }

  Future<void> loadPDF() async {
    final file = await copyAssetToLocal('assets/sop.pdf');
    setState(
      () {
        pdfPath = file.path;
      },
    );
  }

  Future<void> downloadPDF() async {
    if (pdfPath == null) return;

    // Meminta izin penyimpanan (Android 13+ tidak memerlukan ini)
    if (await Permission.storage.request().isGranted) {
      Directory? downloadsDir = Directory('/storage/emulated/0/Download');
      if (!downloadsDir.existsSync()) {
        downloadsDir = await getExternalStorageDirectory();
      }

      if (downloadsDir != null) {
        final file = File('${downloadsDir.path}/sop_instrumen_hypoglyrisk.pdf');
        await File(pdfPath!).copy(file.path);
        await OpenFile.open(file.path);
      }
    } else {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Izin penyimpanan ditolak!")),
      );
    }
  }

  Future<File> copyAssetToLocal(String assetPath) async {
    final data = await rootBundle.load(assetPath);
    final bytes = data.buffer.asUint8List();
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/sop.pdf');

    await file.writeAsBytes(bytes, flush: true);
    return file;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Standard Operating Procedure',
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: MyColor.primary,
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Konfirmasi'),
                    content: const Text('Apakah Anda ingin mengunduh SOP?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Menutup dialog
                        },
                        child: const Text('Batal'),
                      ),
                      TextButton(
                        onPressed: () async {
                          await downloadPDF();
                          if (context.mounted) {
                            Navigator.of(context).pop(); // Menutup dialog
                          }
                        },
                        child: const Text('Ya'),
                      ),
                    ],
                  );
                },
              );
            },
            icon: const Icon(Icons.download_for_offline),
            iconSize: 40,
            color: Colors.white,
          ),
        ],
      ),
      body: pdfPath == null
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                PDFView(
                  filePath: pdfPath!,
                  fitPolicy: FitPolicy.BOTH, // Make PDF fit screen
                  onViewCreated: (PDFViewController controller) {
                    setState(() {
                      pdfViewController = controller;
                    });

                    // Delay sebelum mengambil total halaman
                    Future.delayed(const Duration(milliseconds: 100), () {
                      controller.getPageCount().then((count) {
                        if (count != null) {
                          setState(() {
                            totalPages = count;
                          });
                        }
                      });
                    });
                  },
                  onPageChanged: (int? page, int? total) {
                    if (page != null && mounted) {
                      setState(
                        () {
                          currentPage = page + 1; // Page index starts from 0
                        },
                      );
                    }
                  },
                ),
                // Page Indicator di bawah layar
                Visibility(
                  visible: totalPages != 0,
                  child: Positioned(
                    bottom: 20,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 15),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          "Page $currentPage / $totalPages",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
