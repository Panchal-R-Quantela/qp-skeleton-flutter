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

final List<DrawerModel> drawerDefaultList = [
  DrawerModel(title: "Dashboard"),
  DrawerModel(title: "Transaction"),
  DrawerModel(title: "Task"),
  DrawerModel(title: "Documents"),
  DrawerModel(title: "Store"),
  DrawerModel(title: "Notification"),
  DrawerModel(title: "Profile"),
  DrawerModel(title: "Settings"),
];
