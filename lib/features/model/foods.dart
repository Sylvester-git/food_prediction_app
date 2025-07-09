import 'package:equatable/equatable.dart';

class Foods extends Equatable {
  final String id;
  final String name;
  final String catid;

  const Foods({required this.id, required this.name, required this.catid});

  @override
  List<Object?> get props => [id, name, catid];
}
