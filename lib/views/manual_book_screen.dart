import 'package:flutter/material.dart';
import 'package:instrumen_hypoglyrisk/utils/constant/my_color.dart';

class ManualBookScreen extends StatelessWidget {
  const ManualBookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manual Book', style: TextStyle(color: Colors.white)),
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
      body: const SafeArea(
        minimum: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                'Instrumen HYPOGLYRISK merupakan alat ukur yang dirancang untuk digunakan oleh Apoteker dalam menilai risiko hipoglikemia berat / severe hypoglycemia pada pasien diabetes mellitus rawat jalan yang pulang dengan agen antidiabetes. Dengan diketahui profil risiko pasien tersebut, maka dapat diambil langkah pencegahan / upaya preventif untuk menjamin pasien berada dalam keadaan aman dalam menggunakan obat.\n',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
                textAlign: TextAlign.justify,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'A. SKRINING FAKTOR RISIKO',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              Text(
                'Bapak/Ibu apoteker diminta melakukan penelusuran informasi terkait dengan faktor risiko pasien meliputi riwayat hipoglikemia berat pasien, apakah pasien merupakan pengguna insulin dan atau sulfonyurea, apakah pasien memiliki riwayat CKD, apakah durasi diabetes pada pasien >5 tahun, nilai HbA1C pasien terakhir, dan nilai BMI pasien. Adapun pertimbangan-pertimbangan yang dapat dilakukan untuk menelusuri informasi tersebut disajikan sebagai berikut:',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors
                      .black, // Perlu ditambahkan karena TextSpan tidak memiliki default color
                ),
                textAlign: TextAlign.justify,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '\n1. Riwayat hipoglikemia berat\n2. Penguna Insulin\n3. Pengguna Sulfonyurea\n4. Memiliki riwayat penyakit CKD\n5. Memiliki riwayat penyakit Neuropati\n6. Durasi diabetes >5 tahun\n7. Pasien tinggal sendiri\n8. Nilai HbA1C terakhir >7%\n9. BMI > 25 kg/m2\n10. Usia >65 tahun\n11. Jenis kelamin (laki-laki)',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors
                        .black, // Perlu ditambahkan karena TextSpan tidak memiliki default color
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              Text(
                '\nInformasi tersebut bapak/ibu apoteker dapat diakses melalui rekam medis, resep dokter, maupun observasi langsung kepada pasien.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors
                      .black, // Perlu ditambahkan karena TextSpan tidak memiliki default color
                ),
                textAlign: TextAlign.justify,
              ),
              Text(
                '\nB. SKRINING MEDICATION SAFETY RAWAT JALAN',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Setelah melakukan skrining terhadap faktor risiko, Bapak/Ibu apoteker diminta melakukan assessment terkait dengan keamanan pasien ketika pulang dengan agen antidiabetes meliputi 5 diemensi anatara lain dimensi memulai menggunakan obat, cara menggunakan obat, merubah regimen pengobatan, peninjauan pengobatan, dan penghentian penggunaan obat. Adapun pertimbangan-pertimbangan yang dapat dilakukan untuk menilai dimensi tersebut dijabarkan sebagai berikut:\n',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors
                      .black, // Perlu ditambahkan karena TextSpan tidak memiliki default color
                ),
                textAlign: TextAlign.justify,
              ),
              Text(
                'I. Dimensi Memulai Menggunakan Obat Antidiabetes\n',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.justify,
              ),
              Text(
                '1.	Apakah pasien mengenali obat diabetes yang dibawa pulang?',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Untuk dapat menjawab pertanyaan ini Apoteker harus mengajukan minimal dua pertanyaan kepada pasien antara lain:\na)	Apakah bapak ibu dapat menyebutkan kembali nama obat yang akan dibawa pulang beserta indikasinya?\nb)	Apakah bapak/ibu dapat menyebutkan obat yang akan membantu menurunkan/menstabilkan kadar gula darah bapak/Ibu?\n\nApoteker dapat mencentang/menandai jawaban “YA” apabila :\na)	Pasien dapat menjawab seluruh nama dan indikasi obat yang akan dibawa pulang termasuk obat non antidiabetes.\nb)	Pasien mampu mengenali obat antidiabetes yang dibawa pulang sesuai denga terapi yang diberikan dokter seperti obat-obat golongan Biguanida, Sulfonilurea, Glinide, DPP4-I, SGLT2-I, AGI, GLP-1RA, dan Insulin.\n\nApoteker mencentang jawaban “TIDAK” apabila :\na)	Pasien gagal menyebutkan atau hanya menjawab benat sebagian dari obat yang dibawa pulang\nb)	Pasien gagal menyebutkan atau menjawab benar sebagian dari obat antidiabetes yang dibawa pulang.\n',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
                textAlign: TextAlign.justify,
              ),
              Text(
                '2.	Apakah pasien mengenali tanda dan gejala hipoglikemia setelah menggunakan obat?',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.justify,
              ),
              Text(
                'Apoteker yang bertugas dapat menggali infromasi ini dengan bertanya kepada pasien dengan pertanyaan sebagai berikut:\na)	Apakah bapak ibu mengetahui tentang kejadian gula darah rendah setelah menggunakan obat?\nb)	Apakah bapak ibu mengetahui tanda dan gejala kadar gula darah rendah seperti jantung berdebar, perasaan lapar berlebihan, sulit untuk fokus atau berkonsentrasi, keringat dingin, tubuh gemetar, wajah pucat, rasa kesemutan pada tungkai atas maupun bawah, gelisah dan cemas?\n\nApoteker dapat mencentang/menandai jawaban “YA” apabila :\nPasien mengetahui atau pernah mengalami possible side effect dari penggunaan agen antihiperglikemia yaitu hipoglikemia dengan tanda dan gejala salah satu dari berikut: Jantung berdebar, perasaan lapar berlebihan, sulit untuk fokus atau berkonsentrasi, keringat dingin, tubuh gemetar, wajah pucat, rasa kesemutan pada tungkai atas maupun bawah, gelisah dan cemas.\n\nApoteker mencentang jawaban “TIDAK” apabila :\na)	Pasien tidak mengetahui possible side effect dari penggunaan agen antihiperglikemia yaitu hipoglikemia.\nb)	Pasien pernah mengalami tanda dan gejala seperti : Jantung berdebar, perasaan lapar berlebihan, sulit untuk fokus atau berkonsentrasi, keringat dingin, tubuh gemetar, wajah pucat, rasa kesemutan pada tungkai atas maupun bawah gelisah dan cemasan, akan tetapi tidak mengetahui bahwa hal tersebut akibat possible side effect dari penggunaan agen antihiperglikemia.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
                textAlign: TextAlign.justify,
              ),
              Text(
                '\nII. Dimensi Cara Menggunakan Obat Antidiabetes\n',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.justify,
              ),
              Text(
                '3. Apakah pasien mengetahui cara menggunakan obat diabetes yang dibawa pulang?',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Untuk mengassessment pertanyaan ini apoteker harus mengajukan pertanyaan kepada pasien hal-hal berikut:\na)	Apakah bapak/ibu mengetahui kapan harus menggunakan obat-obat yang akan dibawa pulang?\nb)	Apakah bapak/ibu mengetahui berapa banyak dan berapa kali harus menggunakan obat-obat yang akan dibawa pulang?\n\nApoteker dapat mencentang/menandai jawaban “YA” apabila :\nPasien mampu menjawab pertanyaan a dan b diatas sesuai dengan cara pakai obat yang telah dijelaskan sesuai peresepan oleh dokter.\n\nApoteker mencentang jawaban “TIDAK” apabila :\nPasien tidak mampu atau mampu sebagian menjawab pertanyaan a dan b diatas sesuai dengan cara pakai obat yang telah dijelaskan sesuai peresepan oleh dokter.\n',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors
                      .black, // Perlu ditambahkan karena TextSpan tidak memiliki default color
                ),
                textAlign: TextAlign.justify,
              ),
              Text(
                '4.	Apakah pasien/keluarga pasien mengetahui cara menangani kondisi hipoglikemia?',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Untuk mengassessment pertanyaan ini apoteker harus mengajukan pertanyaan kepada pasien hal-hal berikut:\na)	Apakah bapak/ibu mengetahui pertolongan pertama yang harus dilakukan ketika terjadi tanda dan gejala hipoglikemia?\nb)	Menurut bapak/ibu apa makanan yang harus diberikan apabila bapak/ibu/pasien mengalami kondisi hipoglikemia?\nc)	Apakah bapak ibu mengetahui kapan harus membawa ke sarana layanan kesehatan ketika terjadi hipoglikemia?\n',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors
                      .black, // Perlu ditambahkan karena TextSpan tidak memiliki default color
                ),
                textAlign: TextAlign.justify,
              ),
              Text(
                'III. Dimensi Merubah Regimen Obat Antidiabetes\n',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.justify,
              ),
              Text(
                '5.	Apakah pasien memiliki persepsi bahwa harus menggunakan obat lain/alternatif selain obat yang diresepkan oleh dokter?',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Untuk mengassessment pertanyaan ini apoteker harus mengajukan pertanyaan kepada pasien hal-hal berikut:\na)	Apakah bapak/ibu pernah menggunakan obat herbal? “Jika iya lanjutkan ke pertanyaan b”\nb)	Bagaimana menurut bapak/ibu khasiat obat herbal terhadap kesehatan?\nc)	Bagaimana cara bapak/ibu menggunakan obat herbal tersebut? (dosis, frekuensi, interval, dengan makanan, sebelum/sesudah makan).\nd)	Apakah bapak/ibu pernah menghentikan obat diabetes/gula dari dokter dan hanya menggunakan obat herbal saja?\ne)	Dari mana informasi yang bapak/ibu dapatkan terkait obat herbal tersebut?\n',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors
                      .black, // Perlu ditambahkan karena TextSpan tidak memiliki default color
                ),
                textAlign: TextAlign.justify,
              ),
              Text(
                'IV. Dimensi Meninjau Terapi Obat Antidiabetes\n',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.justify,
              ),
              Text(
                '6.	Apakah pasien/keluarga pasien membuat catatan jenis/item obat antidiabetes yang dibawa pulang?',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Untuk mengassessment pertanyaan ini apoteker harus mengajukan pertanyaan kepada pasien hal-hal berikut:\na)	Apakah bapak/ibu dapat mengingat semua jenis obat yang digunakan?\nb)	Apakah bapak/ibu pernah lupa dengan jenis obat yang akan digunakan?\nc)	Apakah bapak/ibu pernah lupa minum obat? Jika iya, ceritakan kronologinya!\nd)	Apa yang bapak/ibu lakukan apabila lupa minum obat? Apakah melewati dosis tersebut atau langsung minum diwaktu saat ingat minum obat?\ne)	Apakah bapak/ibu pernah membuat catatan jenis/item obat antidiabetes yang digunakan sehari-hari dirumah?\n',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors
                      .black, // Perlu ditambahkan karena TextSpan tidak memiliki default color
                ),
                textAlign: TextAlign.justify,
              ),
              Text(
                'V. Dimensi Menghentikan Terapi Obat Antidiabetes\n',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.justify,
              ),
              Text(
                '7.	Apakah pasien mengetahui jika obat golongan insulin dan sulfonilurea harus dihentikan sementara jika terjadi hipoglikemia berulang?',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Untuk mengassessment pertanyaan ini apoteker harus mengajukan pertanyaan kepada pasien hal-hal berikut:\na)	Apakah bapak/ibu pernah merasakan gejala hipoglikemia sesaat setelah menggunakan obat golongan insulin dan atau sulfonilurea?\nb)	Apakah bapak/ibu mengetahui jika bapak/ibu dapat menghentikan obat golongan insulin dan atau sulfonilurea jika mengalami gejala hipoglikemia berulang?\n',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors
                      .black, // Perlu ditambahkan karena TextSpan tidak memiliki default color
                ),
                textAlign: TextAlign.justify,
              ),
              Text(
                '8.	Apakah pasien/keluarga pasien mengetahui kemana harus melapor atau menindaklanjuti apabila terjadi keadaan hipoglikemia berat?',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Untuk mengassessment pertanyaan ini apoteker harus mengajukan pertanyaan kepada pasien hal-hal berikut:\na)	Apakah bapak/ibu pernah mengalami kejadian hipoglikemia berat hingga harus dirawat di RS?\nb)	Apakah terdapat tindakan yang ditempuh sebelum terjadinya kejadian hipoglikemia berat tersebut?\nc)	Apakah bapak/ibu memiliki no telepon pertolongan darurat (seperti ambulance, UGD, dokter, perawat, apoteker) dan rumah sakit tujuan terdekat dari tempat tinggal ketika menghadapi tanda dan gejala hipoglikemia berat?\n',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors
                      .black, // Perlu ditambahkan karena TextSpan tidak memiliki default color
                ),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
