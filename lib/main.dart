import 'package:eriell/screens/authorization/presentation/bloc/login_bloc.dart';
import 'package:eriell/screens/mainscreen/data/models/models.dart';
import 'package:eriell/utils/constants.dart';
import 'package:eriell/utils/links.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

Map<String, double> mapp = {
  'Natural gas': 60405.8,
  'Gas condensate': 2098.3,
  'Conventional oil': 698.6,
  'Coal': 4049.5
};
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.init((await getApplicationDocumentsDirectory()).path);
  Hive.registerAdapter(ObjectsHiveAdapter());
  // Wakelock.enable();

  var box = await Hive.openBox<ObjectsHive>(DataBoxName);

  box.put(Values, ObjectsHive(data: mapp));
  await setup();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final appRouter = AppRouter();

  @override
  void initState() {
    mapp.forEach((key, value) {
      ObjectsHive(data: mapp);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ls<LoginBloc>(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        routerDelegate: appRouter.delegate(),
        routeInformationParser: appRouter.defaultRouteParser(),
      ),
    );
  }
}
