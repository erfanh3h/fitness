class WorkoutDetailsModel {
  final String? id, userid, time, name, day;
  final DateTime? date;

  WorkoutDetailsModel(
      {this.id, this.userid, this.time, this.name, this.day, this.date});

  // in firebase id wont come from data and we most pass it seperatly
  factory WorkoutDetailsModel.fromJson(Map data, String id) {
    return WorkoutDetailsModel(
      id: id,
      day: data['day'],
      userid: data['userid'],
      time: data['time'],
      name: data['name'],
      date: data['date'].toDate(),
    );
  }

  Map<String, dynamic> toJson() => {
        'userid': userid,
        'time': time,
        'name': name,
        'day': day,
        'date': DateTime.now(),
      };
}
