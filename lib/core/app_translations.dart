import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          AppString.loginButtonText: 'Login with Google',
          AppString.loginTitleCenter: 'Organize your slips in one place',
          AppString.hello: 'Hello, ',
          AppString.accountUpTodate: 'Keep your accounts up to date',
          AppString.myTickets: 'My Tickets',
          AppString.inTotal: 'in total',
          AppString.willExpire: 'Will expire in',
        },
        'pt_BR': {
          AppString.loginButtonText: 'Entrar com Google',
          AppString.loginTitleCenter: 'Organize seus boletos em um só lugar',
          AppString.hello: 'Olá, ',
          AppString.accountUpTodate: 'Mantenha suas contas em dia',
          AppString.myTickets: 'Meus Boletos',
          AppString.inTotal: 'ao total',
          AppString.willExpire: 'Vence em',
        },
      };
}

class AppString {
  static const loginButtonText = 'loginButtonText';
  static const loginTitleCenter = 'loginTitleCenter';
  static const hello = 'hello';
  static const accountUpTodate = 'accountUpTodate';
  static const myTickets = 'myTickets';
  static const inTotal = 'inTotal';
  static const willExpire = 'willExpire';
}
