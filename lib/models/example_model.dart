class Example {
  final int id;
  final String name;

  Example(this.id, this.name);

  String toJson() {
    return '{"id":$id,"name":"$name"}';
  }
}
