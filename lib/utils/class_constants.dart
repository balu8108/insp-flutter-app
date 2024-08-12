enum ClassType {
  ALL("ALL"),
  REGULAR_CLASS("REGULARCLASS"),
  CRASH_CLASS("CRASHCOURSE");

  const ClassType(this.value);
  final String value;
}

enum ClassLevel {
  ALL("ALL"),
  Class_11("Class 11"),
  Class_12("Class 12"),
  Foundation_Olympiad("Foundation Olympiad(9-10)");

  const ClassLevel(this.value);
  final String value;

  static String getValueFromName(String name) {
    final lowerCaseName = name.toLowerCase();
    if (lowerCaseName == ClassLevel.ALL.name.toLowerCase()) {
      return ClassLevel.ALL.value;
    } else if (lowerCaseName == ClassLevel.Class_11.name.toLowerCase()) {
      return ClassLevel.Class_11.value;
    } else if (lowerCaseName == ClassLevel.Class_12.name.toLowerCase()) {
      return ClassLevel.Class_12.value;
    } else if (lowerCaseName ==
        ClassLevel.Foundation_Olympiad.name.toLowerCase()) {
      return ClassLevel.Foundation_Olympiad.value;
    }

    return '';
  }
}