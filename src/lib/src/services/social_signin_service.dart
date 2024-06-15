import 'dart:convert';

import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart';

import '../errors/login_error.dart';
import '../models/login_response_model.dart';
import '../models/user_preferences.dart';
import '../utils/http.dart';
import 'user_service.dart';

class SocialSignInService {
  void test() {}
  static final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email'],
  );

  static Future<String> getFacebookToken() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();

      if (result.status == LoginStatus.success) {
        // you are logged
        final AccessToken accessToken = result.accessToken!;
        //debugPrint('=============== FACEBOOK ================');
        //debugPrint(accessToken.token);
        //debugPrint('=========================================');

        return accessToken.token;
      } else {
        return 'error';
      }
    } on Exception catch (err) {
      //debugPrint(err);
      return err.toString();
    }
  }

  static Future<dynamic> signInWithFacebook(String token) async {
    final String platform = UserPreferences().platform;
    final String deviceToken = UserPreferences().deviceToken;

    final apiResponse = await Client().post(
      Uri.parse(
          '$apiUrl/Authenticate/auth/facebook?facebookTokenId=$token&platform=$platform&deviceToken=$deviceToken'),
      headers: returnHttpHeaders(),
    );

    if (apiResponse.statusCode == 200) {
      final LoginResponse user = LoginResponse.fromJson(
        json.decode(
          apiResponse.body,
        ),
      );
      UserService(Client()).saveUserProfileToLocal(user.userProfile);
      return user;
    }
    return LoginError(
      code: apiResponse.statusCode.toString(),
      description: apiResponse.body,
    );
  }

  static Future<String> getGoogleToken() async {
    final account = await _googleSignIn.signIn();
    //debugPrint('======== Google Token ========');
    //debugPrint(account);

    final googleKey = await account!.authentication;

    //print('GOOGLE ID TOKEN: ${googleKey.idToken}');
    return googleKey.idToken!;
  }

  static Future<dynamic> signInWithGoogle(String googleToken) async {
    final String platform = UserPreferences().platform;
    final String deviceToken = UserPreferences().deviceToken;

    try {
      final apiResponse = await Client().post(
        Uri.parse(
            '$apiUrl/Authenticate/auth/google?googleTokenId=$googleToken&platform=$platform&deviceToken=$deviceToken'),
        headers: returnHttpHeaders(),
      );

      if (apiResponse.statusCode == 500) {
        return LoginError(
            code: '500', description: 'Internal server error. Try again later');
      }
      if (apiResponse.statusCode == 400) {
        return LoginError(
            code: '400', description: 'Invalid username or password');
      }
      final LoginResponse user = LoginResponse.fromJson(
        json.decode(
          apiResponse.body,
        ),
      );
      UserService(Client()).saveUserProfileToLocal(user.userProfile);
      return user;
    } on Exception {
      return null;
    }
  }

  static Future googleSignOut() async {
    await _googleSignIn.signOut();
  }
}
