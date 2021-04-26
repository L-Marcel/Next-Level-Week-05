import 'package:DevQuiz/challenge/widgets/new_buton/next_button_widget.dart';
import 'package:DevQuiz/core/app_images.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {
  final String title;
  final int length;
  final int result;

  const ResultPage({
    Key? key,
    required this.title,
    required this.length,
    required this.result,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppImages.trophy),
            Text(
              "Parabéns!",
              style: AppTextStyles.heading40,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 60,
                right: 60,
                bottom: 20,
                top: 10,
              ),
              child: Text.rich(
                TextSpan(
                  text: "Você concluiu",
                  style: AppTextStyles.body,
                  children: [
                    TextSpan(
                      text: "\n$title",
                      style: AppTextStyles.bodyBold,
                    ),
                    TextSpan(
                      text: "\ncom $result de $length acertos.",
                      style: AppTextStyles.body,
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: NextButtonWidget.purple(
                    label: "Compartilhar",
                    onTap: () {
                      Share.share(
                          "*DevQuiz NLW#5: Flutter*\nResultado do quiz: $title\nNota: ${(result / length) * 100}");
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: NextButtonWidget.white(
                    label: "Voltar ao inicio",
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
