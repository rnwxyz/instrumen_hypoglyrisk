import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instrumen_hypoglyrisk/blocs/history/history_bloc.dart';
import 'package:instrumen_hypoglyrisk/blocs/screening/screening_bloc.dart';
import 'package:instrumen_hypoglyrisk/models/history_model.dart';
import 'package:instrumen_hypoglyrisk/utils/components/question_compon.dart';
import 'package:instrumen_hypoglyrisk/utils/constant/my_color.dart';
import 'package:instrumen_hypoglyrisk/utils/validator/validator.dart';
import 'package:instrumen_hypoglyrisk/views/home/home_screen.dart';
import 'package:instrumen_hypoglyrisk/views/result/result_screen_b.dart';

class ScreeningScreenB extends StatefulWidget {
  final HistoryModel data;
  const ScreeningScreenB({super.key, required this.data});

  @override
  State<ScreeningScreenB> createState() => _ScreeningScreenBState();
}

class _ScreeningScreenBState extends State<ScreeningScreenB> {
  late final HistoryModel historyData;
  @override
  void initState() {
    context.read<ScreeningBloc>().add(ResetAnswer());
    context.read<ScreeningBloc>().add(GetQuestionsB());
    historyData = widget.data;
    super.initState();
  }

  final Validator validator = Validator();
  final _formKey = GlobalKey<FormState>();

