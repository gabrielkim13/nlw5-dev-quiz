import 'package:flutter/material.dart';

import 'package:DevQuiz/core/app_colors.dart';
import 'package:DevQuiz/core/app_text_styles.dart';

class ChartWidget extends StatefulWidget {
  final double value;

  const ChartWidget({Key? key, required this.value}) : super(key: key);

  @override
  _ChartWidgetState createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> _animation;

  void _initAnimation() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );

    _animation = Tween<double>(
      begin: 0.0,
      end: widget.value,
    ).animate(_controller);

    _controller.forward();
  }

  @override
  void initState() {
    _initAnimation();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,
        width: 80,
        child: Stack(
          children: [
            Container(
              height: 80,
              width: 80,
              child: AnimatedBuilder(
                animation: _animation,
                builder: (context, _) => CircularProgressIndicator(
                  strokeWidth: 10,
                  value: _animation.value,
                  backgroundColor: AppColors.chartSecondary,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppColors.chartPrimary,
                  ),
                ),
              ),
            ),
            Center(
              child: Text(
                '75%',
                style: AppTextStyles.heading,
              ),
            ),
          ],
        ));
  }
}
