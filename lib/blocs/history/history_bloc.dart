import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:instrumen_hypoglyrisk/models/history_model.dart';
import 'package:instrumen_hypoglyrisk/repositories/history_repository.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' as xcel;
import 'package:meta/meta.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc() : super(HistoryInitial()) {
    final HistoryRepository historyRepository = HistoryRepository();

    on<SubmitAnswer>(
      (event, emit) async {
        try {
          emit(LoadingHistory());
          final id = await historyRepository.insert(event.history);
          final history = await historyRepository.getById(id);
          emit(Success(history));
        } catch (e) {
          emit(ErrorHistory(e.toString()));
        }
      },
    );

    on<EditScoreB>(
      (event, emit) async {
        try {
          emit(LoadingHistory());
          final history = await historyRepository.getById(event.id);
          history.scoreB = event.scoreB;
          history.scoreB1 = event.scoreB1;
          history.scoreB2 = event.scoreB2;
          history.scoreB3 = event.scoreB3;
          history.scoreB4 = event.scoreB4;
          history.scoreB5 = event.scoreB5;
          history.scoreB6 = event.scoreB6;
          history.scoreB7 = event.scoreB7;
          history.scoreB8 = event.scoreB8;
          await historyRepository.update(history);
          emit(Success(history));
        } catch (e) {
          emit(ErrorHistory(e.toString()));
        }
      },
    );

    on<GetHistory>(
      (event, emit) async {
        try {
          emit(LoadingHistory());
          final histories = await historyRepository.get();
          emit(SuccessGetAll(histories));
        } catch (e) {
          emit(ErrorHistory(e.toString()));
        }
      },
    );

    on<DeleteHistory>(
      (event, emit) async {
        try {
          emit(LoadingHistory());
          await historyRepository.delete(event.id);
          final histories = await historyRepository.get();
          emit(SuccessGetAll(histories));
        } catch (e) {
          emit(ErrorHistory(e.toString()));
        }
      },
    );

    on<ExportHistory>(
      (event, emit) async {
        try {
          emit(LoadingHistory());

          final xcel.Workbook workbook = xcel.Workbook();
          final xcel.Worksheet sheet = workbook.worksheets[0];
          final histories = await historyRepository.get();

          // Apply bold to header
          final xcel.Range headerRange = sheet.getRangeByName('A1:Y1');
          headerRange.cellStyle.bold = true;

          // Add border to header
          headerRange.cellStyle.borders.all.lineStyle = xcel.LineStyle.thin;

          // Set header
          sheet.getRangeByIndex(1, 1).setText("No");
          sheet.getRangeByIndex(1, 2).setText("Tanggal Pemeriksaan");
          sheet.getRangeByIndex(1, 3).setText("Nama");
          sheet.getRangeByIndex(1, 4).setText("Jenis Kelamin");
          sheet.getRangeByIndex(1, 5).setText("Usia (Tahun)");
          sheet.getRangeByIndex(1, 6).setText("No Rekam Medis");
          sheet.getRangeByIndex(1, 7).setText("Nama Apoteker");
          sheet.getRangeByIndex(1, 8).setText("Skor Pemeriksaan A");
          sheet.getRangeByIndex(1, 9).setText("Skor Pemeriksaan B");
          sheet.getRangeByIndex(1, 10).setText("Skor A1");
          sheet.getRangeByIndex(1, 11).setText("Skor A2");
          sheet.getRangeByIndex(1, 12).setText("Skor A3");
          sheet.getRangeByIndex(1, 13).setText("Skor A4");
          sheet.getRangeByIndex(1, 14).setText("Skor A5");
          sheet.getRangeByIndex(1, 15).setText("Skor A6");
          sheet.getRangeByIndex(1, 16).setText("Skor A7");
          sheet.getRangeByIndex(1, 17).setText("Skor A8");
          sheet.getRangeByIndex(1, 18).setText("Skor B1");
          sheet.getRangeByIndex(1, 19).setText("Skor B2");
          sheet.getRangeByIndex(1, 20).setText("Skor B3");
          sheet.getRangeByIndex(1, 21).setText("Skor B4");
          sheet.getRangeByIndex(1, 22).setText("Skor B5");
          sheet.getRangeByIndex(1, 23).setText("Skor B6");
          sheet.getRangeByIndex(1, 24).setText("Skor B7");
          sheet.getRangeByIndex(1, 25).setText("Skor B8");

          //  Set data
          for (var i = 0; i < histories.length; i++) {
            final item = histories[i];
            sheet.getRangeByIndex(i + 2, 1).setText((i + 1).toString());
            sheet
                .getRangeByIndex(i + 2, 2)
                .setText(DateFormat('dd/MM/yyyy').format(item.date!));
            sheet.getRangeByIndex(i + 2, 3).setText(item.name);
            sheet.getRangeByIndex(i + 2, 4).setText(item.gender);
            sheet.getRangeByIndex(i + 2, 5).setText(item.age.toString());
            sheet.getRangeByIndex(i + 2, 6).setText(item.rm);
            sheet.getRangeByIndex(i + 2, 7).setText(item.apoteker);
            sheet.getRangeByIndex(i + 2, 8).setNumber(item.scoreA.toDouble());
            sheet.getRangeByIndex(i + 2, 9).setNumber(item.scoreB.toDouble());
            sheet.getRangeByIndex(i + 2, 10).setNumber(item.scoreA1.toDouble());
            sheet.getRangeByIndex(i + 2, 11).setNumber(item.scoreA2.toDouble());
            sheet.getRangeByIndex(i + 2, 12).setNumber(item.scoreA3.toDouble());
            sheet.getRangeByIndex(i + 2, 13).setNumber(item.scoreA4.toDouble());
            sheet.getRangeByIndex(i + 2, 14).setNumber(item.scoreA5.toDouble());
            sheet.getRangeByIndex(i + 2, 15).setNumber(item.scoreA6.toDouble());
            sheet.getRangeByIndex(i + 2, 16).setNumber(item.scoreA7.toDouble());
            sheet.getRangeByIndex(i + 2, 17).setNumber(item.scoreA8.toDouble());
            sheet.getRangeByIndex(i + 2, 18).setNumber(item.scoreB1.toDouble());
            sheet.getRangeByIndex(i + 2, 19).setNumber(item.scoreB2.toDouble());
            sheet.getRangeByIndex(i + 2, 20).setNumber(item.scoreB3.toDouble());
            sheet.getRangeByIndex(i + 2, 21).setNumber(item.scoreB4.toDouble());
            sheet.getRangeByIndex(i + 2, 22).setNumber(item.scoreB5.toDouble());
            sheet.getRangeByIndex(i + 2, 23).setNumber(item.scoreB6.toDouble());
            sheet.getRangeByIndex(i + 2, 24).setNumber(item.scoreB7.toDouble());
            sheet.getRangeByIndex(i + 2, 25).setNumber(item.scoreB8.toDouble());
          }

          // Apply border to the entire data range (including header)
          final int lastRow = histories.length + 1; // +1 for the header row
          final xcel.Range dataRange = sheet.getRangeByName('A1:Y$lastRow');
          dataRange.cellStyle.borders.all.lineStyle = xcel.LineStyle.thin;

          // Set auto fit
          sheet.autoFitColumn(1);
          sheet.autoFitColumn(2);
          sheet.autoFitColumn(3);
          sheet.autoFitColumn(4);
          sheet.autoFitColumn(5);
          sheet.autoFitColumn(6);
          sheet.autoFitColumn(7);
          sheet.autoFitColumn(8);
          sheet.autoFitColumn(9);
          sheet.autoFitColumn(10);
          sheet.autoFitColumn(11);
          sheet.autoFitColumn(12);
          sheet.autoFitColumn(13);
          sheet.autoFitColumn(14);
          sheet.autoFitColumn(15);
          sheet.autoFitColumn(16);
          sheet.autoFitColumn(17);
          sheet.autoFitColumn(18);
          sheet.autoFitColumn(19);
          sheet.autoFitColumn(20);
          sheet.autoFitColumn(21);
          sheet.autoFitColumn(22);
          sheet.autoFitColumn(23);
          sheet.autoFitColumn(24);
          sheet.autoFitColumn(25);

          // Set header align
          sheet.getRangeByName('A1:Y1').cellStyle.hAlign =
              xcel.HAlignType.center;

          var noteIndex = histories.length + 4;
          sheet.getRangeByIndex(noteIndex, 1, noteIndex, 25).merge();
          sheet
              .getRangeByIndex(noteIndex, 1)
              .setText("Keterangan Kode Pertanyaan");

          noteIndex++;
          sheet.getRangeByIndex(noteIndex, 1, noteIndex, 25).merge();
          sheet
              .getRangeByIndex(noteIndex, 1)
              .setText("A1 = Memiliki riwayat hipoglikemia berat (GD<30mg/dL)");
          noteIndex++;
          sheet.getRangeByIndex(noteIndex, 1, noteIndex, 25).merge();
          sheet
              .getRangeByIndex(noteIndex, 1)
              .setText("A2 = Menggunakan insulin");
          noteIndex++;
          sheet.getRangeByIndex(noteIndex, 1, noteIndex, 25).merge();
          sheet
              .getRangeByIndex(noteIndex, 1)
              .setText("A3 = Menggunakan sulfonilurea");
          noteIndex++;
          sheet.getRangeByIndex(noteIndex, 1, noteIndex, 25).merge();
          sheet
              .getRangeByIndex(noteIndex, 1)
              .setText("A4 = Menggunakan kombinasi insulin dan sulfonilurea");
          noteIndex++;
          sheet.getRangeByIndex(noteIndex, 1, noteIndex, 25).merge();
          sheet
              .getRangeByIndex(noteIndex, 1)
              .setText("A5 = Memiliki riwayat penyakit CKD (tidak terkontrol)");
          noteIndex++;
          sheet.getRangeByIndex(noteIndex, 1, noteIndex, 25).merge();
          sheet.getRangeByIndex(noteIndex, 1).setText(
              "A6 = Memiliki riwayat neuropati diabetes (tidak terkontrol)");
          noteIndex++;
          sheet.getRangeByIndex(noteIndex, 1, noteIndex, 25).merge();
          sheet.getRangeByIndex(noteIndex, 1).setText(
              "A7 = Gula darah tidak terkontrol (HbA1C > 7%, GDP>126mg/dL, GD2JPP dan GDS > 200mg)");
          noteIndex++;
          sheet.getRangeByIndex(noteIndex, 1, noteIndex, 25).merge();
          sheet
              .getRangeByIndex(noteIndex, 1)
              .setText("A8 = Durasi diabetes > 5 tahun");
          noteIndex++;
          sheet.getRangeByIndex(noteIndex, 1, noteIndex, 25).merge();
          sheet.getRangeByIndex(noteIndex, 1).setText(
              "B1 = Apakah pasien mengenali obat diabetes yang dibawa pulang?");
          noteIndex++;
          sheet.getRangeByIndex(noteIndex, 1, noteIndex, 25).merge();
          sheet.getRangeByIndex(noteIndex, 1).setText(
              "B2 = Apakah pasien mengenali tanda dan gejala hipoglikemia setelah menggunakan obat?");
          noteIndex++;
          sheet.getRangeByIndex(noteIndex, 1, noteIndex, 25).merge();
          sheet.getRangeByIndex(noteIndex, 1).setText(
              "B3 = Apakah pasien mengetahui cara menggunakan obat diabetes yang dibawa pulang?");
          noteIndex++;
          sheet.getRangeByIndex(noteIndex, 1, noteIndex, 25).merge();
          sheet.getRangeByIndex(noteIndex, 1).setText(
              "B4 = Apakah pasien/keluarga pasien mengetahui cara menangani kondisi hipoglikemia?");
          noteIndex++;
          sheet.getRangeByIndex(noteIndex, 1, noteIndex, 25).merge();
          sheet.getRangeByIndex(noteIndex, 1).setText(
              "B5 = Apakah pasien memiliki persepsi bahwa harus menggunakan obat lain/alternatif selain obat yang diresepkan oleh dokter?");
          noteIndex++;
          sheet.getRangeByIndex(noteIndex, 1, noteIndex, 25).merge();
          sheet.getRangeByIndex(noteIndex, 1).setText(
              "B6 = Apakah pasien/keluarga pasien membuat catatan jenis/item obat antidiabetes yang dibawa pulang?");
          noteIndex++;
          sheet.getRangeByIndex(noteIndex, 1, noteIndex, 25).merge();
          sheet.getRangeByIndex(noteIndex, 1).setText(
              "B7 = Apakah pasien mengetahui jika obat golongan insulin dan sulfonilurea harus dihentikan sementara jika terjadi hipoglikemia berulang?");
          noteIndex++;
          sheet.getRangeByIndex(noteIndex, 1, noteIndex, 25).merge();
          sheet.getRangeByIndex(noteIndex, 1).setText(
              "B8 = Apakah pasien/keluarga pasien mengetahui kemana harus melapor atau menindaklanjuti apabila terjadi keadaan hipoglikemia berat?");

          final List<int> bytes = workbook.saveAsStream();

          Directory directory = await getApplicationSupportDirectory();

          // Membuat path lengkap untuk file
          String filePath =
              '${directory.path}/history_pemeriksaan_hypoglyrisk.xlsx';

          // Menulis byte data ke file
          File file = File(filePath);
          await file.writeAsBytes(bytes);

          // Copy file
          // Pastikan path sesuai untuk "Downloads"
          final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
          final String downloadsPath =
              "/storage/emulated/0/Download/${timestamp}_data_pemeriksaan_hypoglyrisk.xlsx";
          final File sourceFile = File(filePath);
          final destinationFile = File(downloadsPath);
          await sourceFile.copy(destinationFile.path);

          await OpenFile.open(downloadsPath);

          workbook.dispose();
          emit(SuccessGetAll(histories));
        } catch (e) {
          emit(ErrorHistory(e.toString()));
        }
      },
    );
  }
}
