import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({
    required this.id,
    required this.name,
    this.email,
  });

  final String id;

  final String name;

  final String? email;

  static const empty = User(id: '', name: '');

  bool get isEmpty => this == User.empty;

  @override
  List<Object?> get props => [id, name, email];
}
