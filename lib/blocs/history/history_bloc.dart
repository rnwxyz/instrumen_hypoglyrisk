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
          final xcel.Range headerRange = sheet.getRangeByName('A1:I1');
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
            sheet.getRangeByIndex(i + 2, 8).setText(item.scoreA.toString());
            sheet.getRangeByIndex(i + 2, 9).setText(item.scoreB.toString());
          }

          // Apply border to the entire data range (including header)
          final int lastRow = histories.length + 1; // +1 for the header row
          final xcel.Range dataRange = sheet.getRangeByName('A1:I$lastRow');
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

          // Set header align
          sheet.getRangeByName('A1:I1').cellStyle.hAlign =
              xcel.HAlignType.center;

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
