import '../../../common/data/index/index.dart';

class CanvasMainScreen extends ConsumerWidget {
  const CanvasMainScreen({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      appBar: AppBar(
        title: Text('CanvasMainScreen'),
      ),
      body: Center(
        child: Text('CanvasMainScreen'),
      ),
    );
  }
}
