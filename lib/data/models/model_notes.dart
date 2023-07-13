// ignore_for_file: public_member_api_docs, sort_constructors_first
class Note {
  int? id;
  String title;
  String describe;
  String? date;
  Note({
    this.id,
    required this.title,
    required this.describe,
    this.date,
  });

  factory Note.fromJson(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      title: map['Title'],
      describe: map['Describe'],
      date: map['Date'],
    );
  }
}
