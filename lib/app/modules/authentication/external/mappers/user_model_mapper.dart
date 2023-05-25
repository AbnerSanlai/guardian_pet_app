import 'package:firebase_auth/firebase_auth.dart';

import '../../infra/models/user_model.dart';

class UserModelMapper {
  UserModel fromMap({required UserCredential userCredential}) {
    return UserModel(
      id: userCredential.user!.uid,
      name: userCredential.user!.displayName!,
      email: userCredential.user!.email!,
      photoUrl: userCredential.user!.photoURL!,
    );
  }
}
