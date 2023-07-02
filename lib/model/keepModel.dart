class keepModel {
  String? id;
  String? text;

  keepModel({required this.id, required this.text});

  static List<keepModel> keepList() {
    return [
      keepModel(id: "01", text: "Keep 01"),
      keepModel(id: "02", text: "Keep 02"),
      keepModel(id: "03", text: "Keep 03"),
      keepModel(id: "04", text: "Keep 04"),
      keepModel(id: "05", text: "Keep 05"),
    ];
  }
}
