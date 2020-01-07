class Post {
  
  int _userId;
  int _id;
  String _title;
  String _body;
  
  Post(this._userId, this._id, this._body, this._title);

  Map toJson() {
    return {
      "userId": this._userId,
      "id": this._id,
      "title": this._title,
      "body": this._body};
  }

  int get userId => _userId;

  set userId(int value) => _userId = value;

  int get id => _id;

  set id(int value) => _id = value;

  String get title => _title;

  set title(String value) => _title = value;

  String get body => _body;

  set body(String value) => _body = value;

}
