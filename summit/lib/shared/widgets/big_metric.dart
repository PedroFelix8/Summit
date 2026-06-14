import 'package:flutter/material.dart';

import 'package:summit/core/theme/app_text_styles.dart';

class BigMetric extends StatelessWidget {
  const BigMetric({
    super.key,
    required this.value,
    required this.label,
    this.sub,
  });

  final String value;
  final String label;
  final String? sub;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(value, style: AppTextStyles.metricValue),
          const SizedBox(height: 2),
          Text(label, style: AppTextStyles.metricLabel),
          if (sub != null) ...[
            const SizedBox(height: 1),
            Text(sub!, style: AppTextStyles.metricSubLabel),
          ],
        ],
      ),
    );
  }
}
