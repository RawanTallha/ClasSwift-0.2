class Classroom {
  final int classroomNo;
  final int floor;
  final int capacity;
  final bool isAvailable;
  final bool isALab;

  Classroom({
    required this.classroomNo,
    required this.floor,
    required this.capacity,
    required this.isAvailable,
    required this.isALab,
  });

  factory Classroom.fromJson(Map<String, dynamic> json) {
    return Classroom(
      classroomNo: json['classroomNo'],
      floor: json['floor'],
      capacity: json['capacity'],
      isAvailable: json['isAvailable'],
      isALab: json['isALab'],
    );
  }
}

class Building {
  final int buildingNo;
  final String location;
  final int numOfFloors;
  final int numOfClassrooms;
  final int capacity;
  final bool accessible;
  final List<Classroom> classrooms;

  Building({
    required this.buildingNo,
    required this.location,
    required this.numOfFloors,
    required this.numOfClassrooms,
    required this.capacity,
    required this.accessible,
    required this.classrooms,
  });

  factory Building.fromJson(Map<String, dynamic> json) {
    var list = json['classrooms'] as List;
    List<Classroom> classroomsList =
        list.map((i) => Classroom.fromJson(i)).toList();

    return Building(
      buildingNo: json['buildingNo'],
      location: json['location'],
      numOfFloors: json['numOfFloors'],
      numOfClassrooms: json['numOfClassrooms'],
      capacity: json['capacity'],
      accessible: json['accessible'],
      classrooms: classroomsList,
    );
  }
}
