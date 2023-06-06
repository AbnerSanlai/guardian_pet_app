import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final int? id;
  final String? password;
  final String? userName;
  final String? fistName;
  final String? lastName;
  final String? email;
  final String? celPhone;
  final String? phone;
  final bool? invalidCredentials;

  const UserModel({
    this.id,
    this.password,
    this.userName,
    this.fistName,
    this.lastName,
    this.email,
    this.celPhone,
    this.phone,
    this.invalidCredentials,
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
        password,
        invalidCredentials,
      ];
}
