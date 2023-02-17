import 'package:eriell/screens/mainscreen/data/models/models.dart';
import 'package:eriell/utils/links.dart';
import 'package:hive/hive.dart';

import '../../../../utils/constants.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  static const routeName = '/main-screen';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late ObjectsHive? data;
  bool _loadChart = false;
  @override
  void initState() {
    var box = Hive.box<ObjectsHive>(DataBoxName);
    data = box.get(Values);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final screenWidth = mediaQueryData.size.width;
    final screenHeight = mediaQueryData.size.height;
    final screenOrientation = mediaQueryData.orientation;
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Enter Engineering")),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.info))],
      ),
      drawer: const Drawer(),
      body: Center(
          child: screenOrientation == Orientation.portrait
              ? Container(
                  height: screenHeight - 50,
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomHeading(),
                      const SizedBox(height: 16.0),
                      const CustomParagraph(),
                      _loadChart
                          ? Container(
                              width: screenWidth,
                              height: screenHeight / 3,
                              child: CustomPie(data: data!.data!))
                          : const SizedBox(
                              height: 150,
                            ),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                )
              : Container(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _loadChart
                          ? Container(
                              width: screenWidth,
                              height: screenHeight / 1.7,
                              child: CustomPie(data: data!.data!))
                          : const SizedBox(
                              height: 150,
                            ),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.open_in_browser),
        onPressed: () {
          setState(() {
            _loadChart = !_loadChart;
          });
        },
      ),
    );
  }
}
