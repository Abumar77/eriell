import 'package:eriell/utils/links.dart';
import 'package:scalable_data_table/scalable_data_table.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  static const routeName = '/main-screen';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late ObjectsHive? data;
  bool _loadChart = true;
  late Iterable<UserHive> users;
  @override
  void initState() {
    var box = Hive.box<ObjectsHive>(DataBoxName);
    var box2 = Hive.box<UserHive>(UserBoxName);
    data = box.get(Values);
    users = box2.values;
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
                      customTable(),
                      _loadChart
                          ? Container(
                              width: screenWidth,
                              height: screenHeight / 3,
                              child: CustomPie(data: data!.data!))
                          : const SizedBox(),
                      const SizedBox(),
                    ],
                  ),
                )
              : Container(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [customTable()],
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

  Widget customTable() {
    return Container(
      height: 250,
      child: ScalableDataTable(
        header: DefaultTextStyle(
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey[700],
          ),
          child: ScalableTableHeader(
            columnWrapper: columnWrapper,
            children: const [
              Text('Surname'),
              Text('Password'),
            ],
          ),
        ),
        rowBuilder: (context, index) {
          final user = users.toList()[index];
          return ScalableTableRow(
            columnWrapper: columnWrapper,
            color: MaterialStateColor.resolveWith((states) =>
                (index % 2 == 0) ? Colors.grey[200]! : Colors.transparent),
            children: [
              Text(user.login),
              Text(user.password),
            ],
          );
        },
        emptyBuilder: (context) => const Text('No users yet...'),
        itemCount: users.length,
        minWidth: 400, // max(MediaQuery.of(context).size.width, 1000),
        textStyle: TextStyle(color: Colors.grey[700], fontSize: 14),
      ),
    );
  }

  Widget columnWrapper(BuildContext context, int columnIndex, Widget child) {
    const padding = EdgeInsets.symmetric(horizontal: 10);
    switch (columnIndex) {
      case 0:
        return Container(
          width: 200,
          padding: padding,
          child: child,
        );
      case 1:
        return Container(
          width: 100,
          padding: padding,
          child: child,
        );
      case 5:
        return Expanded(
          flex: 3,
          child: Container(
            padding: padding,
            child: child,
          ),
        );
      default:
        return Expanded(
          child: Container(
            padding: padding,
            child: child,
          ),
        );
    }
  }
}
