import 'package:DevQuiz/challenge/widgets/awnser/awnser_widget.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:DevQuiz/shared/models/awnser_model.dart';
import 'package:DevQuiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final ValueChanged<bool> onSelect;

  const QuizWidget({
    Key? key,
    required this.question,
    required this.onSelect,
  }) : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int indexSelected = -1;
  AwnserModel awnsers(int index) => widget.question.awnsers[index];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            widget.question.title,
            style: AppTextStyles.heading,
          ),
          SizedBox(
            height: 24,
          ),
          Expanded(
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                for (var i = 0; i < widget.question.awnsers.length; i++)
                  AwnserWidget(
                    awnsers: awnsers(i),
                    isSelected: indexSelected == i,
                    disabled: indexSelected != -1,
                    onTap: (value) {
                      indexSelected = i;
                      Future.delayed(Duration(seconds: 1));
                      widget.onSelect(value);
                      setState(() {});
                    },
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
