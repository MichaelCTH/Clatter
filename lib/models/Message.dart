class Message {
  final String user;
  final String message;
  final String createdTime;
  final String imageUrl;

  Message(this.user, this.message, this.createdTime, this.imageUrl);

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      json['name'] as String,
      json['message'] as String,
      json['createdTime'] as String,
      json['imageUrl'] as String,
    );
  }
}
