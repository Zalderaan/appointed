class User {
  final String id;
  final String name;
  final String email;

  User({
    required this.id,
    required this.name,
    required this.email,
  });

  // factory constructor to create a user object from a map / firestore document
  factory User.fromMap(Map<String, dynamic> data, String documentId) {
    return User(
      id: documentId,
      name:  data['name'],
      email: data['email'],
    );
  }

  // convert to map for uploading to firestore
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
    };
  }
}