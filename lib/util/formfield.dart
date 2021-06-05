class Category {
  final int id;
  final String name;

  Category({
    this.id,
    this.name,
  });
}
List<Category> _categories = [
  Category(id: 1, name: "Beaches and Islands"),
  Category(id: 2, name: "Buddhism"),
  Category(id: 3, name: "Forts and Palaces"),
  Category(id: 4, name: "History and Architecture"),
  Category(id: 5, name: "Mughal"),
  Category(id: 6, name: "Museum and Art Gallery"),
  Category(id: 7, name: "Nature"),
  Category(id: 8, name: "Parks and Gardens"),
  Category(id: 9, name: "Religious"),
  Category(id: 10, name: "Sports"),
  Category(id: 11, name: "Temples"),
  Category(id: 12, name: "WildLife Sanctuaries"),
  Category(id: 13, name: "Entertainment"),
  Category(id: 14, name: "Monuments"),
  Category(id: 15, name: "Heritage"),
  Category(id: 16, name: "History and Architecutre"),
  // Category(id: 17, name: "Cow"),
  // Category(id: 18, name: "Frog"),
  // Category(id: 19, name: "Blue Jay"),
  // Category(id: 20, name: "Moose"),
  // Category(id: 21, name: "Gecko"),
  // Category(id: 22, name: "Kangaroo"),
  // Category(id: 23, name: "Shark"),
  // Category(id: 24, name: "Crocodile"),
  // Category(id: 25, name: "Owl"),
  // Category(id: 26, name: "Dragonfly"),
  //Category(id: 27, name: "Dolphin"),
  // Category(id: 28, name: "Dolphin"),
  // Category(id: 29, name: "Dolphin"),
  // Category(id: 30, name: "Dolphin"),
];
setter() {
  List<Category> _set=_categories;
  return _set;
}