import 'package:flutter/material.dart';

class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;

  static const supportedLocales = [
    Locale('ru'),
    Locale('kk'),
    Locale('en'),
  ];

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static final Map<String, Map<String, String>> _localizedValues = {
    'ru': {
      'app_title': 'Money Tracker',
      'menu': 'Меню',
      'home': 'Главная',
      'transactions': 'Транзакции',
      'tasks': 'Задачи',
      'change_name': 'Изменить имя',
      'dark_theme': 'Тёмная тема',
      'logout': 'Выйти',
      'language': 'Язык',
      'enter_name': 'Введите имя',
      'your_name': 'Ваше имя',
      'cancel': 'Отмена',
      'save': 'Сохранить',
      'language_russian': 'Русский',
      'language_kazakh': 'Қазақ тілі',
      'language_english': 'English',
      'select_language': 'Выберите язык',
      'welcome_hello': 'Привет 👋',
      'welcome_title': 'Добро пожаловать в\nMoney Tracker',
      'welcome_subtitle':
          'Управляйте своими финансами\nлегко и эффективно',
      'get_started': 'Начать',
      'login_sign_in_title': 'Вход',
      'login_sign_up_title': 'Регистрация',
      'email': 'Email',
      'password': 'Пароль',
      'sign_in_button': 'Войти',
      'sign_up_button': 'Зарегистрироваться',
      'already_have_account': 'Уже есть аккаунт? Войти',
      'no_account_yet': 'Нет аккаунта? Зарегистрироваться',
      'home_placeholder': 'Здесь будет ваша финансовая статистика',
      'transactions_empty': 'Здесь будет список ваших транзакций',
      'task_overdue': 'Просрочено',
      'task_done': 'Выполнено',
      'new_task_title': 'Новая задача',
      'edit_task_title': 'Редактировать задачу',
      'enter_task': 'Введите задачу',
      'add': 'Добавить',
      'add_expense_title': 'Добавить расход',
      'amount': 'Сумма',
      'note': 'Комментарий',
    },
    'kk': {
      'app_title': 'Money Tracker',
      'menu': 'Мәзір',
      'home': 'Басты бет',
      'transactions': 'Транзакциялар',
      'tasks': 'Тапсырмалар',
      'change_name': 'Атын өзгерту',
      'dark_theme': 'Қараңғы тақырып',
      'logout': 'Шығу',
      'language': 'Тіл',
      'enter_name': 'Атыңызды енгізіңіз',
      'your_name': 'Сіздің атыңыз',
      'cancel': 'Бас тарту',
      'save': 'Сақтау',
      'language_russian': 'Орыс тілі',
      'language_kazakh': 'Қазақ тілі',
      'language_english': 'Ағылшын тілі',
      'select_language': 'Тілді таңдаңыз',
      'welcome_hello': 'Сәлем 👋',
      'welcome_title': 'Money Tracker-ге\nқош келдіңіз',
      'welcome_subtitle':
          'Қаржыңызды\nоңай және тиімді басқарыңыз',
      'get_started': 'Бастау',
      'login_sign_in_title': 'Кіру',
      'login_sign_up_title': 'Тіркелу',
      'email': 'Email',
      'password': 'Құпия сөз',
      'sign_in_button': 'Кіру',
      'sign_up_button': 'Тіркелу',
      'already_have_account': 'Тіркелгіңіз бар ма? Кіру',
      'no_account_yet': 'Тіркелгі жоқ па? Тіркелу',
      'home_placeholder': 'Мұнда сіздің қаржылық статистикаңыз болады',
      'transactions_empty': 'Мұнда транзакциялар тізімі болады',
      'task_overdue': 'Мерзімі өтті',
      'task_done': 'Орындалды',
      'new_task_title': 'Жаңа тапсырма',
      'edit_task_title': 'Тапсырманы өңдеу',
      'enter_task': 'Тапсырманы енгізіңіз',
      'add': 'Қосу',
      'add_expense_title': 'Шығын қосу',
      'amount': 'Сома',
      'note': 'Түсініктеме',
    },
    'en': {
      'app_title': 'Money Tracker',
      'menu': 'Menu',
      'home': 'Home',
      'transactions': 'Transactions',
      'tasks': 'Tasks',
      'change_name': 'Edit name',
      'dark_theme': 'Dark theme',
      'logout': 'Logout',
      'language': 'Language',
      'enter_name': 'Enter name',
      'your_name': 'Your name',
      'cancel': 'Cancel',
      'save': 'Save',
      'language_russian': 'Russian',
      'language_kazakh': 'Kazakh',
      'language_english': 'English',
      'select_language': 'Choose language',
      'welcome_hello': 'Hi 👋',
      'welcome_title': 'Welcome to\nMoney Tracker',
      'welcome_subtitle': 'Manage your finances\nsimply and effectively',
      'get_started': 'Get started',
      'login_sign_in_title': 'Sign in',
      'login_sign_up_title': 'Sign up',
      'email': 'Email',
      'password': 'Password',
      'sign_in_button': 'Sign in',
      'sign_up_button': 'Sign up',
      'already_have_account': 'Already have an account? Sign in',
      'no_account_yet': 'No account yet? Sign up',
      'home_placeholder': 'Your financial stats will appear here',
      'transactions_empty': 'Your transactions list will appear here',
      'task_overdue': 'Overdue',
      'task_done': 'Done',
      'new_task_title': 'New task',
      'edit_task_title': 'Edit task',
      'enter_task': 'Enter task',
      'add': 'Add',
      'add_expense_title': 'Add expense',
      'amount': 'Amount',
      'note': 'Note',
    },
  };

  String _text(String key) {
    final lang = locale.languageCode;
    return _localizedValues[lang]?[key] ??
        _localizedValues['en']![key]!;
  }

  String get appTitle => _text('app_title');
  String get menu => _text('menu');
  String get home => _text('home');
  String get transactions => _text('transactions');
  String get tasks => _text('tasks');
  String get changeName => _text('change_name');
  String get darkTheme => _text('dark_theme');
  String get logout => _text('logout');
  String get language => _text('language');
  String get enterName => _text('enter_name');
  String get yourName => _text('your_name');
  String get cancel => _text('cancel');
  String get save => _text('save');
  String get languageRussian => _text('language_russian');
  String get languageKazakh => _text('language_kazakh');
  String get languageEnglish => _text('language_english');
  String get selectLanguage => _text('select_language');
  String get welcomeHello => _text('welcome_hello');
  String get welcomeTitle => _text('welcome_title');
  String get welcomeSubtitle => _text('welcome_subtitle');
  String get getStarted => _text('get_started');
  String get loginSignInTitle => _text('login_sign_in_title');
  String get loginSignUpTitle => _text('login_sign_up_title');
  String get email => _text('email');
  String get password => _text('password');
  String get signInButton => _text('sign_in_button');
  String get signUpButton => _text('sign_up_button');
  String get alreadyHaveAccount => _text('already_have_account');
  String get noAccountYet => _text('no_account_yet');
  String get homePlaceholder => _text('home_placeholder');
  String get transactionsEmpty => _text('transactions_empty');
  String get taskOverdue => _text('task_overdue');
  String get taskDone => _text('task_done');
  String get newTaskTitle => _text('new_task_title');
  String get editTaskTitle => _text('edit_task_title');
  String get enterTask => _text('enter_task');
  String get add => _text('add');
  String get addExpenseTitle => _text('add_expense_title');
  String get amount => _text('amount');
  String get note => _text('note');
}

class AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      ['ru', 'kk', 'en'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) =>
      false;
}

