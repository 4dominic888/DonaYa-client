import 'dart:math' as math;

import 'package:dona_ya/core/authentication/abstractions/repositories/token_service.dart';
import 'package:dona_ya/core/shared/utils/app_error.dart';
import 'package:dona_ya/core/shared/utils/result.dart';
import 'package:dona_ya/utils/mock.dart';

class MockTokenService implements TokenService {

  String? _accessToken;
  String? _refreshToken;

  @override
  Future<String?> get accessToken => Future.value(_accessToken);

  @override
  Future<String?> get refreshToken => Future.value(_refreshToken);

  @override
  Future<void> clearTokens() async {
    await MockUtils.fakeDelay();
    _accessToken = null;
    _refreshToken = null;
  }

  @override
  Future<void> refreshAccessToken() async {
    await MockUtils.fakeDelay();
    _refreshToken = '${math.Random().nextInt(1000)}';
  }

  @override
  Future<VoidAppResult> requestToken({required String email, required String password}) async {
    await MockUtils.fakeDelay();
    _accessToken = '${math.Random().nextInt(1000)}';
    _refreshToken = '${math.Random().nextInt(1000)}';
    return Ok(null);
  }

  @override
  Future<VoidAppResult> validateTokens() async {
    await MockUtils.fakeDelay();
    if(_accessToken == null) return Err(AuthenticationError.noTokenFounded);
    if(_refreshToken == null) await refreshAccessToken();
    return Ok(null);
  }

  @override
  Future<VoidAppResult> saveTokens() async {
    await MockUtils.fakeDelay();
    return Ok(null);
  }

}