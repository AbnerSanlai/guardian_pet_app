class EnvironmentVariables {
  static String get appPetUrlBase {
    return const String.fromEnvironment(
      'APP_PET_URL_BASE',
      defaultValue: 'http://192.168.88.253:8000/',
    );
  }
}
