// to convert the response into non nullable object (model)

//
import 'package:abu_lafy/application/extensions.dart';
import 'package:abu_lafy/data/responses/base/base_response.dart';
import 'package:abu_lafy/data/responses/common/common_response.dart';
import 'package:abu_lafy/data/responses/home/home_response.dart';
import 'package:abu_lafy/data/responses/player/player_response.dart';
import 'package:abu_lafy/data/responses/user/user_response.dart';
import 'package:abu_lafy/domain/model/base_model.dart';
import 'package:abu_lafy/domain/model/players_model.dart';
import 'package:abu_lafy/domain/model/post_model.dart';
import 'package:abu_lafy/domain/model/user_model.dart';

const EMPTY = "";
const ZERO = 0;

extension CommonResponseMapper on CommonResponse? {
  BaseModel toDomain() {
    return BaseModel(
      this?.status.orZero() ?? ZERO,
      this?.message.orEmpty() ?? EMPTY,
    );
  }
}

extension UserResponseMapper on UserResponse? {
  UserModel toDomain() {
    return UserModel(
        id: this?.id.orZero() ?? ZERO,
        name: this?.name.orEmpty() ?? EMPTY,
        phone: this?.phone.orEmpty() ?? EMPTY,
        password: this?.password.orEmpty() ?? EMPTY,
        emergencyContract: this?.emergencyContract.orEmpty() ?? EMPTY,
        dob: this?.dob.orEmpty() ?? EMPTY,
        about: this?.about.orEmpty() ?? EMPTY,
        address: this?.address.orEmpty() ?? EMPTY,
        latitude: this?.latitude.orEmpty() ?? EMPTY,
        longitude: this?.longitude.orEmpty() ?? EMPTY,
        country: this?.country.orEmpty() ?? EMPTY,
        image: this?.image.orEmpty() ?? EMPTY,
        userTypeId: this?.userTypeId.orZero() ?? ZERO,
        userTypeLabel: this?.userTypeLabel.orEmpty() ?? EMPTY,
        leagueLabel: this?.leagueLabel.orEmpty() ?? EMPTY,
        leagueImage: this?.leagueImage.orEmpty() ?? EMPTY,
        leagueDesc: this?.leagueDesc.orEmpty() ?? EMPTY,
        createdAt: this?.createdAt.orEmpty() ?? EMPTY,
        updatedAt: this?.updatedAt.orEmpty() ?? EMPTY,
        isActive: this?.isActive.orEmpty() ?? EMPTY);
  }
}

extension PostResponseMapper on PostResponse? {
  PostModel toDomain() {
    return PostModel(
      this?.Id.orZero() ?? ZERO,
      this?.Poster_Name.orEmpty() ?? EMPTY,
      this?.Poster_Image.orEmpty() ?? EMPTY,
      this?.Content.orEmpty() ?? EMPTY,
      this?.Like.orEmpty() ?? EMPTY,
      this?.Dislike.orEmpty() ?? EMPTY,
      this?.Post_Time_Stamp.orEmpty() ?? EMPTY,
    );
  }
}


extension PlayesResponseMapper on PlayersResponse? {
  PlayersModel toDomain() {
    return PlayersModel(
      this?.id.orZero() ?? ZERO,
      this?.name.orEmpty() ?? EMPTY,
      this?.image.orEmpty() ?? EMPTY,
      this?.phone.orEmpty() ?? EMPTY,
      this?.userType_id.orZero() ?? ZERO,
      this?.userType_label.orEmpty() ?? EMPTY,
      this?.isActive.orEmpty() ?? EMPTY,
      this?.created_at.orEmpty() ?? EMPTY
    );
  }
}
