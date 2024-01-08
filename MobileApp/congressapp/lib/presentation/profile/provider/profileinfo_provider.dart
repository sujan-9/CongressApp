import 'package:congressapp/data/models/usermodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileinfoProvider =
    StateNotifierProvider<ProfileInfoNotifier, UserModel>((ref) {
  return ProfileInfoNotifier();
});

class ProfileInfoNotifier extends StateNotifier<UserModel> {
  ProfileInfoNotifier()
      : super(UserModel(
            name: 'abishek',
            address: 'Pokhara',
            phone: 987654321,
            email: 'abushek@gmail.com',
            post: 'Engineer'));

  void updateProfile(UserModel? updatedProfile) {
    state = state.copyWith(
      name: updatedProfile!.name,
      address: updatedProfile.address,
      phone: updatedProfile.phone,
      email: updatedProfile.email,
      post: updatedProfile.post,
    );
  }
}
