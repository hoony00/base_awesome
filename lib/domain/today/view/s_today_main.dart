import '../../../common/data/index/index.dart';

class TodayMainScreen extends ConsumerWidget {
  const TodayMainScreen({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      appBar: AppBar(
        title: Text('TodayMainScreen'),
      ),
      body: Center(
        child: Text('TodayMainScreen'),
      ),
    );
  }
}
