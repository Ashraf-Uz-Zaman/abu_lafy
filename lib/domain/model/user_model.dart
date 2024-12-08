class UserModel{

  int? id = 0;
  String? name  = '';
  String? phone  ='';
  String? password = '';
  String? emergencyContract;
  String? dob = '';
  String? about = '';
  String? address = '';
  String? latitude = '';
  String? longitude = '';
  String? country = '';
  String? image = '';
  int? userTypeId = 0;
  String? userTypeLabel = '';
  String? leagueLabel = '';
  String? leagueImage = '';
  String? leagueDesc = '';
  String? createdAt = '';
  String? updatedAt = '';
  String? isActive = '';


  UserModel({
      this.id,
        this.name,
        this.phone,
        this.password,
        this.emergencyContract,
        this.dob,
        this.about,
        this.address,
        this.latitude,
        this.longitude,
        this.country,
        this.image,
        this.userTypeId,
        this.userTypeLabel,
        this.leagueLabel,
        this.leagueImage,
        this.leagueDesc,
        this.createdAt,
        this.updatedAt,
        this.isActive});



  UserModel.fromJson(Map<String, dynamic> json)
      : id = json['id'].toInt(),
        name = json['name'],
        phone = json['phone'],
        password = json['password'],
        emergencyContract = json['emergencyContract'],
        dob = json['dob'],
        about = json['about'],
        address = json['address'],
        latitude = json['latitude'],
        longitude = json['longitude'],
        country = json['country'],
        image = json['image'],
        userTypeId = json['userTypeId'].toInt(),
        userTypeLabel = json['userTypeLabel'],
        leagueLabel = json['leagueLabel'],
        leagueImage = json['leagueImage'],
        leagueDesc = json['leagueDesc'],
        createdAt = json['createdAt'],
        updatedAt = json['updatedAt'],
        isActive = json['isActive'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'password': password,
      'emergencyContract': emergencyContract,
      'dob': dob,
      'about': about,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
      'country': country,
      'image': image,
      'userTypeId': userTypeId,
      'userTypeLabel': userTypeLabel,
      'leagueLabel': leagueLabel,
      'leagueImage': leagueImage,
      'leagueDesc': leagueDesc,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'isActive': isActive,
    };
  }


}