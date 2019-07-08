class Properties {
  final bool deleted;
  final String from;
  final String to;
  final String date;
  final String createdAt;
  final String updatedAt;
  final int id;
  Properties(
      {this.deleted,
      this.from,
      this.to,
      this.date,
      this.createdAt,
      this.updatedAt,
      this.id});

  factory Properties.fromJson(Map<String, dynamic> json) {
    return new Properties(
        deleted: json['deleted'],
        from: json['from'],
        to: json['to'],
        date: json['date'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
        id: json['id']);
  }
}
