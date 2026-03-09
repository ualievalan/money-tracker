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
      'achievements': 'Ачивки',
      'settings': 'Настройки',
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
      'security': 'Безопасность',
      'change_password': 'Изменить пароль',
      'new_password': 'Новый пароль',
      'confirm_password': 'Подтвердите пароль',
      'passwords_do_not_match': 'Пароли не совпадают',
      'password_changed': 'Пароль изменён',
      'password_change_error': 'Не удалось изменить пароль',
      'font_size': 'Размер шрифта',
      'font_family': 'Шрифт',
      'notifications': 'Уведомления',
      'notifications_enable': 'Включить уведомления',
      'notifications_time': 'Время уведомлений',
      'notifications_off': 'Уведомления отключены',
      'achievements_title': 'Ваши достижения',
      'achievements_subtitle': 'Продолжайте в том же духе!',
      'achievement_seven_days_no_overspend_title':
          '7 дней без перерасхода',
      'achievement_seven_days_no_overspend_subtitle':
          'Держите расходы под контролем неделю подряд.',
      'achievement_one_month_in_plus_title':
          'Месяц в плюсе',
      'achievement_one_month_in_plus_subtitle':
          'Завершите месяц без минуса по бюджету.',
      'achievement_ten_tasks_title': '10 задач выполнено',
      'achievement_ten_tasks_subtitle':
          'Закройте 10 задач со статусом \"выполнено\".',
      'transaction_streak_title': 'Серия по учёту трат',
      'transaction_streak_subtitle': 'Дней подряд: {days}',
      'achievement_unlocked': 'Достижение получено!',
    },
    'kk': {
      'app_title': 'Money Tracker',
      'menu': 'Мәзір',
      'home': 'Басты бет',
      'transactions': 'Транзакциялар',
      'tasks': 'Тапсырмалар',
      'achievements': 'Жетістіктер',
      'settings': 'Баптаулар',
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
      'security': 'Қауіпсіздік',
      'change_password': 'Құпия сөзді өзгерту',
      'new_password': 'Жаңа құпия сөз',
      'confirm_password': 'Құпия сөзді растаңыз',
      'passwords_do_not_match': 'Құпия сөздер сәйкес келмейді',
      'password_changed': 'Құпия сөз өзгертілді',
      'password_change_error': 'Құпия сөзді өзгерту мүмкін болмады',
      'font_size': 'Қаріп өлшемі',
      'font_family': 'Қаріп',
      'notifications': 'Хабарламалар',
      'notifications_enable': 'Хабарламаларды қосу',
      'notifications_time': 'Хабарлама уақыты',
      'notifications_off': 'Хабарламалар сөндірілген',
      'achievements_title': 'Сіздің жетістіктеріңіз',
      'achievements_subtitle': 'Осы қарқынды сақтаңыз!',
      'achievement_seven_days_no_overspend_title':
          '7 күн артық шығынсыз',
      'achievement_seven_days_no_overspend_subtitle':
          'Шығындарыңызды бір апта бойы бақылауда ұстаңыз.',
      'achievement_one_month_in_plus_title':
          'Айды плюсте аяқтаңыз',
      'achievement_one_month_in_plus_subtitle':
          'Ай соңын бюджет минуссыз аяқтаңыз.',
      'achievement_ten_tasks_title': '10 тапсырма орындалды',
      'achievement_ten_tasks_subtitle':
          'Статусы \"орындалды\" болатын 10 тапсырманы жабыңыз.',
      'transaction_streak_title': 'Шығындар сериясы',
      'transaction_streak_subtitle': 'Кезектескен күндер: {days}',
      'achievement_unlocked': 'Жетістік ашылды!',
    },
    'en': {
      'app_title': 'Money Tracker',
      'menu': 'Menu',
      'home': 'Home',
      'transactions': 'Transactions',
      'tasks': 'Tasks',
      'achievements': 'Achievements',
      'settings': 'Settings',
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
      'security': 'Security',
      'change_password': 'Change password',
      'new_password': 'New password',
      'confirm_password': 'Confirm password',
      'passwords_do_not_match': 'Passwords do not match',
      'password_changed': 'Password changed',
      'password_change_error': 'Failed to change password',
      'font_size': 'Font size',
      'font_family': 'Font family',
      'notifications': 'Notifications',
      'notifications_enable': 'Enable notifications',
      'notifications_time': 'Notification time',
      'notifications_off': 'Notifications are off',
      'achievements_title': 'Your achievements',
      'achievements_subtitle': 'Keep up the great work!',
      'achievement_seven_days_no_overspend_title':
          '7 days without overspending',
      'achievement_seven_days_no_overspend_subtitle':
          'Keep your spending under control for a whole week.',
      'achievement_one_month_in_plus_title':
          'One month in the plus',
      'achievement_one_month_in_plus_subtitle':
          'Finish the month without going negative in your budget.',
      'achievement_ten_tasks_title': '10 tasks completed',
      'achievement_ten_tasks_subtitle':
          'Complete 10 tasks with the \"done\" status.',
      'transaction_streak_title': 'Spending streak',
      'transaction_streak_subtitle': 'Days in a row: {days}',
      'achievement_unlocked': 'Achievement unlocked!',
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
  String get settings => _text('settings');
  String get achievements => _text('achievements');
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
  String get security => _text('security');
  String get changePassword => _text('change_password');
  String get newPassword => _text('new_password');
  String get confirmPassword => _text('confirm_password');
  String get passwordsDoNotMatch => _text('passwords_do_not_match');
  String get passwordChanged => _text('password_changed');
  String get passwordChangeError => _text('password_change_error');
  String get fontSize => _text('font_size');
  String get fontFamily => _text('font_family');
  String get notifications => _text('notifications');
  String get notificationsEnable => _text('notifications_enable');
  String get notificationsTime => _text('notifications_time');
  String get notificationsOff => _text('notifications_off');
  String get achievementsTitle => _text('achievements_title');
  String get achievementsSubtitle => _text('achievements_subtitle');
  String get achievementSevenDaysNoOverspendTitle =>
      _text('achievement_seven_days_no_overspend_title');
  String get achievementSevenDaysNoOverspendSubtitle =>
      _text('achievement_seven_days_no_overspend_subtitle');
  String get achievementOneMonthInPlusTitle =>
      _text('achievement_one_month_in_plus_title');
  String get achievementOneMonthInPlusSubtitle =>
      _text('achievement_one_month_in_plus_subtitle');
  String get achievementTenTasksTitle =>
      _text('achievement_ten_tasks_title');
  String get achievementTenTasksSubtitle =>
      _text('achievement_ten_tasks_subtitle');
  String transactionStreakSubtitle(int days) {
    final template = _text('transaction_streak_subtitle');
    return template.replaceFirst('{days}', '$days');
  }
  String get transactionStreakTitle =>
      _text('transaction_streak_title');
  String get achievementUnlocked => _text('achievement_unlocked');
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

