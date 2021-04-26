import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:DevQuiz/shared/widget/progress_indicator/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  final int currentPage;
  final int length;

  const QuestionIndicatorWidget({
    Key? key,
    required this.currentPage,
    required this.length,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(
          bottom: 20,
          left: 5,
          top: 8,
          right: 20,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Questão $currentPage ",
                  style: AppTextStyles.body,
                ),
                Text(
                  "de $length",
                  style: AppTextStyles.body,
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            ProgressIndicatorWidget(
              value: currentPage / length,
            )
          ],
        ),
      ),
    );
  }
}
