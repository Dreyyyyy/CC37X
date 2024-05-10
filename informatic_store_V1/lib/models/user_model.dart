class UserModel {
  final String? firstName;
  final String? lastName;
  final String email;
  final String password;

  UserModel({
    this.firstName,
    this.lastName,
    required this.email,
    required this.password,
  });

  // Copia o método constructor acima
  UserModel copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? password,
  }) {
    return UserModel(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
