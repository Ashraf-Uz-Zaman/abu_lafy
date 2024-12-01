// to convert the response into non nullable object (model)

//
import 'package:abu_lafy/application/extensions.dart';
import 'package:abu_lafy/data/responses/base/base_response.dart';
import 'package:abu_lafy/data/responses/common/common_response.dart';
import 'package:abu_lafy/data/responses/home/home_response.dart';
import 'package:abu_lafy/data/responses/user/user_details_response.dart';
import 'package:abu_lafy/domain/model/base_model.dart';
import 'package:abu_lafy/domain/model/post_model.dart';
import 'package:abu_lafy/domain/model/user_model.dart';

const EMPTY = "";
const ZERO = 0;

extension CommonResponseMapper on CommonResponse? {
  BaseModel toDomain(){
    return BaseModel(
        this?.status.orZero() ?? ZERO,
        this?.message.orEmpty() ?? EMPTY,
        );
  }
}

extension UserResponseMapper on UserDetailsResponse? {
  UserDetailsModel toDomain() {
    return UserDetailsModel(
      this?.name.orEmpty() ?? EMPTY,
      this?.phone.orEmpty() ?? EMPTY,
      this?.emergencyContract.orEmpty() ?? EMPTY,
      this?.dob.orEmpty() ?? EMPTY ,
      this?.address.orEmpty() ?? EMPTY,
      this?.latitude.orZeroDouble() ,
      this?.longitude.orZeroDouble() ,
      this?.country.orEmpty() ?? EMPTY,
      this?.userType.orZero() ,
      this?.profilePictureURL.orEmpty()?? EMPTY,
      this?.isActive.orEmpty()?? EMPTY,

    );
  }
}

extension PostResponseMapper on PostResponse? {
  PostModel toDomain() {
    return PostModel(
      this?.Id.orZero() ?? ZERO,
      this?.Poster_Name.orEmpty() ?? EMPTY,
      this?.Poster_Image.orEmpty() ?? EMPTY,
      this?.Content.orEmpty() ?? EMPTY ,
      this?.Like.orEmpty() ?? EMPTY,
      this?.Dislike.orEmpty() ?? EMPTY,
      this?.Post_Time_Stamp.orEmpty() ?? EMPTY ,
    );
  }
}


// extension RegistrationResponseMapper on RegistrationResponse? {
//   UserDetailsModel toDomain() {
//     return UserDetailsModel(
//       this?.id?.orZero(),
//       this?.name?.orEmpty(),
//       this?.email?.orEmpty(),
//       this?.password?.orEmpty(),
//       this?.mobile?.orEmpty(),
//       this?.dob.orEmpty(),
//       this?.picture?.orEmpty(),
//       this?.level?.orZero(),
//       this?.is_approved?.orEmptyBool(),
//       this?.active_status?.orZero(),
//       this?.league_status?.orZero(),
//       this?.role?.orZero(),
//       this?.user_positions?.orZero(),
//       this?.rate?.orZeroDouble(),
//       this?.about?.orEmpty(),
//       this?.device_imei?.orEmpty(),
//       this?.device_type?.orEmpty(),
//     );
//   }
// }

// extension ForgetPasswordResponseMapper on ForgetPasswordResponse? {
//   ForgetPasswordModel toDomain() {
//     return ForgetPasswordModel(
//       this?.otp.orEmpty(),
//     );
//   }
// }
//
// extension EventResponseMapper on EventResponse {
//   EventModel toDomain() {
//     return EventModel(
//         id?.orZero(),
//         name?.orEmpty(),
//         description?.orEmpty(),
//         icon?.orEmpty(),
//         banner?.orEmpty(),
//         note?.orEmpty(),
//         quotes?.orEmpty(),
//         locationTitle?.orEmpty(),
//         location?.orEmpty(),
//         latitude?.orZeroDouble(),
//         longitude?.orZeroDouble(),
//         timeBegin?.orEmpty(),
//         timeEnd?.orEmpty(),
//         dateStart?.orEmpty(),
//         dateEnd?.orEmpty(),
//         isActive?.orEmptyBool());
//   }
// }
//
// extension HomeResponseMapper on HomeResponse {
//   HomeModel toDomain() {
//     return HomeModel(
//       id.orZero(),
//       users.toDomain(),
//       content.orEmpty(),
//       image.orEmpty(),
//       created_at.orEmpty(),
//       (reactList.map((e) => e.toDomain()) ?? []).cast<ReactModel>().toList(),
//
//
//     );
//   }
// }
//
// extension ReactResponseMapper on ReactResponse {
//   ReactModel toDomain() {
//     return ReactModel(
//         id?.orZero(),
//         user_id.orZero(),
//         post_id.orZero(),
//         react_type.orZero(),
//     );
//   }
// }
//
// extension UserResponseMapper on UserDetailsResponse {
//   UserDetailsModel toDomain() {
//     return UserDetailsModel(
//       id.orZero(),
//       name.orEmpty(),
//       email.orEmpty(),
//       password.orEmpty(),
//       mobile.orEmpty(),
//       dob.orEmpty(),
//       picture.orEmpty(),
//       level.orZero(),
//       is_approved.orEmptyBool(),
//       active_status.orZero(),
//       league_status.orZero(),
//       role.orZero(),
//       user_positions.orZero(),
//       rate.orZeroDouble(),
//       about.orEmpty(),
//       device_imei.orEmpty(),
//       device_type.orEmpty(),
//     );
//   }
// }
