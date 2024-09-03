import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:instrumen_hypoglyrisk/utils/constant/my_color.dart';

class QuestionComponent extends StatelessWidget {
  final String question;
  final String name;
  final int score;
  final bool isYes;
  final String description;
  final int? answer;
  final Function(int?) onChanged;
  final Function(int?) validator;
  const QuestionComponent({
    super.key,
    required this.question,
    required this.name,
    required this.score,
    required this.isYes,
    required this.description,
    required this.answer,
    required this.onChanged,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: MyColor.secondary.withOpacity(0.1)),
        borderRadius: BorderRadius.circular(5),
        color: MyColor.secondary.withOpacity(0.1),
      ),
      margin: const EdgeInsets.only(bottom: 15),
      child: ListTile(
        leading: Text(
          name,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        contentPadding: const EdgeInsets.only(
          left: 12,
          right: 10,
          top: 5,
          bottom: 10,
        ),
        horizontalTitleGap: 0,
        minVerticalPadding: 0,
        title: Text(question, style: const TextStyle(fontSize: 16)),
        subtitle: FormBuilderRadioGroup(
          name: name,
          wrapAlignment: WrapAlignment.start,
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(left: 0, top: -20, bottom: -10),
          ),
          wrapSpacing: 50,
          controlAffinity: ControlAffinity.leading,
          options: [
            FormBuilderFieldOption(
              value: isYes ? score : 0,
              child: const Text('Ya'),
            ),
            FormBuilderFieldOption(
              value: isYes ? 0 : score,
              child: const Text('Tidak'),
            ),
          ],
          onChanged: (int? value) {
            onChanged(value);
          },
          initialValue: answer,
          validator: (value) => validator(value),
        ),
        titleAlignment: ListTileTitleAlignment.top,
        trailing: description == ''
            ? null
            : IconButton(
                icon: const Icon(Icons.help),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        shadowColor: MyColor.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        insetPadding: const EdgeInsets.all(16),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                question,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Divider(color: MyColor.primary),
                              const SizedBox(height: 16),
                              Text(description),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
      ),
    );
  }
}
