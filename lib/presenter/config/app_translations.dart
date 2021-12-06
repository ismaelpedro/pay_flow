import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        AppTranslationStrings.englishLanguage: {
          AppTranslationStrings.ptBr: 'Portuguese',
          AppTranslationStrings.enUS: 'English',
          AppTranslationStrings.youHave: 'You have ',
          AppTranslationStrings.registrationsToPay: 'registrations to pay',
          AppTranslationStrings.loginButtonText: 'Login with Google',
          AppTranslationStrings.loginTitleCenter:
              'Organize your bank slips in one place',
          AppTranslationStrings.hello: 'Hello, ',
          AppTranslationStrings.accountUpTodate:
              'Keep your accounts up to date',
          AppTranslationStrings.myTickets: 'My Tickets',
          AppTranslationStrings.inTotal: 'in total',
          AppTranslationStrings.willExpire: 'Will expire in',
          AppTranslationStrings.tickets: 'tickets',
          AppTranslationStrings.money: '\$',
        },
        AppTranslationStrings.portugueseLanguage: {
          AppTranslationStrings.ptBr: 'Português',
          AppTranslationStrings.enUS: 'Inglês',
          AppTranslationStrings.youHave: 'Você tem ',
          AppTranslationStrings.registrationsToPay: 'cadastros para pagar',
          AppTranslationStrings.loginButtonText: 'Entrar com Google',
          AppTranslationStrings.loginTitleCenter:
              'Organize seus boletos em um só lugar',
          AppTranslationStrings.hello: 'Olá, ',
          AppTranslationStrings.accountUpTodate: 'Mantenha suas contas em dia',
          AppTranslationStrings.myTickets: 'Meus Boletos',
          AppTranslationStrings.inTotal: 'ao total',
          AppTranslationStrings.willExpire: 'Vence em',
          AppTranslationStrings.tickets: 'boletos',
          AppTranslationStrings.money: 'R\$',
        },
      };
}

class AppTranslationStrings {
  static const portugueseLanguage = 'pt_BR';
  static const englishLanguage = 'en_US';
  static const ptBr = 'ptBr';
  static const enUS = 'enUS';
  static const loginButtonText = 'loginButtonText';
  static const loginTitleCenter = 'loginTitleCenter';
  static const hello = 'hello';
  static const accountUpTodate = 'accountUpTodate';
  static const myTickets = 'myTickets';
  static const inTotal = 'inTotal';
  static const willExpire = 'willExpire';
  static const youHave = 'youHave';
  static const registrationsToPay = 'registrationsToPay';
  static const tickets = 'tickets';
  static const money = 'money';
}
