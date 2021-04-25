import 'package:flutter/material.dart';

import 'package:DevQuiz/core/app_colors.dart';

class ProgressIndicatorWidget extends StatefulWidget {
  final double value;

  ProgressIndicatorWidget({Key? key, required this.value}) : super(key: key);

  @override
  _ProgressIndicatorWidgetState createState() =>
      _ProgressIndicatorWidgetState();
}

class _ProgressIndicatorWidgetState extends State<ProgressIndicatorWidget>
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
    return ClipRRect(
      borderRadius: BorderRadius.circular(2),
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, _) => LinearProgressIndicator(
          value: _animation.value,
          backgroundColor: AppColors.chartSecondary,
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
        ),
      ),
    );
  }
}
