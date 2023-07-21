class DrawerModel {
  String title;
  String imagePath;

  DrawerModel({required this.title, this.imagePath = ""});

  @override
  String toString() {
    // TODO: implement toString
    return title.toString();

  }
}

