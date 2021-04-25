import 'package:DevQuiz/shared/widgets/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:DevQuiz/core/app_colors.dart';

class QuizCardWidget extends StatelessWidget {
  final String title;

  final Image image;

  final int done;

  final int total;

  final VoidCallback onTap;

  QuizCardWidget(
      {Key? key,
      required this.title,
      required this.image,
      required this.done,
      required this.total,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 177,
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(width: 1, color: AppColors.border),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  child: image,
                ),
                Text(
                  title,
                  style: GoogleFonts.notoSans(
                    color: AppColors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Text(
                        '$done de $total',
                        style: GoogleFonts.notoSans(
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          color: AppColors.lightGrey,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 7,
                      child: ProgressIndicatorWidget(
                          value: this.done / this.total),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
