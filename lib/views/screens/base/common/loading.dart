import 'package:flutter/material.dart';

import '../../../../utils/color.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(AppColor.secondary),
      backgroundColor: AppColor.background,
    ));
  }
}
