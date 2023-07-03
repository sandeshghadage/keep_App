class keepModel {
  String? id;
  String? title;
  String? text;

  keepModel({required this.id, required this.title, required this.text});

  static List<keepModel> keepList() {
    return [
      keepModel(id: "01", title: "Title1", text: "Keep 01"),
      keepModel(id: "02", title: "Title2", text: "Keep 02"),
      keepModel(id: "03", title: "Title3", text: "Keep 03"),
      keepModel(id: "04", title: "Title4", text: "Keep 04"),
      keepModel(id: "05", title: "Title5", text: "Keep 05"),
    ];
  }
}
