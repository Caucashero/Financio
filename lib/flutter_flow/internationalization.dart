import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['tr', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? trText = '',
    String? enText = '',
  }) =>
      [trText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // AuthPage
  {
    'gb9ua1hw': {
      'tr': 'Kayıt Ol',
      'en': 'Register',
    },
    '86f51e5q': {
      'tr': 'Bize Katılın!',
      'en': 'Join Us!',
    },
    'ruum8l86': {
      'tr': 'Adınız ',
      'en': 'Your name',
    },
    'ldnsj6tg': {
      'tr': 'Soyadınız ',
      'en': 'Your Surname',
    },
    'j3wken76': {
      'tr': 'Telefon Numaranız ',
      'en': 'Your Phone Number',
    },
    '5ahznk5g': {
      'tr': 'E-Posta',
      'en': 'Email',
    },
    'cw6ahbdh': {
      'tr': 'Şifre',
      'en': 'Password',
    },
    'ry8b9iqb': {
      'tr': 'Şifre Tekrar',
      'en': 'Repeat Password',
    },
    '81fqmjsc': {
      'tr': 'Kayıt Ol',
      'en': 'Register',
    },
    'tzsz32l8': {
      'tr': 'Giriş Yap',
      'en': 'Login',
    },
    'kokk26m6': {
      'tr': 'Welcome Back',
      'en': 'Welcome Back',
    },
    'fxnu3q3r': {
      'tr': 'Fill out the information below in order to access your account.',
      'en': 'Fill out the information below in order to access your account.',
    },
    '4ammx93w': {
      'tr': 'E-pota',
      'en': 'Email',
    },
    'ma5iuhc2': {
      'tr': 'Şifre',
      'en': 'Password',
    },
    'rxb2f1eu': {
      'tr': 'Giriş Yap',
      'en': 'Login',
    },
    'zmpyijcx': {
      'tr': 'Şifremi Unuttum?',
      'en': 'Forgot My Password?',
    },
    'xccyh2yn': {
      'tr': 'Home',
      'en': 'Home',
    },
  },
  // PairListPage
  {
    '96onglqu': {
      'tr': '',
      'en': '',
    },
  },
  // PairCateogiresPage
  {
    'my0539rt': {
      'tr': 'Piyasa',
      'en': 'Products',
    },
  },
  // Profile
  {
    'rqo8jd9j': {
      'tr': 'Karanlık & Aydınlık Mod',
      'en': 'Dark & Light Mode',
    },
    'y3qnsqi9': {
      'tr': 'Switch to Light Mode',
      'en': 'Switch to Light Mode',
    },
    'uvsdvf70': {
      'tr': 'Yardım',
      'en': 'Help',
    },
    'n9xrvjqg': {
      'tr': 'Gizlilik Politikası',
      'en': 'Privacy Policy',
    },
    'm631y1ax': {
      'tr': 'Bize Ulaşın',
      'en': 'Help',
    },
    '9ssr7ovs': {
      'tr': 'Yasal Uyarı',
      'en': '',
    },
    '2ifgeaxq': {
      'tr': 'Canlı Destek',
      'en': '',
    },
    'n6y68ipf': {
      'tr': 'Log Out',
      'en': 'Log Out',
    },
    '3xqfqc9d': {
      'tr': 'Profil',
      'en': 'Profile',
    },
  },
  // DashboardPage
  {
    '9zl5ql8d': {
      'tr': 'Financio',
      'en': '',
    },
    '3u3c30ua': {
      'tr': 'Home',
      'en': 'Home',
    },
  },
  // PairDetailPage
  {
    'nizxevtl': {
      'tr': 'Home',
      'en': '',
    },
  },
  // GizlilikPolitikasi
  {
    'dnf5je5n': {
      'tr': 'Gizlilik Politikası',
      'en': '',
    },
    'duglqvc2': {
      'tr': 'Home',
      'en': '',
    },
  },
  // Yardim
  {
    'esgwtsag': {
      'tr': 'Yardim',
      'en': '',
    },
    'gbpfc3gu': {
      'tr': 'Home',
      'en': '',
    },
  },
  // YasalUyari
  {
    '9c1lm230': {
      'tr': 'Yasal Uyarı',
      'en': '',
    },
    'svfzapy9': {
      'tr': 'Home',
      'en': '',
    },
  },
  // CanliDestek
  {
    '44r9je3u': {
      'tr': 'Canlı Destek',
      'en': '',
    },
    'sdtu9k0v': {
      'tr': 'Home',
      'en': '',
    },
  },
  // PairList
  {
    'n5v1inie': {
      'tr': 'Satış',
      'en': '',
    },
    '2zw59zz0': {
      'tr': 'Alış',
      'en': '',
    },
  },
  // Miscellaneous
  {
    'ugyhoxfc': {
      'tr': 'Error ',
      'en': 'Error',
    },
    '9ycrjlrn': {
      'tr': 'Şifre Sıfırlama E-postası E-posta Adresinize Gönderildi',
      'en': 'Password Reset Email Has Been Sent To Your Email Address',
    },
    'u574pzxf': {
      'tr': 'E-posta Gerekli',
      'en': 'Email Required',
    },
    'vcjzti68': {
      'tr': 'Telefon Numaranız + ile başlamalı ve ülke kodu olmalıdır.',
      'en': 'Your Phone Number must start with + and have a country code.',
    },
    '6y55mnim': {
      'tr': 'Şifreler Eşleşmedi',
      'en': 'Passwords Did Not Match',
    },
    'jytr2j9k': {
      'tr': 'SMS kodunu giriniz',
      'en': 'Enter SMS code',
    },
    '0fxx12z9': {
      'tr': 'Uzun Süre Giriş Yapmadınız Tekrar Giriş Yapınız',
      'en': 'You have not logged in for a long time. Log in again.',
    },
    'adckaxri': {
      'tr': 'E-posta Adresinizi Güncellemek için Tekrar Giriş Yapmalısınız',
      'en': 'You must log in again to update your email address.',
    },
    '50jqvdqh': {
      'tr': 'Email Değiştirme E-postası Gönderildi',
      'en': 'Email Change Email Sent',
    },
    'ro28ximj': {
      'tr': 'Bu E-posta Adresi Zaten Kayıtlı',
      'en': 'This Email Address Is Already Registered',
    },
    'lpbcs4gh': {
      'tr': 'Yanlış Giriş Bilgileri',
      'en': 'Incorrect Login Information',
    },
    'e2er9iki': {
      'tr': '',
      'en': '',
    },
    'pncjtdsa': {
      'tr': '',
      'en': '',
    },
    '4o78b20d': {
      'tr': '',
      'en': '',
    },
    'avcaxcgc': {
      'tr': '',
      'en': '',
    },
    'djvje4uq': {
      'tr': '',
      'en': '',
    },
    'n2fv5fbp': {
      'tr': '',
      'en': '',
    },
    'vhf69zai': {
      'tr': '',
      'en': '',
    },
    'v7p6xehj': {
      'tr': '',
      'en': '',
    },
    '81vly3cl': {
      'tr': '',
      'en': '',
    },
    'bxgntcrg': {
      'tr': '',
      'en': '',
    },
    '23v5tzfb': {
      'tr': '',
      'en': '',
    },
    '6u1rzf9n': {
      'tr': '',
      'en': '',
    },
    '83j722ae': {
      'tr': '',
      'en': '',
    },
    '01eefofl': {
      'tr': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
