
class Subject {
  String name;
  List<String> prereq;
  List<String> videos;
  List<String> books;
  List<String> websites;

  Subject({this.name, this.prereq, this.videos, this.books, this.websites});
  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(
      name: json['name'] as String,
      prereq: json['prereq'] as List<String>,
      videos: json['videos'] as List<String>,
      books: json['books'] as List<String>,
      websites: json['websites'] as List<String>,
    );
  }
}
