import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instrumen_hypoglyrisk/blocs/history/history_bloc.dart';
import 'package:instrumen_hypoglyrisk/utils/constant/my_color.dart';
import 'package:instrumen_hypoglyrisk/views/home/home_screen.dart';
import 'package:intl/intl.dart';

class ResultScreenB extends StatefulWidget {
  const ResultScreenB({
    super.key,
  });

  @override
  State<ResultScreenB> createState() => _ResultScreenBState();
}

class _ResultScreenBState extends State<ResultScreenB> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hasil Pemeriksaan',
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: MyColor.primary,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: BlocBuilder<HistoryBloc, HistoryState>(
          builder: (context, state) {
            if (state is LoadingHistory) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ErrorHistory) {
              return Center(child: Text(state.message));
            } else if (state is Success) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                      border: Border.all(color: MyColor.tertiary),
                      borderRadius: BorderRadius.circular(10),
                      color: MyColor.tertiary,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          'Skrining Risiko Hipoglikemia Dalam Aspek Medication Safety',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Divider(
                          color: MyColor.primary,
                          height: 20,
                          thickness: 5,
                        ),
                        const SizedBox(height: 10),
                        RichText(
                          text: TextSpan(
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                              const TextSpan(
                                text: 'Nama : ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(text: state.history.name),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                        RichText(
                          text: TextSpan(
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                              const TextSpan(
                                text: 'Usia : ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                  text:
                                      '${state.history.age.toString()} Tahun'),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                        RichText(
                          text: TextSpan(
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                              const TextSpan(
                                text: 'Jenis Kelamin : ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(text: state.history.gender),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                        RichText(
                          text: TextSpan(
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                              const TextSpan(
                                text: 'No RM : ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(text: state.history.rm),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                        RichText(
                          text: TextSpan(
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                              const TextSpan(
                                text: 'Apoteker : ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(text: state.history.apoteker),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                        RichText(
                          text: TextSpan(
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                              const TextSpan(
                                text: 'Tanggal : ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                  text: DateFormat('dd - MM - yyyy')
                                      .format(state.history.date!)),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                style: const TextStyle(
                                  fontSize: 24,
                                  color: Colors.black,
                                ),
                                children: <TextSpan>[
                                  const TextSpan(
                                    text: 'Total Skor : ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: state.history.scoreB.toString(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 20),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: state.history.scoreB < 7
                                    ? Colors.green
                                    : (state.history.scoreB > 6 &&
                                            state.history.scoreB < 12
                                        ? Colors.orange
                                        : Colors.red),
                              ),
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                state.history.scoreB < 7
                                    ? 'Low Risk'
                                    : (state.history.scoreB > 6 &&
                                            state.history.scoreB < 12
                                        ? 'Moderate Risk'
                                        : 'High Risk'),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MyColor.primary,
                        padding: const EdgeInsets.all(8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        fixedSize: const Size(150, 50),
                      ),
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()),
                          (route) => false,
                        );
                      },
                      child: const Text(
                        'Selesai',
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                    ),
                  )
                ],
              );
            } else {
              return const Center(child: Text('Error'));
            }
          },
        ),
      ),
    );
  }
}
