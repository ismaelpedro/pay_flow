import 'package:flutter/material.dart';

import '../../../../core/domain/entities/user_entity.dart';

abstract class ILoginWithGoogleRepository {
  Future<UserEntity?> call(BuildContext context);
}
