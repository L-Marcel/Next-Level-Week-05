import 'dart:async';

import 'package:DevQuiz/challenge/challenge_controller.dart';
import 'package:DevQuiz/challenge/widgets/new_buton/next_button_widget.dart';
import 'package:DevQuiz/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:DevQuiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:DevQuiz/core/app_colors.dart';
import 'package:DevQuiz/result/result_page.dart';
import 'package:DevQuiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;
  final String title;

  const ChallengePage({
    Key? key,
    required this.questions,
    required this.title,
  }) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengerController();
  final pageController = PageController();
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      controller.currentPage = pageController.page!.toInt() + 1;
    });
  }

  void nextPage() async {
    if (controller.currentPageNotifier.value < widget.questions.length) {
      pageController.nextPage(
        duration: Duration(milliseconds: 200),
        curve: Curves.linear,
      );
      controller.waitNextPage = false;
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultPage(
            length: widget.questions.length,
            title: widget.title,
            result: controller.qtdAwnsersRight,
          ),
        ),
      );
    }
  }

  void onSelected(bool value) {
    if (value) {
      controller.qtdAwnsersRight++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 4,
                child: Container(
                  color: AppColors.darkGreen,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: BackButton(),
                    ),
                    ValueListenableBuilder<int>(
                      valueListenable: controller.currentPageNotifier,
                      builder: (context, value, _) => QuestionIndicatorWidget(
                        currentPage: value,
                        length: widget.questions.length,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children: widget.questions
            .map(
              (e) => QuizWidget(
                question: e,
                onSelect: (value) {
                  onSelected(value);
                  controller.waitNextPage = true;
                },
              ),
            )
            .toList(),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ValueListenableBuilder<bool>(
                valueListenable: controller.waitNextPageNotifier,
                builder: (context, value, _) => value
                    ? Expanded(
                        child: NextButtonWidget.green(
                          label: "Continuar",
                          onTap: nextPage,
                        ),
                      )
                    : Expanded(
                        child: NextButtonWidget.white(
                          label: "Pular",
                          onTap: nextPage,
                        ),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
