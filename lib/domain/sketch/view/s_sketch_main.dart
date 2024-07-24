import '../../../common/data/index/index.dart';

class SketchMainScreen extends ConsumerWidget {
  const SketchMainScreen({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      appBar: AppBar(
        title: Text('SketchMainScreen'),
      ),
      body: Center(
        child: Text('SketchMainScreen'),
      ),
    );
  }
}
