import 'package:const_date_time/const_date_time.dart';
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String email;
  final String name;
  final String? avatarUrl;
  final DateTime createdAt;
  final DateTime lastLoginAt;

  const User({
    required this.id,
    required this.email,
    required this.name,
    this.avatarUrl,
    required this.createdAt,
    required this.lastLoginAt,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'email': email,
    'name': name,
    'photoUrl': avatarUrl,
    'createdAt': createdAt.toIso8601String(),
    'lastLoginAt': lastLoginAt.toIso8601String(),
  };

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'],
    email: json['email'],
    name: json['name'],
    avatarUrl: json['photoUrl'],
    createdAt: DateTime.parse(json['createdAt']),
    lastLoginAt: DateTime.parse(json['lastLoginAt']),
  );

  User copyWith({
    String? id,
    String? email,
    String? name,
    String? avatarUrl,
    String? photoUrl,
    DateTime? createdAt,
    DateTime? lastLoginAt,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      avatarUrl: photoUrl ?? this.avatarUrl,
      createdAt: createdAt ?? this.createdAt,
      lastLoginAt: lastLoginAt ?? this.lastLoginAt,
    );
  }

  static const User empty = User(
    id: '',
    email: '',
    name: '',
    avatarUrl: '',
    createdAt: ConstDateTime(DateTime.january, 1, 2000),
    lastLoginAt: ConstDateTime(DateTime.january, 1, 2000),
  );

  @override
  List<Object?> get props => [id, email, name];
}