import 'package:myfeelings/domain/my_page/opensource/vo_package.dart';

import '../../../common/data/index/index.dart';
import '../../../common/utils/json_utill.dart';
import '../../../components/utils/w_line.dart';
import 'w_opensource_item.dart';

class OpensourceScreen extends StatefulWidget {
  const OpensourceScreen({super.key});

  @override
  State<OpensourceScreen> createState() => _OpensourceScreenState();
}

class _OpensourceScreenState extends State<OpensourceScreen> {
  List<Package> packageList = [];

  @override
  void initState() {
    super.initState();
    initData();
  }

  void initData() async {
    final list = await LocalJson.getObjectList<Package>("assets/json/licenses.json");
    setState(() {
      packageList = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('오픈소스'),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => OpensourceItem(packageList[index]),
        itemCount: packageList.length,
        separatorBuilder: (BuildContext context, int index) {
          return const Line().pSymmetric(h: 20);
        },
      ),
    );
  }
}
