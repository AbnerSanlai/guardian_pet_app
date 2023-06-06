import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int? id;
  final String? userName;
  final String? fistName;
  final String? lastName;
  final String? email;
  final String? celPhone;
  final String? phone;

  const UserEntity({
    this.id,
    this.userName,
    this.fistName,
    this.lastName,
    this.email,
    this.celPhone,
    this.phone,
  });

  @override
  List<Object?> get props => [
        id,
        userName,
        fistName,
        lastName,
        email,
        celPhone,
        phone,
      ];
}
