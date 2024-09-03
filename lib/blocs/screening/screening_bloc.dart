import 'package:bloc/bloc.dart';
import 'package:instrumen_hypoglyrisk/models/screening_model.dart';
import 'package:meta/meta.dart';

part 'screening_event.dart';
part 'screening_state.dart';

class ScreeningBloc extends Bloc<ScreeningEvent, ScreeningState> {
  ScreeningBloc() : super(ScreeningInitial()) {
    List<QuestionModel> questionsA = [
      QuestionModel(
        id: 1,
        question: 'Memiliki riwayat hipoglikemia berat (GD<30mg/dL)',
        score: 2,
        isYes: true,
        description: '',
        answer: null,
      ),
      QuestionModel(
        id: 2,
        question: 'Menggunakan insulin',
        score: 3,
        isYes: true,
        description: '',
        answer: null,
      ),
      QuestionModel(
        id: 3,
        question: 'Menggunakan sulfonilurea',
        score: 2,
        isYes: true,
        description: '',
        answer: null,
      ),
      QuestionModel(
        id: 4,
        question: 'Menggunakan kombinasi insulin dan sulfonilurea',
        score: 4,
        isYes: true,
        description: '',
        answer: null,
      ),
      QuestionModel(
        id: 5,
        question: 'Memiliki riwayat penyakit CKD (tidak terkontrol)',
        score: 2,
        isYes: true,
        description: '',
        answer: null,
      ),
      QuestionModel(
        id: 6,
        question: 'Memiliki riwayat neuropati diabetes (tidak terkontrol)',
        score: 2,
        isYes: true,
        description: '',
        answer: null,
      ),
      QuestionModel(
        id: 7,
        question:
            'Gula darah tidak terkontrol (HbA1C > 7%, GDP>126mg/dL, GD2JPP dan GDS > 200mg)',
        score: 5,
        isYes: true,
        description: '',
        answer: null,
      ),
      QuestionModel(
        id: 8,
        question: 'Durasi diabetes > 5 tahun ',
        score: 4,
        isYes: true,
        description: '',
        answer: null,
      ),
    ];

    // list of question B
    List<QuestionModel> questionsB = [
      QuestionModel(
        id: 1,
        question: 'Apakah pasien mengenali obat diabetes yang dibawa pulang?',
        score: 2,
        isYes: false,
        description:
            'Untuk dapat menjawab pertanyaan ini Apoteker harus mengajukan minimal dua pertanyaan kepada pasien antara lain:\na)	Apakah bapak ibu dapat menyebutkan kembali nama obat yang akan dibawa pulang beserta indikasinya?\nb)	Apakah bapak/ibu dapat menyebutkan obat yang akan membantu menurunkan/menstabilkan kadar gula darah bapak/Ibu?',
        answer: null,
      ),
      QuestionModel(
        id: 2,
        question:
            'Apakah pasien mengenali tanda dan gejala hipoglikemia setelah menggunakan obat?',
        score: 2,
        isYes: false,
        description:
            'Apoteker yang bertugas dapat menggali infromasi ini dengan bertanya kepada pasien dengan pertanyaan sebagai berikut:\na)	Apakah bapak ibu mengetahui tentang kejadian gula darah rendah setelah menggunakan obat?\nb)	Apakah bapak ibu mengetahui tanda dan gejala kadar gula darah rendah seperti jantung berdebar, perasaan lapar berlebihan, sulit untuk fokus atau berkonsentrasi, keringat dingin, tubuh gemetar, wajah pucat, rasa kesemutan pada tungkai atas maupun bawah, gelisah dan cemas?',
        answer: null,
      ),
      QuestionModel(
        id: 3,
        question:
            'Apakah pasien mengetahui cara menggunakan obat diabetes yang dibawa pulang?',
        score: 2,
        isYes: false,
        description:
            'Untuk mengassessment pertanyaan ini apoteker harus mengajukan pertanyaan kepada pasien hal-hal berikut:\na)	Apakah bapak/ibu mengetahui kapan harus menggunakan obat-obat yang akan dibawa pulang?\nb)	Apakah bapak/ibu mengetahui berapa banyak dan berapa kali harus menggunakan obat-obat yang akan dibawa pulang?',
        answer: null,
      ),
      QuestionModel(
        id: 4,
        question:
            'Apakah pasien/keluarga pasien mengetahui cara menangani kondisi hipoglikemia?',
        score: 2,
        isYes: false,
        description:
            'Untuk mengassessment pertanyaan ini apoteker harus mengajukan pertanyaan kepada pasien hal-hal berikut:\na)	Apakah bapak/ibu mengetahui pertolongan pertama yang harus dilakukan ketika terjadi tanda dan gejala hipoglikemia?\nb)	Menurut bapak/ibu apa makanan yang harus diberikan apabila bapak/ibu/pasien mengalami kondisi hipoglikemia?\nc)	Apakah bapak ibu mengetahui kapan harus membawa ke sarana layanan kesehatan ketika terjadi hipoglikemia?',
        answer: null,
      ),
      QuestionModel(
        id: 5,
        question:
            'Apakah pasien sedang menggunakan obat lain yang berisiko menimbulkan hipoglikemia?',
        score: 2,
        isYes: true,
        description:
            'Untuk mengassessment pertanyaan ini apoteker harus mengajukan pertanyaan kepada pasien hal-hal berikut:\na)	Apa saja obat-obat rutin yang bapak ibu sedang gunakan dirumah?\nb)	Apakah bapak/ibu menggunakan obat diluar yang diresepkan dokter?\nc)	Apa saja obat bebas/bebas terbatas yang bapak/ibu biasa gunakan apabila mengalami kondisi seperti nyeri, radang, batuk, pilek, alergi, atau kondisi lain yang membutuhkan obat tanpa resep dokter? Tanyakan obat bebas/bebas terbatas termasuk supplement dan herbal.\nd)	Apakah bapak ibu menyimpan obat-obatan di rumah selain yang diresepkan oleh dokter? Jika iya sebutkan dan catat.',
        answer: null,
      ),
      QuestionModel(
        id: 6,
        question:
            'Apakah pasien memiliki persepsi bahwa harus menggunakan obat lain/alternatif selain obat yang diresepkan oleh dokter?',
        score: 3,
        isYes: true,
        description:
            'Untuk mengassessment pertanyaan ini apoteker harus mengajukan pertanyaan kepada pasien hal-hal berikut:\na)	Apakah bapak/ibu pernah menggunakan obat herbal? “Jika iya lanjutkan ke pertanyaan b”\nb)	Bagaimana menurut bapak/ibu khasiat obat herbal terhadap kesehatan?\nc)	Bagaimana cara bapak/ibu menggunakan obat herbal tersebut? (dosis, frekuensi, interval, dengan makanan, sebelum/sesudah makan).\nd)	Apakah bapak/ibu pernah menghentikan obat diabetes/gula dari dokter dan hanya menggunakan obat herbal saja?\ne)	Dari mana informasi yang bapak/ibu dapatkan terkait obat herbal tersebut?',
        answer: null,
      ),
      QuestionModel(
        id: 7,
        question:
            'Apakah pasien/keluarga pasien membuat catatan jenis/item obat antidiabetes yang dibawa pulang?',
        score: 2,
        isYes: false,
        description:
            'Untuk mengassessment pertanyaan ini apoteker harus mengajukan pertanyaan kepada pasien hal-hal berikut:\na)	Apakah bapak/ibu dapat mengingat semua jenis obat yang digunakan?\nb)	Apakah bapak/ibu pernah lupa dengan jenis obat yang akan digunakan?\nc)	Apakah bapak/ibu pernah lupa minum obat? Jika iya, ceritakan kronologinya!\nd)	Apa yang bapak/ibu lakukan apabila lupa minum obat? Apakah melewati dosis tersebut atau langsung minum diwaktu saat ingat minum obat?\ne)	Apakah bapak/ibu pernah membuat catatan jenis/item obat antidiabetes yang digunakan sehari-hari dirumah?',
        answer: null,
      ),
      QuestionModel(
        id: 8,
        question:
            'Apakah pasien/keluarga pasien mengetahui jika penggunaan obat antidiabetes golongan insulin kerja cepat dan sulfonilurea tersebut dapat disesuaikan dosis dan frekuensinya sesuai pola makan? (misalnya saat puasa)',
        score: 2,
        isYes: false,
        description:
            'Pertanyaan ini hanya diassessment untuk pasien yang pulang dengan insulin kerja cepat dan atau sulfonilurea. Untuk mengassessment pertanyaan ini apoteker harus mengajukan pertanyaan kepada pasien hal-hal berikut:\na)	Apakah bapak ibu memiliki kebiasaan puasa? Misal puasa Rhamadan, diet khusus seperti intermitten fasting, puasa senin kamis, atau puasa spiritual lainnya?\nb)	Apakah bapak/ibu mengetahui bahwa obat antidiabetes golongan insulin kerja cepat dan sulfonilurea tidak perlu digunakan apabila tidak akan makan makanan besar?\nc)	Apakah bapak/ibu mengetahui jika akan menjalankan puasa regimen pengobatan dapat diubah?',
        answer: null,
      ),
      QuestionModel(
        id: 9,
        question:
            'Apakah pasien mengetahui jika obat golongan insulin dan sulfonilurea harus dihentikan sementara jika terjadi hipoglikemia berulang?',
        score: 3,
        isYes: false,
        description:
            'Untuk mengassessment pertanyaan ini apoteker harus mengajukan pertanyaan kepada pasien hal-hal berikut:\na)	Apakah bapak/ibu pernah merasakan gejala hipoglikemia sesaat setelah menggunakan obat golongan insulin dan atau sulfonilurea?\nb)	Apakah bapak/ibu mengetahui jika bapak/ibu dapat menghentikan obat golongan insulin dan atau sulfonilurea jika mengalami gejala hipoglikemia berulang?',
        answer: null,
      ),
      QuestionModel(
        id: 10,
        question:
            'Apakah pasien/keluarga pasien mengetahui kemana harus melapor atau menindaklanjuti apabila terjadi keadaan hipoglikemia berat?',
        score: 2,
        isYes: false,
        description:
            'Untuk mengassessment pertanyaan ini apoteker harus mengajukan pertanyaan kepada pasien hal-hal berikut:\na)	Apakah bapak/ibu pernah mengalami kejadian hipoglikemia berat hingga harus dirawat di RS?\nb)	Apakah terdapat tindakan yang ditempuh sebelum terjadinya kejadian hipoglikemia berat tersebut?\nc)	Apakah bapak/ibu memiliki no telepon pertolongan darurat (seperti ambulance, UGD, dokter, perawat, apoteker) dan rumah sakit tujuan terdekat dari tempat tinggal ketika menghadapi tanda dan gejala hipoglikemia berat?',
        answer: null,
      ),
    ];

    on<GetQuestionsA>(
      (event, emit) {
        emit(LoadedA(questionsA));
      },
    );

    on<GetQuestionsB>(
      (event, emit) {
        emit(LoadedB(questionsB));
      },
    );

    on<SetAnswer>(
      (event, emit) {
        emit(Loading());
        if (event.cat == 'A') {
          questionsA[event.index].answer = event.answer;
          emit(LoadedA(questionsA));
        } else {
          questionsB[event.index].answer = event.answer;
          emit(LoadedB(questionsB));
        }
      },
    );

    on<ResetAnswer>(
      (event, emit) {
        emit(Loading());
        for (var i = 0; i < questionsA.length; i++) {
          questionsA[i].answer = null;
        }
        for (var i = 0; i < questionsB.length; i++) {
          questionsB[i].answer = null;
        }
        emit(InitialState(questionsA, questionsB));
      },
    );

    on<ResetAnswerA>(
      (event, emit) {
        emit(Loading());
        for (var i = 0; i < questionsA.length; i++) {
          questionsA[i].answer = null;
        }
        emit(LoadedA(questionsA));
      },
    );

    on<ResetAnswerB>(
      (event, emit) {
        emit(Loading());
        for (var i = 0; i < questionsB.length; i++) {
          questionsB[i].answer = null;
        }
        emit(LoadedB(questionsB));
      },
    );
  }
}
