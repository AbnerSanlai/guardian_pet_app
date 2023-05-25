import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../infra/datasources/authentication_google_datasource.dart';
import '../../infra/models/user_model.dart';
import '../mappers/user_model_mapper.dart';

class AuthenticationGoogleDatasourceImpl
    extends AuthenticationGoogleDatasource {
  final UserModelMapper _userModelMapper;

  AuthenticationGoogleDatasourceImpl({
    required UserModelMapper userModelMapper,
  }) : _userModelMapper = userModelMapper;

  @override
  Future<UserModel> call() async {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final UserCredential userCredential =
        await firebaseAuth.signInWithCredential(credential);

    return _userModelMapper.fromMap(
      userCredential: userCredential,
    );
  }
}
