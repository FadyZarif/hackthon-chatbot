class MessageModel {
  String? senderId;
  String? serviceId;
  String? message;
  String? dateTime;
  bool? isSeen;


  MessageModel({
    this.senderId,
    this.serviceId,
    this.message,
    this.dateTime,
    this.isSeen,
  });

  MessageModel.fromJson(Map<String, dynamic> json) {
    senderId = json['senderId'];
    serviceId = json['serviceId'];
    message = json['message'];
    dateTime = json['dateTime'];
    isSeen = json['isSeen'];
  }

  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'serviceId': serviceId,
      'dateTime': dateTime,
      'message': message,
      'isSeen': isSeen,
    };
  }
}