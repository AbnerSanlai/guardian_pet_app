import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String name;
  final String email;
  final String photoUrl;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.photoUrl,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        photoUrl,
      ];
}
