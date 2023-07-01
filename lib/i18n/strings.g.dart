/// Generated file. Do not edit.
///
/// Locales: 3
/// Strings: 63 (21 per locale)
///
/// Built on 2023-06-27 at 03:07 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, _StringsEn> {
	en(languageCode: 'en', build: _StringsEn.build),
	enEn(languageCode: 'en', countryCode: 'EN', build: _StringsEnEn.build),
	ptBr(languageCode: 'pt', countryCode: 'BR', build: _StringsPtBr.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, _StringsEn> build;

	/// Gets current instance managed by [LocaleSettings].
	_StringsEn get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
_StringsEn get t => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class Translations {
	Translations._(); // no constructor

	static _StringsEn of(BuildContext context) => InheritedLocaleData.of<AppLocale, _StringsEn>(context).translations;
}

/// The provider for method B
class TranslationProvider extends BaseTranslationProvider<AppLocale, _StringsEn> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, _StringsEn> of(BuildContext context) => InheritedLocaleData.of<AppLocale, _StringsEn>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	_StringsEn get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, _StringsEn> {
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	@Deprecated('Use [AppLocaleUtils.supportedLocales]') static List<Locale> get supportedLocales => instance.supportedLocales;
	@Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]') static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, _StringsEn> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class _StringsEn implements BaseTranslations<AppLocale, _StringsEn> {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsEn.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final _StringsEn _root = this; // ignore: unused_field

	// Translations
	String get loginTitleCenter => 'Organize your bills in one place';
	String get loginButtonText => 'Login with Google';
	String get ptBr => 'Portuguese';
	String get enUS => 'English';
	String get esES => 'Spanish';
	TextSpan hello({required InlineSpan name}) => TextSpan(children: [
		const TextSpan(text: 'Hello, '),
		name,
	]);
	String get accountUpTodate => 'Keep your accounts up to date';
	String registrationsToPay({required num count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(count,
		zero: 'You have no bills to pay! 😵‍💫',
		one: 'You have one bill to pay',
		other: 'You have ${count} bills to pay',
	);
	String get myTickets => 'My bills';
	String willExpire({required Object date}) => 'Will expire in ${date}';
	String get requiredField => 'Required field';
	String get minValue5 => 'Minimum bill amount is é de R\$ 5,00';
	String get billName => 'Bill name';
	String get expiration => 'Expiration';
	String get value => 'Value';
	String get code => 'Code';
	String get cancel => 'Cancel';
	String get register => 'Register';
	String get perfil => 'Perfil';
}

// Path: <root>
class _StringsEnEn implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsEnEn.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.enEn,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en-EN>.
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final _StringsEnEn _root = this; // ignore: unused_field

	// Translations
	@override String get loginTitleCenter => 'Organice sus cuentas en un solo lugar';
	@override String get loginButtonText => 'Inicia sesión con Google';
	@override String get ptBr => 'Portugués';
	@override String get enUS => 'Inglés';
	@override String get esES => 'Español';
	@override TextSpan hello({required InlineSpan name}) => TextSpan(children: [
		const TextSpan(text: 'Hola '),
		name,
	]);
	@override String get accountUpTodate => 'Mantén tus cuentas al día';
	@override String registrationsToPay({required num count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(count,
		zero: '¡No tienes facturas que pagar! 😵‍💫',
		one: 'Tienes una factura que pagar',
		other: 'Tienes ${count} cuentas por pagar',
	);
	@override String get myTickets => 'Mis boletos';
	@override String willExpire({required Object date}) => 'Expira en ${date}';
	@override String get requiredField => 'Campo obligatorio';
	@override String get minValue5 => 'El monto mínimo del boleto es R\$ 5,00';
	@override String get billName => 'Nombre de Boleto';
	@override String get expiration => 'Vencimiento';
	@override String get value => 'Valor';
	@override String get code => 'Código';
	@override String get cancel => 'Cancelar';
	@override String get register => 'Registrar';
	@override String get perfil => 'Perfil';
}

// Path: <root>
class _StringsPtBr implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsPtBr.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.ptBr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <pt-BR>.
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final _StringsPtBr _root = this; // ignore: unused_field

	// Translations
	@override String get loginTitleCenter => 'Organize suas contas em um só lugar';
	@override String get loginButtonText => 'Entrar com Google';
	@override String get ptBr => 'Português';
	@override String get enUS => 'Inglês';
	@override String get esES => 'Espanhol';
	@override TextSpan hello({required InlineSpan name}) => TextSpan(children: [
		const TextSpan(text: 'Olá, '),
		name,
	]);
	@override String get accountUpTodate => 'Mantenha suas contas em dia';
	@override String registrationsToPay({required num count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(count,
		zero: 'Você não tem contas a pagar! 😵‍💫',
		one: 'Você tem uma conta a pagar',
		other: 'Você tem ${count} contas a pagar',
	);
	@override String get myTickets => 'Meus boletos';
	@override String willExpire({required Object date}) => 'Expira em ${date}';
	@override String get requiredField => 'Campo obrigatório';
	@override String get minValue5 => 'Valor mínimo do boleto é de R\$ 5,00';
	@override String get billName => 'Nome do Boleto';
	@override String get expiration => 'Vencimento';
	@override String get value => 'Valor';
	@override String get code => 'Código';
	@override String get cancel => 'Cancelar';
	@override String get register => 'Cadastrar';
	@override String get perfil => 'Perfil';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on _StringsEn {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'loginTitleCenter': return 'Organize your bills in one place';
			case 'loginButtonText': return 'Login with Google';
			case 'ptBr': return 'Portuguese';
			case 'enUS': return 'English';
			case 'esES': return 'Spanish';
			case 'hello': return ({required InlineSpan name}) => TextSpan(children: [
				const TextSpan(text: 'Hello, '),
				name,
			]);
			case 'accountUpTodate': return 'Keep your accounts up to date';
			case 'registrationsToPay': return ({required num count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(count,
				zero: 'You have no bills to pay! 😵‍💫',
				one: 'You have one bill to pay',
				other: 'You have ${count} bills to pay',
			);
			case 'myTickets': return 'My bills';
			case 'willExpire': return ({required Object date}) => 'Will expire in ${date}';
			case 'requiredField': return 'Required field';
			case 'minValue5': return 'Minimum bill amount is é de R\$ 5,00';
			case 'billName': return 'Bill name';
			case 'expiration': return 'Expiration';
			case 'value': return 'Value';
			case 'code': return 'Code';
			case 'cancel': return 'Cancel';
			case 'register': return 'Register';
			case 'perfil': return 'Perfil';
			default: return null;
		}
	}
}

extension on _StringsEnEn {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'loginTitleCenter': return 'Organice sus cuentas en un solo lugar';
			case 'loginButtonText': return 'Inicia sesión con Google';
			case 'ptBr': return 'Portugués';
			case 'enUS': return 'Inglés';
			case 'esES': return 'Español';
			case 'hello': return ({required InlineSpan name}) => TextSpan(children: [
				const TextSpan(text: 'Hola '),
				name,
			]);
			case 'accountUpTodate': return 'Mantén tus cuentas al día';
			case 'registrationsToPay': return ({required num count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(count,
				zero: '¡No tienes facturas que pagar! 😵‍💫',
				one: 'Tienes una factura que pagar',
				other: 'Tienes ${count} cuentas por pagar',
			);
			case 'myTickets': return 'Mis boletos';
			case 'willExpire': return ({required Object date}) => 'Expira en ${date}';
			case 'requiredField': return 'Campo obligatorio';
			case 'minValue5': return 'El monto mínimo del boleto es R\$ 5,00';
			case 'billName': return 'Nombre de Boleto';
			case 'expiration': return 'Vencimiento';
			case 'value': return 'Valor';
			case 'code': return 'Código';
			case 'cancel': return 'Cancelar';
			case 'register': return 'Registrar';
			case 'perfil': return 'Perfil';
			default: return null;
		}
	}
}

extension on _StringsPtBr {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'loginTitleCenter': return 'Organize suas contas em um só lugar';
			case 'loginButtonText': return 'Entrar com Google';
			case 'ptBr': return 'Português';
			case 'enUS': return 'Inglês';
			case 'esES': return 'Espanhol';
			case 'hello': return ({required InlineSpan name}) => TextSpan(children: [
				const TextSpan(text: 'Olá, '),
				name,
			]);
			case 'accountUpTodate': return 'Mantenha suas contas em dia';
			case 'registrationsToPay': return ({required num count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(count,
				zero: 'Você não tem contas a pagar! 😵‍💫',
				one: 'Você tem uma conta a pagar',
				other: 'Você tem ${count} contas a pagar',
			);
			case 'myTickets': return 'Meus boletos';
			case 'willExpire': return ({required Object date}) => 'Expira em ${date}';
			case 'requiredField': return 'Campo obrigatório';
			case 'minValue5': return 'Valor mínimo do boleto é de R\$ 5,00';
			case 'billName': return 'Nome do Boleto';
			case 'expiration': return 'Vencimento';
			case 'value': return 'Valor';
			case 'code': return 'Código';
			case 'cancel': return 'Cancelar';
			case 'register': return 'Cadastrar';
			case 'perfil': return 'Perfil';
			default: return null;
		}
	}
}
