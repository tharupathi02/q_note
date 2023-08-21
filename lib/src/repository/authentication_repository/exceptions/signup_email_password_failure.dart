class SignUpWithEmailAndPasswordFailure {
  final String message;

  /// This is the constructor of the class SignUpWithEmailAndPasswordFailure
  /// [this.message = 'An Unknown Error Occurred.'] means that if the message is not provided then the default message will be 'An Unknown Error Occurred.'

  SignUpWithEmailAndPasswordFailure([this.message = 'An Unknown Error Occurred.']);

  /// This method will be used to display the error message to the user
  /// factory means that this method will return an object of the class SignUpWithEmailAndPasswordFailure
  /// SignUpWithEmailAndPasswordFailure.code(String code) means that this method will take a String as an argument and return an object of the class SignUpWithEmailAndPasswordFailure

  factory SignUpWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return SignUpWithEmailAndPasswordFailure('Please enter a stronger password.');
      case 'invalid-email':
        return SignUpWithEmailAndPasswordFailure('The email address is badly formatted.');
      case 'email-already-in-use':
        return SignUpWithEmailAndPasswordFailure('The email address is already in use by another account.');
      case 'operation-not-allowed':
        return SignUpWithEmailAndPasswordFailure('This operation is not allowed.');
      case 'user-disabled':
        return SignUpWithEmailAndPasswordFailure('TThe User has been disabled. Please contact support.');
      default:
        return SignUpWithEmailAndPasswordFailure();
    }
  }
}
