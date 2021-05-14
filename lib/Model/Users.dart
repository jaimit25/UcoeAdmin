class Users {
  String name;
  String email;
  String uid;

  Users({
    String name = '',
    String email = '',
    String uid = '',
  }) {
    this.name = name;
    this.email = email;
    this.uid = uid;
  }

  Users.fromJson(Map<String, dynamic> jsonMap, String documentId) {
    name = jsonMap['name'];
    email = jsonMap['email'];
    uid = jsonMap['uid'];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': this.name,
      'email': this.email,
      'uid': this.uid,
    };
  }
}