  List<int> answerB = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

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
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
              (route) => false,
            );
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
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: MyColor.primary),
                    color: MyColor.primary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: RichText(
                    text: const TextSpan(
                      text: 'B. SKRINING RISIKO HIPOGLIKEMIA DALAM ASPEK ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      children: [
                        TextSpan(
                          text: 'MEDICATION SAFETY',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Question B1
                BlocBuilder<ScreeningBloc, ScreeningState>(
                  builder: (context, state) {
                    if (state is LoadedB) {
                      return QuestionComponent(
                        question: state.questionB[0].question,
                        description: state.questionB[0].description,
                        name: state.questionB[0].id.toString(),
                        score: state.questionB[0].score,
                        isYes: state.questionB[0].isYes,
                        answer: state.questionB[0].answer,
                        validator: validator.requiredInteger,
                        onChanged: (value) {
                          context
                              .read<ScreeningBloc>()
                              .add(SetAnswer(0, value!, 'B'));
                          answerB[0] = value;
                        },
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
                // Question B2
                BlocBuilder<ScreeningBloc, ScreeningState>(
                  builder: (context, state) {
                    if (state is LoadedB) {
                      return QuestionComponent(
                        question: state.questionB[1].question,
                        description: state.questionB[1].description,
                        name: state.questionB[1].id.toString(),
                        score: state.questionB[1].score,
                        isYes: state.questionB[1].isYes,
                        answer: state.questionB[1].answer,
                        validator: validator.requiredInteger,
                        onChanged: (value) {
                          context
                              .read<ScreeningBloc>()
                              .add(SetAnswer(1, value!, 'B'));
                          answerB[1] = value;
                        },
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
                // Question B3
                BlocBuilder<ScreeningBloc, ScreeningState>(
                  builder: (context, state) {
                    if (state is LoadedB) {
                      return QuestionComponent(
                        question: state.questionB[2].question,
                        description: state.questionB[2].description,
                        name: state.questionB[2].id.toString(),
                        score: state.questionB[2].score,
                        isYes: state.questionB[2].isYes,
                        answer: state.questionB[2].answer,
                        validator: validator.requiredInteger,
                        onChanged: (value) {
                          context
                              .read<ScreeningBloc>()
                              .add(SetAnswer(2, value!, 'B'));
                          answerB[2] = value;
                        },
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
                // Question B4
                BlocBuilder<ScreeningBloc, ScreeningState>(
                  builder: (context, state) {
                    if (state is LoadedB) {
                      return QuestionComponent(
                        question: state.questionB[3].question,
                        description: state.questionB[3].description,
                        name: state.questionB[3].id.toString(),
                        score: state.questionB[3].score,
                        isYes: state.questionB[3].isYes,
                        answer: state.questionB[3].answer,
                        validator: validator.requiredInteger,
                        onChanged: (value) {
                          context
                              .read<ScreeningBloc>()
                              .add(SetAnswer(3, value!, 'B'));
                          answerB[3] = value;
                        },
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
                // Question B5
                BlocBuilder<ScreeningBloc, ScreeningState>(
                  builder: (context, state) {
                    if (state is LoadedB) {
                      return QuestionComponent(
                        question: state.questionB[4].question,
                        description: state.questionB[4].description,
                        name: state.questionB[4].id.toString(),
                        score: state.questionB[4].score,
                        isYes: state.questionB[4].isYes,
                        answer: state.questionB[4].answer,
                        validator: validator.requiredInteger,
                        onChanged: (value) {
                          context
                              .read<ScreeningBloc>()
                              .add(SetAnswer(4, value!, 'B'));
                          answerB[4] = value;
                        },
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
                // Question B6
                BlocBuilder<ScreeningBloc, ScreeningState>(
                  builder: (context, state) {
                    if (state is LoadedB) {
                      return QuestionComponent(
                        question: state.questionB[5].question,
                        description: state.questionB[5].description,
                        name: state.questionB[5].id.toString(),
                        score: state.questionB[5].score,
                        isYes: state.questionB[5].isYes,
                        answer: state.questionB[5].answer,
                        validator: validator.requiredInteger,
                        onChanged: (value) {
                          context
                              .read<ScreeningBloc>()
                              .add(SetAnswer(5, value!, 'B'));
                          answerB[5] = value;
                        },
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
                // Question B7
                BlocBuilder<ScreeningBloc, ScreeningState>(
                  builder: (context, state) {
                    if (state is LoadedB) {
                      return QuestionComponent(
                        question: state.questionB[6].question,
                        description: state.questionB[6].description,
                        name: state.questionB[6].id.toString(),
                        score: state.questionB[6].score,
                        isYes: state.questionB[6].isYes,
                        answer: state.questionB[6].answer,
                        validator: validator.requiredInteger,
                        onChanged: (value) {
                          context
                              .read<ScreeningBloc>()
                              .add(SetAnswer(6, value!, 'B'));
                          answerB[6] = value;
                        },
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
                // Question B8
                BlocBuilder<ScreeningBloc, ScreeningState>(
                  builder: (context, state) {
                    if (state is LoadedB) {
                      return QuestionComponent(
                        question: state.questionB[7].question,
                        description: state.questionB[7].description,
                        name: state.questionB[7].id.toString(),
                        score: state.questionB[7].score,
                        isYes: state.questionB[7].isYes,
                        answer: state.questionB[7].answer,
                        validator: validator.requiredInteger,
                        onChanged: (value) {
                          context
                              .read<ScreeningBloc>()
                              .add(SetAnswer(7, value!, 'B'));
                          answerB[7] = value;
                        },
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
                // Question B9
                BlocBuilder<ScreeningBloc, ScreeningState>(
                  builder: (context, state) {
                    if (state is LoadedB) {
                      return QuestionComponent(
                        question: state.questionB[8].question,
                        description: state.questionB[8].description,
                        name: state.questionB[8].id.toString(),
                        score: state.questionB[8].score,
                        isYes: state.questionB[8].isYes,
                        answer: state.questionB[8].answer,
                        validator: validator.requiredInteger,
                        onChanged: (value) {
                          context
                              .read<ScreeningBloc>()
                              .add(SetAnswer(8, value!, 'B'));
                          answerB[8] = value;
                        },
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
                // Question B10
                BlocBuilder<ScreeningBloc, ScreeningState>(
                  builder: (context, state) {
                    if (state is LoadedB) {
                      return QuestionComponent(
                        question: state.questionB[9].question,
                        description: state.questionB[9].description,
                        name: state.questionB[9].id.toString(),
                        score: state.questionB[9].score,
                        isYes: state.questionB[9].isYes,
                        answer: state.questionB[9].answer,
                        validator: validator.requiredInteger,
                        onChanged: (value) {
                          context
                              .read<ScreeningBloc>()
                              .add(SetAnswer(9, value!, 'B'));
                          answerB[9] = value;
                        },
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton(
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
                      int totalB = answerB.reduce((a, b) => a + b);
                      context
                          .read<HistoryBloc>()
                          .add(EditScoreB(historyData.id!, totalB));
                      context.read<ScreeningBloc>().add(ResetAnswerB());
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ResultScreenB(),
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
