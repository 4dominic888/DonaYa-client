sealed class Result<T, E> {
  const Result();
  
  bool get isOk => this is Ok<T, E>;
  bool get isErr => this is Err<T, E>;

  T unwrap() {
    switch (this) {
      case Ok(:final value):
        return value;
      case Err(:final error):
        throw ResultUnwrapException(error.toString());
    }
  }

  E unwrapErr() {
    switch (this) {
      case Err(:final error):
        return error;
      case Ok(:final value):
        throw ResultUnwrapException('Tried to unwrapErr() but was Ok: $value');
    }
  }
}

class Ok<T, E> extends Result<T, E> {
  final T value;
  const Ok(this.value);
}

class Err<T, E> extends Result<T, E> {
  final E error;
  const Err(this.error);
}

typedef VoidResult = Result<void, String>;

class ResultUnwrapException implements Exception {
  final Object message;
  ResultUnwrapException(this.message);

  @override
  String toString() => 'ResultUnwrapException: $message';
}