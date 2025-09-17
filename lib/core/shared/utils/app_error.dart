abstract class AppError { String get message; String get details; }

enum NoError implements AppError {
  empty('No error', details: 'This is a empty error');

  @override final String message;
  @override final String details;
  const NoError(this.message, {this.details = ''});
}

enum NetworkError implements AppError {
  noInternet('No internet connection', details: 'Please check your internet connection'),
  rateLimit('Rate limit exceeded', details: 'Please try again later'),
  unknown('Internal server error', details: 'Please wait and try again later'),
  timeout('Request timeout', details: 'Please try again');

  @override final String message;
  @override final String details;
  const NetworkError(this.message, {this.details = ''});
}

enum AuthenticationError implements AppError {
  //* Login Errors
  noEmailFounded('No email founded', details: 'Please check your email and try again'),
  badPassword('The email or password is incorrect', details: 'Please check your email and password and try again'),
  userNotVerified('The user is not verified yet', details: 'Please check your email and password and try again'),
  blocked('The user has been blocked', details: 'Please contact the administrator'),
  
  //* Registration Errors
  emailAlreadyExists('Email already exists', details: 'Please try again with a different email'),
  badRegistrationData('Bad registration data', details: 'Invalid user register, check fields and try again'),

  //* Token Errors
  noTokenFounded('No token founded', details: 'Please try again');

  @override final String message;
  @override final String details;
  const AuthenticationError(this.message, {this.details = ''});
}