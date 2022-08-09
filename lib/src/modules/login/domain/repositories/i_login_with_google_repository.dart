import 'package:flutter/material.dart';

import '../../../core/domain/domain.dart';


abstract class ILoginWithGoogleRepository {
  Future<UserEntity?> call(BuildContext context);
}
