import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instrumen_hypoglyrisk/blocs/history/history_bloc.dart';
import 'package:instrumen_hypoglyrisk/blocs/screening/screening_bloc.dart';
import 'package:instrumen_hypoglyrisk/models/history_model.dart';
import 'package:instrumen_hypoglyrisk/utils/components/input_component.dart';
import 'package:instrumen_hypoglyrisk/utils/components/question_compon.dart';
import 'package:instrumen_hypoglyrisk/utils/constant/my_color.dart';
import 'package:instrumen_hypoglyrisk/utils/validator/validator.dart';
import 'package:instrumen_hypoglyrisk/views/result/result_screen_a.dart';

class ScreeningScreenA extends StatefulWidget {
  const ScreeningScreenA({super.key});

  @override
  State<ScreeningScreenA> createState() => _ScreeningScreenAState();
}

class _ScreeningScreenAState extends State<ScreeningScreenA> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final apotekerController = TextEditingController();
  final rmController = TextEditingController();
  final genderController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    apotekerController.dispose();
    rmController.dispose();
    genderController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    context.read<ScreeningBloc>().add(ResetAnswer());
    context.read<ScreeningBloc>().add(GetQuestionsA());
    super.initState();
  }

  final Validator validator = Validator();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pemeriksaan', style: TextStyle(color: Colors.white)),
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
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 16),
                InputComponent(
                  controller: nameController,
                  label: 'Nama Pasien',
                  validator: validator.requiredString,
                  keyboardType: TextInputType.text,
                  onTap: () {},
                  isReadOnly: false,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelText: 'Jenis Kelamin',
                          contentPadding: const EdgeInsets.all(12),
                        ),
                        items: const [
                          DropdownMenuItem(
                              value: 'Laki-laki', child: Text('Laki-laki')),
                          DropdownMenuItem(
                              value: 'Perempuan', child: Text('Perempuan')),
                        ].toList(),
                        onChanged: (value) {
                          genderController.text = value!;
                        },
                        validator: (value) => validator.requiredString(value),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: InputComponent(
                        controller: ageController,
                        label: 'Umur (Tahun)',
                        validator: validator.requiredString,
                        keyboardType: TextInputType.number,
                        onTap: () {},
                        isReadOnly: false,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                InputComponent(
                  controller: rmController,
                  label: 'No. Rekam Medis',
                  validator: validator.requiredString,
                  keyboardType: TextInputType.text,
                  onTap: () {},
                  isReadOnly: false,
                ),
                const SizedBox(height: 16),
                InputComponent(
                  controller: apotekerController,
                  label: 'Nama Apoteker',
                  validator: validator.requiredString,
                  keyboardType: TextInputType.text,
                  onTap: () {},
                  isReadOnly: false,
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: MyColor.primary),
                    color: MyColor.primary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    'A. SKRINING FAKTOR RISIKO HIPOGLIKEMIA',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Question A1
                BlocBuilder<ScreeningBloc, ScreeningState>(
                  builder: (context, state) {
                    if (state is LoadedA) {
                      return QuestionComponent(
                        question: state.questionA[0].question,
                        description: state.questionA[0].description,
                        name: state.questionA[0].id.toString(),
                        score: state.questionA[0].score,
                        isYes: state.questionA[0].isYes,
                        answer: state.questionA[0].answer,
                        validator: validator.requiredInteger,
                        onChanged: (value) {
                          context
                              .read<ScreeningBloc>()
                              .add(SetAnswer(0, value!, 'A'));
                        },
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
                // Question A2
                BlocBuilder<ScreeningBloc, ScreeningState>(
                  builder: (context, state) {
                    if (state is LoadedA) {
                      return QuestionComponent(
                        question: state.questionA[1].question,
                        description: state.questionA[1].description,
                        name: state.questionA[1].id.toString(),
                        score: state.questionA[1].score,
                        isYes: state.questionA[1].isYes,
                        answer: state.questionA[1].answer,
                        validator: validator.requiredInteger,
                        onChanged: (value) {
                          context
                              .read<ScreeningBloc>()
                              .add(SetAnswer(1, value!, 'A'));
                        },
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
                // Question A3
                BlocBuilder<ScreeningBloc, ScreeningState>(
                  builder: (context, state) {
                    if (state is LoadedA) {
                      return QuestionComponent(
                        question: state.questionA[2].question,
                        description: state.questionA[2].description,
                        name: state.questionA[2].id.toString(),
                        score: state.questionA[2].score,
                        isYes: state.questionA[2].isYes,
                        answer: state.questionA[2].answer,
                        validator: validator.requiredInteger,
                        onChanged: (value) {
                          context
                              .read<ScreeningBloc>()
                              .add(SetAnswer(2, value!, 'A'));
                        },
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
                // Question A4
                BlocBuilder<ScreeningBloc, ScreeningState>(
                  builder: (context, state) {
                    if (state is LoadedA) {
                      return QuestionComponent(
                        question: state.questionA[3].question,
                        description: state.questionA[3].description,
                        name: state.questionA[3].id.toString(),
                        score: state.questionA[3].score,
                        isYes: state.questionA[3].isYes,
                        answer: state.questionA[3].answer,
                        validator: validator.requiredInteger,
                        onChanged: (value) {
                          context
                              .read<ScreeningBloc>()
                              .add(SetAnswer(3, value!, 'A'));
                        },
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
                // Question A5
                BlocBuilder<ScreeningBloc, ScreeningState>(
                  builder: (context, state) {
                    if (state is LoadedA) {
                      return QuestionComponent(
                        question: state.questionA[4].question,
                        description: state.questionA[4].description,
                        name: state.questionA[4].id.toString(),
                        score: state.questionA[4].score,
                        isYes: state.questionA[4].isYes,
                        answer: state.questionA[4].answer,
                        validator: validator.requiredInteger,
                        onChanged: (value) {
                          context
                              .read<ScreeningBloc>()
                              .add(SetAnswer(4, value!, 'A'));
                        },
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
                // Question A6
                BlocBuilder<ScreeningBloc, ScreeningState>(
                  builder: (context, state) {
                    if (state is LoadedA) {
                      return QuestionComponent(
                        question: state.questionA[5].question,
                        description: state.questionA[5].description,
                        name: state.questionA[5].id.toString(),
                        score: state.questionA[5].score,
                        isYes: state.questionA[5].isYes,
                        answer: state.questionA[5].answer,
                        validator: validator.requiredInteger,
                        onChanged: (value) {
                          context
                              .read<ScreeningBloc>()
                              .add(SetAnswer(5, value!, 'A'));
                        },
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
                // Question A7
                BlocBuilder<ScreeningBloc, ScreeningState>(
                  builder: (context, state) {
                    if (state is LoadedA) {
                      return QuestionComponent(
                        question: state.questionA[6].question,
                        description: state.questionA[6].description,
                        name: state.questionA[6].id.toString(),
                        score: state.questionA[6].score,
                        isYes: state.questionA[6].isYes,
                        answer: state.questionA[6].answer,
                        validator: validator.requiredInteger,
                        onChanged: (value) {
                          context
                              .read<ScreeningBloc>()
                              .add(SetAnswer(6, value!, 'A'));
                        },
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
                // Question A8
                BlocBuilder<ScreeningBloc, ScreeningState>(
                  builder: (context, state) {
                    if (state is LoadedA) {
                      return QuestionComponent(
                        question: state.questionA[7].question,
                        description: state.questionA[7].description,
                        name: state.questionA[7].id.toString(),
                        score: state.questionA[7].score,
                        isYes: state.questionA[7].isYes,
                        answer: state.questionA[7].answer,
                        validator: validator.requiredInteger,
                        onChanged: (value) {
                          context
                              .read<ScreeningBloc>()
                              .add(SetAnswer(7, value!, 'A'));
                        },
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
                const SizedBox(height: 16),
                BlocBuilder<ScreeningBloc, ScreeningState>(
                  builder: (context, state) {
                    if (state is LoadedA) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: MyColor.primary,
                          padding: const EdgeInsets.all(0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          fixedSize: const Size(250, 55),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final HistoryModel history = HistoryModel(
                              name: nameController.text,
                              gender: genderController.text,
                              age: int.parse(ageController.text),
                              rm: rmController.text,
                              apoteker: apotekerController.text,
                              date: DateTime.now(),
                              scoreA: state.questionA
                                  .map((e) => e.answer!)
                                  .reduce((value, element) => value + element),
                              scoreB: 0,
                            );
                            context
                                .read<HistoryBloc>()
                                .add(SubmitAnswer(history));
                            context.read<ScreeningBloc>().add(ResetAnswerA());

                            // push to result screen and remove this screen
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ResultScreenA(),
                              ),
                            );
                          } else {
                            // Validasi gagal
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    'Formulir tidak valid, silahkan periksa kembali'),
                              ),
                            );
                          }
                        },
                        child: const Text(
                          'Hitung Resiko',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
                const SizedBox(height: 20)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
