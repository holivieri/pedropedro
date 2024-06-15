import 'package:http/http.dart';
import 'package:mockito/annotations.dart';
import 'package:template_app/src/services/notifications_service.dart';
import 'package:template_app/src/services/social_signin_service.dart';
import 'package:template_app/src/services/user_service.dart';

@GenerateNiceMocks(
  [
    MockSpec<Client>(),
    MockSpec<NotificationsService>(),
    MockSpec<SocialSignInService>(),
    MockSpec<UserService>(),
  ],
)
export 'mocks.mocks.dart';

// run: flutter pub run build_runner build

