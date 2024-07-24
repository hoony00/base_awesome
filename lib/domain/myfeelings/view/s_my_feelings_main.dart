import '../../../common/data/index/index.dart';

class MyFeelingsMainScreen extends ConsumerWidget {
  const MyFeelingsMainScreen({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      appBar: AppBar(
        title: Text('MyFeelingsMainScreen'),
      ),
      body: Center(
        child: Text('MyFeelingsMainScreen'),
      ),
    );
  }
}
