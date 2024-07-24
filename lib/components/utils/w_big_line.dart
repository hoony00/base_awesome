import 'package:myfeelings/components/utils/w_line.dart';

import '../../common/data/index/index.dart';

/// BigLine

class BigLine extends StatelessWidget {
  const BigLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Line(thickness: 8.h, color: AppColor.hintText.withOpacity(0.2));
  }
}
