class PlayersModel{

  int? id;
  String? name;
  String? image;
  String? phone;
  int? userType_id;
  String? userType_label;
  String? isActive;
  String? created_at;



  PlayersModel(
      this.id,
      this.name,
      this.image,
      this.phone,
      this.userType_id,
      this.userType_label,
      this.isActive,
      this.created_at
      );

}