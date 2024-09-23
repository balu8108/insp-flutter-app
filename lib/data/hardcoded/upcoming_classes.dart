class ClassCategory {
  int id;
  String category;
  String label;

  ClassCategory(
      {required this.id, required this.category, required this.label});
}

List<ClassCategory> classCategories = [
  ClassCategory(id: 1, category: 'Ongoing', label: 'Ongoing'),
  ClassCategory(id: 2, category: 'Today', label: 'Scheduled for today'),
  ClassCategory(id: 3, category: 'Week', label: 'Scheduled for week'),
  ClassCategory(id: 4, category: 'Completed', label: 'Completed'),
];
