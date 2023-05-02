class TicketModel {
  String? startStation;
  String? endStation;
  String? startDate;
  String? ticketPrice;


  TicketModel({this.startStation, this.endStation, this.startDate, this.ticketPrice
  });


  TicketModel.fromJson(Map<String, dynamic> json)
      : this(
    startStation: json['startStation'],
    endStation: json['endStation'],
    startDate: json['startDate'],
    ticketPrice: json['ticketPrice'],

  );

  Map<String, dynamic> toJson() {
    return {
      'startStation': startStation,
      'endStation': endStation,
      'startDate': startDate,
      'ticketPrice': ticketPrice,

    };
  }
}
