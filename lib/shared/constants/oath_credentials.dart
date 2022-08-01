abstract class OAuthCredentials {
  static const redirectUri = 'com.moj.najiz';
  static const accessToken = 'connect/token';
  static const scope = 'openid profile offline_access';
  static const challengeMethod = 'S256';
  static const responseType = 'code';
  static const userInfoUrl = 'connect/userinfo';
  static const logoutPath = '/Account/Logout';
  static const connectAuthPath = '/connect/authorize';
}
