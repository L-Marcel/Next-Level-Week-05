import 'package:DevQuiz/core/app_colors.dart';
import 'package:DevQuiz/core/app_images.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:DevQuiz/shared/widget/progress_indicator/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuizCardWidget extends StatelessWidget {
  final String title;
  final String completed;
  final double percent;
  final VoidCallback onTap;

  const QuizCardWidget({
    Key? key,
    required this.title,
    required this.completed,
    required this.percent,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.fromBorderSide(
              BorderSide(color: AppColors.border),
            ),
            borderRadius: BorderRadius.circular(10),
            color: AppColors.white,
          ),
          constraints: BoxConstraints(
            minWidth: 180,
            maxWidth: 380,
            minHeight: 80,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                constraints: BoxConstraints(
                  minWidth: 180,
                  maxWidth: 360,
                  minHeight: 50,
                ),
                child: Wrap(
                  direction: Axis.horizontal,
                  spacing: 10,
                  runAlignment: WrapAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      child: Image.asset(
                        AppImages.blocks,
                      ),
                    ),
                    Text(
                      title,
                      style: AppTextStyles.heading,
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      completed,
                      style: AppTextStyles.body11,
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: ProgressIndicatorWidget(
                      value: percent,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
