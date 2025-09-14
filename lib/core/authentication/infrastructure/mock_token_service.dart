import 'dart:math' as math;

import 'package:dona_ya/core/authentication/abstractions/repositories/token_service.dart';
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
  Future<Result<void, String>> requestToken({required String email, required String password}) async {
    await MockUtils.fakeDelay();
    if(email != 'test@example.com') return Err('Email not found');
    if(password != 'Asd_#94567') return Err('Invalid password');
    _accessToken = '${math.Random().nextInt(1000)}';
    _refreshToken = '${math.Random().nextInt(1000)}';
    return Ok(null);
  }

  @override
  Future<Result<void, String>> saveTokens() async {
    await MockUtils.fakeDelay();
    return Ok(null);
  }

}