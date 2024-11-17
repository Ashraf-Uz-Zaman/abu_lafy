class UserDetailsModel{

  String? name;
  String? phone;
  String? emergencyContract;
  String? dob;
  String? address;
  double? latitude;
  double? longitude;
  String? country;
  int? userType;
  String? profilePictureURL;
  String? isActive;


  UserDetailsModel(
      this.name,
      this.phone,
      this.emergencyContract,
      this.dob,
      this.address,
      this.latitude,
      this.longitude,
      this.country,
      this.userType,
      this.profilePictureURL,
      this.isActive);

}