class Event {
  String id;
  String title;
  String role;
  String description;
  String color;
  DateTime dateStart;
  DateTime dateEnd;
  String location;
  String mode;
  String socials;
  String email;
  String phoneCode;
  String phone;
  String registration;
  String mapLocation;
  double mapLat;
  double mapLng;

  // Optional properties
  String? logo;
  String? privateMode;
  String? type;
  String? theme;
  int? maxParticipants;
  String? target;
  String? accessibility;
  String? sponsors;
  String? parking;
  String? lodging;
  String? mapUrl;
  String? pictures;
  String? programFiles;
  String? organizers;
  String? speakers;
  String? createdBy;
  Map<String, dynamic>? user;
  int? visibility;
  int? status;
  String? message;
  DateTime? dateCreated;
  DateTime? dateModified;
  int? __v;
  String? motif;

  Event({
    required this.id,
    required this.title,
    required this.role,
    required this.description,
    required this.color,
    required this.dateStart,
    required this.dateEnd,
    required this.location,
    required this.mode,
    required this.socials,
    required this.email,
    required this.phoneCode,
    required this.phone,
    required this.registration,
    required this.mapLocation,
    required this.mapLat,
    required this.mapLng,
    this.logo,
    this.privateMode,
    this.type,
    this.theme,
    this.maxParticipants,
    this.target,
    this.accessibility,
    this.sponsors,
    this.parking,
    this.lodging,
    this.mapUrl,
    this.pictures,
    this.programFiles,
    this.organizers,
    this.speakers,
    this.createdBy,
    this.user,
    this.visibility,
    this.status,
    this.message,
    this.dateCreated,
    this.dateModified,
    this.motif,
  });
  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['_id'],
      title: json['title'],
      role: json['role'],
      logo: json['logo'],
      description: json['description'],
      color: json['color'],
      dateStart: DateTime.parse(json['date_start']),
      dateEnd: DateTime.parse(json['date_end']),
      location: json['location'],
      mode: json['mode'],
      theme: json['theme'],
      type: json['type'],
      target: json['target'],
      socials: json['socials'],
      email: json['email'],
      phoneCode: json['phone_code'],
      phone: json['phone'],
      registration: json['registration'],
      mapLocation: json['map_location'],
      mapLat: json['map_lat'].toDouble(),
      mapLng: json['map_lng'].toDouble(),
    );
  }
}
