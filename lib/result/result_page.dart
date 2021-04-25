import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

import 'package:DevQuiz/core/app_colors.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:DevQuiz/core/app_images.dart';

import 'package:DevQuiz/home/home_page.dart';

import 'package:DevQuiz/challenge/widgets/next_button/next_button_widget.dart';

class ResultPage extends StatelessWidget {
  final String title;

  final int correct;

  final int total;

  ResultPage(
      {Key? key,
      required this.title,
      required this.correct,
      required this.total})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppImages.trophy),
            SizedBox(height: 40),
            Text(
              'Parabéns!',
              style: GoogleFonts.notoSans(
                color: AppColors.grey,
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 16),
            Column(
              children: [
                Text(
                  'Você concluiu',
                  style: AppTextStyles.body,
                ),
                Text(
                  title,
                  style: AppTextStyles.heading15,
                ),
                Text(
                  'com $correct de $total acertos.',
                  style: AppTextStyles.body,
                ),
              ],
            ),
            SizedBox(height: 80),
            Row(
              children: [
                Expanded(
                  child: NextButtonWidget.purple(
                    text: 'Compartilhar',
                    onTap: () {
                      Share.share(
                        'DevQuiz - NLW05 Flutter:\n\nAcertei $correct de $total questões do quiz $title!',
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: NextButtonWidget.normal(
                    text: 'Voltar ao início',
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
