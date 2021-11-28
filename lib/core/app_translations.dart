import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        AppTranslationStrings.englishLanguage: {
          AppTranslationStrings.loginButtonText: 'Login with Google',
          AppTranslationStrings.loginTitleCenter:
              'Organize your slips in one place',
          AppTranslationStrings.hello: 'Hello, ',
          AppTranslationStrings.accountUpTodate:
              'Keep your accounts up to date',
          AppTranslationStrings.myTickets: 'My Tickets',
          AppTranslationStrings.inTotal: 'in total',
          AppTranslationStrings.willExpire: 'Will expire in',
        },
        AppTranslationStrings.portugueseLanguage: {
          AppTranslationStrings.loginButtonText: 'Entrar com Google',
          AppTranslationStrings.loginTitleCenter:
              'Organize seus boletos em um só lugar',
          AppTranslationStrings.hello: 'Olá, ',
          AppTranslationStrings.accountUpTodate: 'Mantenha suas contas em dia',
          AppTranslationStrings.myTickets: 'Meus Boletos',
          AppTranslationStrings.inTotal: 'ao total',
          AppTranslationStrings.willExpire: 'Vence em',
        },
      };
}

class AppTranslationStrings {
  static const portugueseLanguage = 'pt_BR';
  static const englishLanguage = 'en_US';
  static const loginButtonText = 'loginButtonText';
  static const loginTitleCenter = 'loginTitleCenter';
  static const hello = 'hello';
  static const accountUpTodate = 'accountUpTodate';
  static const myTickets = 'myTickets';
  static const inTotal = 'inTotal';
  static const willExpire = 'willExpire';
}
