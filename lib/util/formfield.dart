class Category {
  final int id;
  final String name;
  final String nameid;

  Category({
    this.id,
    this.name,
    this.nameid
  });
}
List<Category> _categories = [
  Category(id: 1, name: "Beaches and Islands",nameid: "Beaches%20and%20Islands"),
  Category(id: 2, name: "Buddhism",nameid: "Buddhism"),
  Category(id: 3, name: "Forts and Palaces",nameid: "Fort%20and%20Palaces"),
  Category(id: 4, name: "History and Architecture",nameid: "History%20and%20Architecture"),
  Category(id: 5, name: "Mughal",nameid: "Mughal"),
  Category(id: 6, name: "Museums and Art Galleries",nameid: "Museums%20and%20Art%20Galleries"),
  Category(id: 7, name: "Nature",nameid: "Nature"),
  Category(id: 8, name: "Parks and Gardens",nameid: "Parks%20and%20Gardens"),
  Category(id: 9, name: "Religious",nameid: "Religious"),
  Category(id: 10, name: "Sports",nameid: "Sports"),
  Category(id: 11, name: "Temples",nameid: "Temples"),
  Category(id: 12, name: "WildLife Sanctuaries",nameid: "Wildlife%20Sanctuaries"),
  Category(id: 13, name: "Entertainment",nameid: "Entertainment"),
  Category(id: 14, name: "Monuments",nameid: "Monuments"),
  Category(id: 15, name: "Heritage",nameid: "Heritage"),
  Category(id: 16, name: "History and Architecture",nameid: "History%20and%20Architecture"),
  // Category(id: 15, name: "Heritage",nameid: "Heritage"),
  // Category(id: 15, name: "Heritage",nameid: "Heritage"),
  // Category(id: 15, name: "Heritage",nameid: "Heritage"),
  // Category(id: 15, name: "Heritage",nameid: "Heritage"),
  // Category(id: 15, name: "Heritage",nameid: "Heritage"),
  // Category(id: 15, name: "Heritage",nameid: "Heritage"),
  //
];
setter() {
  List<Category> _set=_categories;
  return _set;
}