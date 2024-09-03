import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instrumen_hypoglyrisk/blocs/history/history_bloc.dart';
import 'package:instrumen_hypoglyrisk/utils/constant/my_color.dart';
import 'package:intl/intl.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => HistoryScreenState();
}

class HistoryScreenState extends State<HistoryScreen> {
  @override
  void initState() {
    context.read<HistoryBloc>().add(GetHistory());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Pemeriksaan',
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
      body: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: BlocBuilder<HistoryBloc, HistoryState>(
          builder: (context, state) {
            if (state is LoadingHistory) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is SuccessGetAll) {
              return ListView.builder(
                itemCount: state.histories.length,
                itemBuilder: (context, index) {
                  final history = state.histories[index];
                  return GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Center(
                              child: Text('Detail Pemeriksaan',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Divider(color: MyColor.primary),
                                Text(
                                  'Nama : ${history.name}',
                                  style: const TextStyle(fontSize: 16),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'Usia : ${history.age} Tahun',
                                  style: const TextStyle(fontSize: 16),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'Jenis Kelamin : ${history.gender}',
                                  style: const TextStyle(fontSize: 16),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'No RM : ${history.rm}',
                                  style: const TextStyle(fontSize: 16),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'Skor A : ${history.scoreA}',
                                  style: const TextStyle(fontSize: 16),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'Skor B : ${history.scoreB}',
                                  style: const TextStyle(fontSize: 16),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'Tanggal : ${DateFormat('dd-MM-yyyy').format(history.date!)}',
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Card(
                      margin: const EdgeInsets.only(bottom: 20),
                      shadowColor: MyColor.primary,
                      elevation: 5,
                      color: Colors.white,
                      child: ListTile(
                        title: Text(
                          history.name,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const SizedBox(height: 2),
                            Text(
                              DateFormat('dd-MM-yyyy').format(history.date!),
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              'No RM : ${history.rm}',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              'A/B : ${history.scoreA}/${history.scoreB}',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.delete,
                            size: 40,
                          ),
                          onPressed: () {
                            context
                                .read<HistoryBloc>()
                                .add(DeleteHistory(history.id!));
                            context.read<HistoryBloc>().add(GetHistory());
                          },
                        ),
                      ),
                    ),
                  );
                },
              );
            } else if (state is ErrorHistory) {
              return Center(
                child: Text(state.message),
              );
            } else {
              return const Center(
                child: Text('Tidak ada data'),
              );
            }
          },
        ),
      ),
    );
  }
}


// ElevatedButton(
//           onPressed: () {
//             context.read<HistoryBloc>().add(DeleteAllHistory());
//             Navigator.pop(context);
//           },
//           child: const Text('Refresh'),
//         ),