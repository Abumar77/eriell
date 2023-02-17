import 'package:hive/hive.dart';

part 'models.g.dart';

@HiveType(typeId: 2)
class ObjectsHive extends HiveObject {
  ObjectsHive({this.data});

  @HiveField(7)
  Map<String, double>? data;

  // TODO: implement props
  List<Object?> get props => [data];
}
