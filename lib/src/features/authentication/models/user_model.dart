class UserModel {
  final String? id;
  final String emailAddress;
  final String password;

  const UserModel({
    this.id,
    required this.emailAddress,
    required this.password,
  });

  toJson() {
    return {
      'EmailAddress': emailAddress,
      'Password': password,
    };
  }

}
