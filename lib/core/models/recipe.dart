class Recipe {
  int id;
  String name;
  String user;
  String script;
  String created_at;

  Recipe({this.id, this.name, this.user, this.script, this.created_at});

  Recipe.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    user = json['user'];
    script = json['script'];
    created_at = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['user'] = this.user;
    data['script'] = this.script;
    data['created_at'] = this.created_at;
    return data;
  }
}
