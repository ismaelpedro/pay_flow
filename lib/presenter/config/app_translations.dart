import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        AppTranslationStrings.englishLanguage: {
          AppTranslationStrings.ptBr: 'Portuguese',
          AppTranslationStrings.enUS: 'English',
          AppTranslationStrings.esES: 'Spanish',
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
        },
        AppTranslationStrings.portugueseLanguage: {
          AppTranslationStrings.ptBr: 'Português',
          AppTranslationStrings.enUS: 'Inglês',
          AppTranslationStrings.esES: 'Espanhol',
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
        },
        AppTranslationStrings.spanishLanguage: {
          AppTranslationStrings.ptBr: 'Portugués',
          AppTranslationStrings.enUS: 'Inglés',
          AppTranslationStrings.esES: 'Español',
          AppTranslationStrings.youHave: 'Tú tienes ',
          AppTranslationStrings.registrationsToPay: 'inscripciones a pagar',
          AppTranslationStrings.loginButtonText: 'Iniciar sesión con Google',
          AppTranslationStrings.loginTitleCenter:
              'Organice sus resguardos en un solo lugar',
          AppTranslationStrings.hello: 'Hola, ',
          AppTranslationStrings.accountUpTodate:
              'Mantenga sus cuentas actualizadas',
          AppTranslationStrings.myTickets: 'Mis Resbalones',
          AppTranslationStrings.inTotal: 'en total',
          AppTranslationStrings.willExpire: 'Expira en',
          AppTranslationStrings.tickets: 'resbalones',
        },
      };
}

class AppTranslationStrings {
  static const portugueseLanguage = 'pt_BR';
  static const englishLanguage = 'en_US';
  static const spanishLanguage = 'es_ES';
  static const ptBr = 'pt';
  static const enUS = 'en';
  static const esES = 'es';
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
}
