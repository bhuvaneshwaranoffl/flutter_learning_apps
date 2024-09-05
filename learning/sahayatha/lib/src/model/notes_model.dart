
class Note {
  final String name;
  final String dob;
  final String whatsapp;
  final String guardian;
  final String state;
  final String aadhar;
  final String pastAssistive;
  final String limit;
  final String family;
  final String disabilityStory;
  final String disabilityPercentage;
  final String usage;
  final String pay;
  final String address;
  final String? imagePath;
  final List<String>? pdfPaths;

  Note({
    required this.name,
    required this.dob,
    required this.whatsapp,
    required this.guardian,
    required this.state,
    required this.aadhar,
    required this.pastAssistive,
    required this.limit,
    required this.family,
    required this.disabilityStory,
    required this.disabilityPercentage,
    required this.usage,
    required this.pay,
    required this.address,
    this.imagePath,
    this.pdfPaths,
  });

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      name: json['name'],
      dob: json['dob'],
      whatsapp: json['whatsapp'],
      guardian: json['guardian'],
      state: json['state'],
      aadhar: json['aadhar'],
      pastAssistive: json['pastAssistive'],
      limit: json['limit'],
      family: json['family'],
      disabilityStory: json['disabilityStory'],
      disabilityPercentage: json['disabilityPercentage'],
      usage: json['usage'],
      pay: json['pay'],
      address: json['address'],
      imagePath: json['imagePath'],
      pdfPaths: List<String>.from(json['pdfPaths'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'dob': dob,
      'whatsapp': whatsapp,
      'guardian': guardian,
      'state': state,
      'aadhar': aadhar,
      'pastAssistive': pastAssistive,
      'limit': limit,
      'family': family,
      'disabilityStory': disabilityStory,
      'disabilityPercentage': disabilityPercentage,
      'usage': usage,
      'pay': pay,
      'address': address,
      'imagePath': imagePath,
      'pdfPaths': pdfPaths,
    };
  }
}
