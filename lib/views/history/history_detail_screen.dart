import 'package:flutter/material.dart';
import 'package:instrumen_hypoglyrisk/models/history_model.dart';
import 'package:instrumen_hypoglyrisk/models/screening_model.dart';
import 'package:instrumen_hypoglyrisk/utils/components/text_row_component.dart';
import 'package:instrumen_hypoglyrisk/utils/constant/my_color.dart';
import 'package:intl/intl.dart';

class HitoryDetailScreen extends StatelessWidget {
  final HistoryModel model;
  const HitoryDetailScreen({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    List<QuestionModel> dataDetailHistory = [
      QuestionModel(
        id: 1,
        question: 'Memiliki riwayat hipoglikemia berat (GD<30mg/dL)',
        score: 2,
        isYes: true,
        description: 'A',
        answer: model.scoreA1,
      ),
      QuestionModel(
        id: 2,
        question: 'Menggunakan insulin',
        score: 3,
        isYes: true,
        description: 'A',
        answer: model.scoreA2,
      ),
      QuestionModel(
        id: 3,
        question: 'Menggunakan sulfonilurea',
        score: 2,
        isYes: true,
        description: 'A',
        answer: model.scoreA3,
      ),
      QuestionModel(
        id: 4,
        question: 'Menggunakan kombinasi insulin dan sulfonilurea',
        score: 4,
        isYes: true,
        description: 'A',
        answer: model.scoreA4,
      ),
      QuestionModel(
        id: 5,
        question: 'Memiliki riwayat penyakit CKD (tidak terkontrol)',
        score: 2,
        isYes: true,
        description: 'A',
        answer: model.scoreA5,
      ),
      QuestionModel(
        id: 6,
        question: 'Memiliki riwayat neuropati diabetes (tidak terkontrol)',
        score: 2,
        isYes: true,
        description: 'A',
        answer: model.scoreA6,
      ),
      QuestionModel(
        id: 7,
        question:
            'Gula darah tidak terkontrol (HbA1C > 7%, GDP>126mg/dL, GD2JPP dan GDS > 200mg)',
        score: 5,
        isYes: true,
        description: 'A',
        answer: model.scoreA7,
      ),
      QuestionModel(
        id: 8,
        question: 'Durasi diabetes > 5 tahun',
        score: 4,
        isYes: true,
        description: 'A',
        answer: model.scoreA8,
      ),
      QuestionModel(
        id: 1,
        question: 'Apakah pasien mengenali obat diabetes yang dibawa pulang?',
        score: 2,
        isYes: false,
        description: 'B',
        answer: model.scoreB1,
      ),
      QuestionModel(
        id: 2,
        question:
            'Apakah pasien mengenali tanda dan gejala hipoglikemia setelah menggunakan obat?',
        score: 2,
        isYes: false,
        description: 'B',
        answer: model.scoreB2,
      ),
      QuestionModel(
        id: 3,
        question:
            'Apakah pasien mengetahui cara menggunakan obat diabetes yang dibawa pulang?',
        score: 2,
        isYes: false,
        description: 'B',
        answer: model.scoreB4,
      ),
      QuestionModel(
        id: 4,
        question:
            'Apakah pasien/keluarga pasien mengetahui cara menangani kondisi hipoglikemia?',
        score: 2,
        isYes: false,
        description: 'B',
        answer: model.scoreB4,
      ),
      QuestionModel(
        id: 5,
        question:
            'Apakah pasien memiliki persepsi bahwa harus menggunakan obat lain/alternatif selain obat yang diresepkan oleh dokter?',
        score: 3,
        isYes: true,
        description: 'B',
        answer: model.scoreB5,
      ),
      QuestionModel(
        id: 6,
        question:
            'Apakah pasien/keluarga pasien membuat catatan jenis/item obat antidiabetes yang dibawa pulang?',
        score: 2,
        isYes: false,
        description: 'B',
        answer: model.scoreB6,
      ),
      QuestionModel(
        id: 7,
        question:
            'Apakah pasien mengetahui jika obat golongan insulin dan sulfonilurea harus dihentikan sementara jika terjadi hipoglikemia berulang?',
        score: 3,
        isYes: false,
        description: 'B',
        answer: model.scoreB7,
      ),
      QuestionModel(
        id: 8,
        question:
            'Apakah pasien/keluarga pasien mengetahui kemana harus melapor atau menindaklanjuti apabila terjadi keadaan hipoglikemia berat?',
        score: 2,
        isYes: false,
        description: 'B',
        answer: model.scoreB8,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Riwayat Pemeriksaan',
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: MyColor.primary,
      ),
      body: ListView(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(20),
            child: Column(
              spacing: 5,
              children: [
                TextRowComponent(
                  title: 'Nama',
                  data: model.name,
                ),
                TextRowComponent(
                  title: 'Usia',
                  data: '${model.age} Tahun',
                ),
                TextRowComponent(
                  title: 'Jenis Kelamin',
                  data: model.gender,
                ),
                TextRowComponent(
                  title: 'No RM',
                  data: model.rm,
                ),
                TextRowComponent(
                  title: 'Tanggal Pemeriksaan',
                  data: DateFormat('dd - MM - yyyy').format(model.date!),
                ),
                TextRowComponent(
                    title: 'Skor A',
                    data: model.scoreA.toString(),
                    trailing: Container(
                      margin: const EdgeInsets.only(left: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: model.scoreA < 9
                            ? Colors.green
                            : (model.scoreA > 8 && model.scoreA < 17
                                ? Colors.orange
                                : Colors.red),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 2),
                      child: Text(
                        model.scoreA < 9
                            ? 'Low Risk'
                            : (model.scoreA > 8 && model.scoreA < 17
                                ? 'Moderate Risk'
                                : 'High Risk'),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )),
                TextRowComponent(
                  title: 'Skor B',
                  data: model.scoreB.toString(),
                  trailing: Container(
                    margin: const EdgeInsets.only(left: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: model.scoreB < 7
                          ? Colors.green
                          : (model.scoreB > 6 && model.scoreB < 12
                              ? Colors.orange
                              : Colors.red),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                    child: Text(
                      model.scoreB < 7
                          ? 'Low Risk'
                          : (model.scoreB > 6 && model.scoreB < 12
                              ? 'Moderate Risk'
                              : 'High Risk'),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text("Detail Skor Tiap Komponen Pertanyaan"),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  width: double.infinity,
                  child: DataTable(
                    headingRowColor: WidgetStateColor.resolveWith(
                        (states) => Colors.grey.shade300),
                    columns: const [
                      DataColumn(
                        label: Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("No"),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Pertanyaan",
                            ),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Skor",
                            ),
                          ),
                        ),
                      ),
                    ],
                    headingRowHeight: 35,
                    dataRowMinHeight: 30,
                    dataRowMaxHeight: double.infinity,
                    columnSpacing: 20,
                    horizontalMargin: 10,
                    border: TableBorder.all(width: 0.1),
                    rows: dataDetailHistory.map((data) {
                      return DataRow(
                        cells: [
                          DataCell(
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                "${data.description}${data.id}",
                              ),
                            ),
                          ),
                          DataCell(
                            Expanded(
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  data.question,
                                  softWrap: true,
                                ),
                              ),
                            ),
                          ),
                          DataCell(Expanded(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                data.answer.toString(),
                              ),
                            ),
                          )),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
