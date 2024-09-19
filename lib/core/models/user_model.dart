import 'dart:convert';

class UserModel {
  final String id;
  final String username;
  final String email;
  final String password;
  final String email_verified_at;
  final bool is_premium;
  final int max_links;
  final String created_at;
  final String updated_at;

  UserModel({
    required this.username,
    required this.email,
    required this.id,
    required this.password,
    required this.email_verified_at,
    required this.is_premium,
    required this.max_links,
    required this.created_at,
    required this.updated_at,
  });

  UserModel copyWith({
    String? username,
    String? email,
    String? id,
    String? token,
    String? password,
    String? email_verified_at,
    bool? is_premium,
    int? max_links,
    String? created_at,
    String? updated_at,
  }) {
    return UserModel(
      username: username ?? this.username,
      email: email ?? this.email,
      id: id ?? this.id,
      password: password ?? this.password,
      email_verified_at: email_verified_at ?? this.email_verified_at,
      is_premium: is_premium ?? this.is_premium,
      max_links: max_links ?? this.max_links,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'email': email,
      'id': id,
      'password': password,
      'email_verified_at': email_verified_at,
      'is_premium': is_premium,
      'max_links': max_links,
      'created_at': created_at,
      'updated_at': updated_at,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      username: map['username'] as String,
      email: map['email'] as String,
      id: map['id'] as String,
      password: map['password'] as String,
      email_verified_at: map['email_verified_at'] as String,
      is_premium: map['is_premium'] as bool,
      max_links: map['max_links'] as int,
      created_at: map['created_at'] as String,
      updated_at: map['updated_at'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(username: $username, email: $email, id: $id, password: $password, email_verified_at: $email_verified_at, is_premium: $is_premium, max_links: $max_links, created_at: $created_at, updated_at: $updated_at)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.username == username &&
        other.email == email &&
        other.id == id &&
        other.password == password &&
        other.email_verified_at == email_verified_at &&
        other.is_premium == is_premium &&
        other.max_links == max_links &&
        other.created_at == created_at &&
        other.updated_at == updated_at;
  }

  @override
  int get hashCode {
    return username.hashCode ^
        email.hashCode ^
        id.hashCode ^
        password.hashCode ^
        email_verified_at.hashCode ^
        is_premium.hashCode ^
        max_links.hashCode ^
        created_at.hashCode ^
        updated_at.hashCode;
  }
}
