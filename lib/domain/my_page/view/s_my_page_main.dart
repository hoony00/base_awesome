import '../../../common/data/index/index.dart';

class MyPageMainScreen extends ConsumerWidget {
  const MyPageMainScreen({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      appBar: AppBar(
        title: Text('마이 페이지'),
      ),
      body: Center(
        child: Text('my_page'),
      ),
    );
  }
}
