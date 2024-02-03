class ConstantsManager {
  /// APP //////////////////////////////////////////////////////////////////////
  static const String APP_NAME = "BudgetLab";
  static const String CONTENT = "CONTENT";
  static const String LOAN_LEND = "Loan/Lend";
  static const String INCOME_EXPENSE = "Transactions";
  static const String BUDGET = "Budget";
  static const String SAVINGS = "Savings";
  static const String ADD_SAVINGS = "Add Savings";
  static const String ADD_TO_SAVINGS = "Add to Savings";
  static const String ADD_LOAN_LEND = "Add Loan/Lend";
  static const String PROFILE = "Profile";
  static const String ADD_INCOME_EXPENSE = "Add Income/Expense";
  static const String AVAILABLE_BALANCE = "Available Balance";
  static const String YOUR_WORTH = "Your Worth";
  static const String EXPENDABLE_AMOUNT = "Expendable Amt.";
  static const String HISTORY = "History";


  /// ERROR ////////////////////////////////////////////////////////////////////
  static const String NO_TEXT = "Please enter some text";
  static const String NOT_VALID_AMOUNT = "Enter a valid amount";
  static const String NOT_ENOUGH_BALANCE = "Not enough balance";

  /// HEADERS //////////////////////////////////////////////////////////////////
  static const String PREFERENCES = "PREFERENCES";
  static const String MORE = "MORE";
  static const String TRANSACTIONS = "TRANSACTIONS";

  /// BUTTONS //////////////////////////////////////////////////////////////////
  static const String SAVE = "Save";

  /// IMAGES //////////////////////////////////////////////////////////////////
  static const EXPENSE_IMAGE ='assets/images/icons/expense.png';

  /// DAYS & MONTHS ////////////////////////////////////////////////////////////
  static final Map<int, String> weekday = {
    1: 'Monday',
    2: 'Tuesday',
    3: 'Wednesday',
    4: 'Thursday',
    5: 'Friday',
    6: 'Saturday',
    7: 'Sunday',
  };

  static final Map<int, String> months = {
    1: 'January',
    2: 'February',
    3: 'March',
    4: 'April',
    5: 'May',
    6: 'June',
    7: 'July',
    8: 'August',
    9: 'September',
    10: 'October',
    11: 'November',
    12: 'December',
  };

  /// CURRENCIES ///////////////////////////////////////////////////////////////
  static final List<Map<String, String>> currencies = [
    {'countryCode':'AE', 'currencyCode': 'AED', 'currencyName': 'UAE Dirham', 'symbol': 'د.إ'},
    {'countryCode':'AF', 'currencyCode': 'AFN', 'currencyName': 'Afghan Afghani', 'symbol': 'Af'},
    {'countryCode':'AL', 'currencyCode': 'ALL', 'currencyName': 'Albanian Lek', 'symbol': 'L'},
    {'countryCode':'AM', 'currencyCode': 'AMD', 'currencyName': 'Armenian Dram', 'symbol': '֏'},
    {'countryCode':'AN', 'currencyCode': 'ANG', 'currencyName': 'Netherlands Antillean Guilder', 'symbol': 'ƒ'},
    {'countryCode':'AO', 'currencyCode': 'AOA', 'currencyName': 'Angolan Kwanza', 'symbol': 'Kz'},
    {'countryCode':'AR', 'currencyCode': 'ARS', 'currencyName': 'Argentine Peso', 'symbol': '\$'},
    {'countryCode':'AU', 'currencyCode': 'AUD', 'currencyName': 'Australian Dollar', 'symbol': '\$'},
    {'countryCode':'AW', 'currencyCode': 'AWG', 'currencyName': 'Aruban Florin', 'symbol': 'ƒ'},
    {'countryCode':'AZ', 'currencyCode': 'AZN', 'currencyName': 'Azerbaijani Manat', 'symbol': '₼'},
    {'countryCode':'BA', 'currencyCode': 'BAM', 'currencyName': 'Bosnia-Herzegovina Convertible Mark', 'symbol': 'КМ'},
    {'countryCode':'BB', 'currencyCode': 'BBD', 'currencyName': 'Barbadian Dollar', 'symbol': '\$'},
    {'countryCode':'BD', 'currencyCode': 'BDT', 'currencyName': 'Bangladeshi Taka', 'symbol': '৳'},
    {'countryCode':'BG', 'currencyCode': 'BGN', 'currencyName': 'Bulgarian Lev', 'symbol': 'лв'},
    {'countryCode':'BH', 'currencyCode': 'BHD', 'currencyName': 'Bahraini Dinar', 'symbol': '.د.ب'},
    {'countryCode':'BI', 'currencyCode': 'BIF', 'currencyName': 'Burundian Franc', 'symbol': 'FBu'},
    {'countryCode':'BM', 'currencyCode': 'BMD', 'currencyName': 'Bermudian Dollar', 'symbol': '\$'},
    {'countryCode':'BN', 'currencyCode': 'BND', 'currencyName': 'Brunei Dollar', 'symbol': '\$'},
    {'countryCode':'BO', 'currencyCode': 'BOB', 'currencyName': 'Bolivian Boliviano', 'symbol': 'Bs.'},
    {'countryCode':'BR', 'currencyCode': 'BRL', 'currencyName': 'Brazilian Real', 'symbol': 'R\$'},
    {'countryCode':'BS', 'currencyCode': 'BSD', 'currencyName': 'Bahamian Dollar', 'symbol': '\$'},
    {'countryCode':'BT', 'currencyCode': 'BTN', 'currencyName': 'Bhutanese Ngultrum', 'symbol': 'Nu.'},
    {'countryCode':'BW', 'currencyCode': 'BWP', 'currencyName': 'Botswanan Pula', 'symbol': 'P'},
    {'countryCode':'BY', 'currencyCode': 'BYN', 'currencyName': 'Belarusian Ruble', 'symbol': 'Br'},
    {'countryCode':'BZ', 'currencyCode': 'BZD', 'currencyName': 'Belize Dollar', 'symbol': 'BZ\$'},
    {'countryCode':'CA', 'currencyCode': 'CAD', 'currencyName': 'Canadian Dollar', 'symbol': '\$'},
    {'countryCode':'CD', 'currencyCode': 'CDF', 'currencyName': 'Congolese Franc', 'symbol': 'FC'},
    {'countryCode':'CH', 'currencyCode': 'CHF', 'currencyName': 'Swiss Franc', 'symbol': 'CHF'},
    {'countryCode':'CL', 'currencyCode': 'CLP', 'currencyName': 'Chilean Peso', 'symbol': '\$'},
    {'countryCode':'CN', 'currencyCode': 'CNY', 'currencyName': 'Chinese Yuan', 'symbol': '¥'},
    {'countryCode':'CO', 'currencyCode': 'COP', 'currencyName': 'Colombian Peso', 'symbol': '\$'},
    {'countryCode':'CR', 'currencyCode': 'CRC', 'currencyName': 'Costa Rican Colón', 'symbol': '₡'},
    {'countryCode':'CU', 'currencyCode': 'CUP', 'currencyName': 'Cuban Peso', 'symbol': '₱'},
    {'countryCode':'CV', 'currencyCode': 'CVE', 'currencyName': 'Cape Verdean Escudo', 'symbol': 'Esc'},
    {'countryCode':'CZ', 'currencyCode': 'CZK', 'currencyName': 'Czech Republic Koruna', 'symbol': 'Kč'},
    {'countryCode':'DJ', 'currencyCode': 'DJF', 'currencyName': 'Djiboutian Franc', 'symbol': 'Fdj'},
    {'countryCode':'DK', 'currencyCode': 'DKK', 'currencyName': 'Danish Krone', 'symbol': 'kr'},
    {'countryCode':'DO', 'currencyCode': 'DOP', 'currencyName': 'Dominican Peso', 'symbol': 'RD\$'},
    {'countryCode':'DZ', 'currencyCode': 'DZD', 'currencyName': 'Algerian Dinar', 'symbol': 'د.ج'},
    {'countryCode':'EE', 'currencyCode': 'EUR', 'currencyName': 'Euro', 'symbol': '€'},
    {'countryCode':'EG', 'currencyCode': 'EGP', 'currencyName': 'Egyptian Pound', 'symbol': '£'},
    {'countryCode':'EH', 'currencyCode': 'MAD', 'currencyName': 'Moroccan Dirham', 'symbol': 'د.م.'},
    {'countryCode':'ER', 'currencyCode': 'ERN', 'currencyName': 'Eritrean Nakfa', 'symbol': 'Nfk'},
    {'countryCode':'ES', 'currencyCode': 'EUR', 'currencyName': 'Euro', 'symbol': '€'},
    {'countryCode':'ET', 'currencyCode': 'ETB', 'currencyName': 'Ethiopian Birr', 'symbol': 'Br'},
    {'countryCode':'FI', 'currencyCode': 'EUR', 'currencyName': 'Euro', 'symbol': '€'},
    {'countryCode':'FJ', 'currencyCode': 'FJD', 'currencyName': 'Fijian Dollar', 'symbol': 'FJ\$'},
    {'countryCode':'FK', 'currencyCode': 'FKP', 'currencyName': 'Falkland Islands Pound', 'symbol': 'FK£'},
    {'countryCode':'FM', 'currencyCode': 'USD', 'currencyName': 'United States Dollar', 'symbol': '\$'},
    {'countryCode':'FO', 'currencyCode': 'DKK', 'currencyName': 'Danish Krone', 'symbol': 'kr'},
    {'countryCode':'FR', 'currencyCode': 'EUR', 'currencyName': 'Euro', 'symbol': '€'},
    {'countryCode':'GA', 'currencyCode': 'XAF', 'currencyName': 'Central African CFA Franc', 'symbol': 'FCFA'},
    {'countryCode':'GB', 'currencyCode': 'GBP', 'currencyName': 'British Pound Sterling', 'symbol': '£'},
    {'countryCode':'GD', 'currencyCode': 'XCD', 'currencyName': 'East Caribbean Dollar', 'symbol': 'EC\$'},
    {'countryCode':'GE', 'currencyCode': 'GEL', 'currencyName': 'Georgian Lari', 'symbol': '₾'},
    {'countryCode':'GF', 'currencyCode': 'EUR', 'currencyName': 'Euro', 'symbol': '€'},
    {'countryCode':'GG', 'currencyCode': 'GBP', 'currencyName': 'British Pound Sterling', 'symbol': '£'},
    {'countryCode':'GH', 'currencyCode': 'GHS', 'currencyName': 'Ghanaian Cedi', 'symbol': '₵'},
    {'countryCode':'GI', 'currencyCode': 'GIP', 'currencyName': 'Gibraltar Pound', 'symbol': '£'},
    {'countryCode':'GL', 'currencyCode': 'DKK', 'currencyName': 'Danish Krone', 'symbol': 'kr'},
    {'countryCode':'GM', 'currencyCode': 'GMD', 'currencyName': 'Gambian Dalasi', 'symbol': 'D'},
    {'countryCode':'GN', 'currencyCode': 'GNF', 'currencyName': 'Guinean Franc', 'symbol': 'FG'},
    {'countryCode':'GP', 'currencyCode': 'EUR', 'currencyName': 'Euro', 'symbol': '€'},
    {'countryCode':'GQ', 'currencyCode': 'XAF', 'currencyName': 'Central African CFA Franc', 'symbol': 'FCFA'},
    {'countryCode':'GR', 'currencyCode': 'EUR', 'currencyName': 'Euro', 'symbol': '€'},
    {'countryCode':'GS', 'currencyCode': 'GBP', 'currencyName': 'British Pound Sterling', 'symbol': '£'},
    {'countryCode':'GT', 'currencyCode': 'GTQ', 'currencyName': 'Guatemalan Quetzal', 'symbol': 'Q'},
    {'countryCode':'GU', 'currencyCode': 'USD', 'currencyName': 'United States Dollar', 'symbol': '\$'},
    {'countryCode':'GW', 'currencyCode': 'XOF', 'currencyName': 'West African CFA Franc', 'symbol': 'CFA'},
    {'countryCode':'GY', 'currencyCode': 'GYD', 'currencyName': 'Guyanaese Dollar', 'symbol': 'GY\$'},
    {'countryCode':'HK', 'currencyCode': 'HKD', 'currencyName': 'Hong Kong Dollar', 'symbol': 'HK\$'},
    {'countryCode':'HM', 'currencyCode': 'AUD', 'currencyName': 'Australian Dollar', 'symbol': '\$'},
    {'countryCode':'HN', 'currencyCode': 'HNL', 'currencyName': 'Honduran Lempira', 'symbol': 'L'},
    {'countryCode':'HR', 'currencyCode': 'HRK', 'currencyName': 'Croatian Kuna', 'symbol': 'kn'},
    {'countryCode':'HT', 'currencyCode': 'HTG', 'currencyName': 'Haitian Gourde', 'symbol': 'G'},
    {'countryCode':'HU', 'currencyCode': 'HUF', 'currencyName': 'Hungarian Forint', 'symbol': 'Ft'},
    {'countryCode':'ID', 'currencyCode': 'IDR', 'currencyName': 'Indonesian Rupiah', 'symbol': 'Rp'},
    {'countryCode':'IE', 'currencyCode': 'EUR', 'currencyName': 'Euro', 'symbol': '€'},
    {'countryCode':'IL', 'currencyCode': 'ILS', 'currencyName': 'Israeli New Sheqel', 'symbol': '₪'},
    {'countryCode':'IM', 'currencyCode': 'GBP', 'currencyName': 'British Pound Sterling', 'symbol': '£'},
    {'countryCode':'IN', 'currencyCode': 'INR', 'currencyName': 'Indian Rupee', 'symbol': '₹'},
    {'countryCode':'IO', 'currencyCode': 'USD', 'currencyName': 'United States Dollar', 'symbol': '\$'},
    {'countryCode':'IQ', 'currencyCode': 'IQD', 'currencyName': 'Iraqi Dinar', 'symbol': 'د.ع'},
    {'countryCode':'IR', 'currencyCode': 'IRR', 'currencyName': 'Iranian Rial', 'symbol': '﷼'},
    {'countryCode':'IS', 'currencyCode': 'ISK', 'currencyName': 'Icelandic Króna', 'symbol': 'kr'},
    {'countryCode':'IT', 'currencyCode': 'EUR', 'currencyName': 'Euro', 'symbol': '€'},
    {'countryCode':'JE', 'currencyCode': 'GBP', 'currencyName': 'British Pound Sterling', 'symbol': '£'},
    {'countryCode':'JM', 'currencyCode': 'JMD', 'currencyName': 'Jamaican Dollar', 'symbol': 'J\$'},
    {'countryCode':'JO', 'currencyCode': 'JOD', 'currencyName': 'Jordanian Dinar', 'symbol': 'د.ا'},
    {'countryCode':'JP', 'currencyCode': 'JPY', 'currencyName': 'Japanese Yen', 'symbol': '¥'},
    {'countryCode':'KE', 'currencyCode': 'KES', 'currencyName': 'Kenyan Shilling', 'symbol': 'KSh'},
    {'countryCode':'KG', 'currencyCode': 'KGS', 'currencyName': 'Kyrgystani Som', 'symbol': 'с'},
    {'countryCode':'KH', 'currencyCode': 'KHR', 'currencyName': 'Cambodian Riel', 'symbol': '៛'},
    {'countryCode':'KI', 'currencyCode': 'AUD', 'currencyName': 'Australian Dollar', 'symbol': '\$'},
    {'countryCode':'KM', 'currencyCode': 'KMF', 'currencyName': 'Comorian Franc', 'symbol': 'CF'},
    {'countryCode':'KN', 'currencyCode': 'XCD', 'currencyName': 'East Caribbean Dollar', 'symbol': 'EC\$'},
    {'countryCode':'KP', 'currencyCode': 'KPW', 'currencyName': 'North Korean Won', 'symbol': '₩'},
    {'countryCode':'KR', 'currencyCode': 'KRW', 'currencyName': 'South Korean Won', 'symbol': '₩'},
    {'countryCode': 'KW', 'currencyCode': 'KWD', 'currencyName': 'Kuwaiti Dinar', 'symbol': 'د.ك'},
    {'countryCode': 'KY', 'currencyCode': 'KYD', 'currencyName': 'Cayman Islands Dollar', 'symbol': 'CI\$'},
    {'countryCode': 'KZ', 'currencyCode': 'KZT', 'currencyName': 'Kazakhstani Tenge', 'symbol': '₸'},
    {'countryCode': 'LA', 'currencyCode': 'LAK', 'currencyName': 'Laotian Kip', 'symbol': '₭'},
    {'countryCode': 'LB', 'currencyCode': 'LBP', 'currencyName': 'Lebanese Pound', 'symbol': 'ل.ل'},
    {'countryCode': 'LC', 'currencyCode': 'XCD', 'currencyName': 'East Caribbean Dollar', 'symbol': 'EC\$'},
    {'countryCode': 'LI', 'currencyCode': 'CHF', 'currencyName': 'Swiss Franc', 'symbol': 'CHF'},
    {'countryCode': 'LK', 'currencyCode': 'LKR', 'currencyName': 'Sri Lankan Rupee', 'symbol': 'Rs'},
    {'countryCode': 'LR', 'currencyCode': 'LRD', 'currencyName': 'Liberian Dollar', 'symbol': 'L\$'},
    {'countryCode': 'LS', 'currencyCode': 'LSL', 'currencyName': 'Lesotho Loti', 'symbol': 'L'},
    {'countryCode': 'LT', 'currencyCode': 'EUR', 'currencyName': 'Euro', 'symbol': '€'},
    {'countryCode': 'LU', 'currencyCode': 'EUR', 'currencyName': 'Euro', 'symbol': '€'},
    {'countryCode': 'LV', 'currencyCode': 'EUR', 'currencyName': 'Euro', 'symbol': '€'},
    {'countryCode': 'LY', 'currencyCode': 'LYD', 'currencyName': 'Libyan Dinar', 'symbol': 'ل.د'},
    {'countryCode': 'MA', 'currencyCode': 'MAD', 'currencyName': 'Moroccan Dirham', 'symbol': 'د.م.'},
    {'countryCode': 'MC', 'currencyCode': 'EUR', 'currencyName': 'Euro', 'symbol': '€'},
    {'countryCode': 'MD', 'currencyCode': 'MDL', 'currencyName': 'Moldovan Leu', 'symbol': 'L'},
    {'countryCode': 'ME', 'currencyCode': 'EUR', 'currencyName': 'Euro', 'symbol': '€'},
    {'countryCode': 'MF', 'currencyCode': 'EUR', 'currencyName': 'Euro', 'symbol': '€'},
    {'countryCode': 'MG', 'currencyCode': 'MGA', 'currencyName': 'Malagasy Ariary', 'symbol': 'Ar'},
    {'countryCode': 'MH', 'currencyCode': 'USD', 'currencyName': 'United States Dollar', 'symbol': '\$'},
    {'countryCode': 'MK', 'currencyCode': 'MKD', 'currencyName': 'Macedonian Denar', 'symbol': 'ден'},
    {'countryCode': 'ML', 'currencyCode': 'XOF', 'currencyName': 'West African CFA Franc', 'symbol': 'CFA'},
    {'countryCode': 'MM', 'currencyCode': 'MMK', 'currencyName': 'Myanma Kyat', 'symbol': 'K'},
    {'countryCode': 'MN', 'currencyCode': 'MNT', 'currencyName': 'Mongolian Tugrik', 'symbol': '₮'},
    {'countryCode': 'MO', 'currencyCode': 'MOP', 'currencyName': 'Macanese Pataca', 'symbol': 'MOP\$'},
    {'countryCode': 'MP', 'currencyCode': 'USD', 'currencyName': 'United States Dollar', 'symbol': '\$'},
    {'countryCode': 'MQ', 'currencyCode': 'EUR', 'currencyName': 'Euro', 'symbol': '€'},
    {'countryCode': 'MR', 'currencyCode': 'MRU', 'currencyName': 'Mauritanian Ouguiya', 'symbol': 'UM'},
    {'countryCode': 'MS', 'currencyCode': 'XCD', 'currencyName': 'East Caribbean Dollar', 'symbol': 'EC\$'},
    {'countryCode': 'MT', 'currencyCode': 'EUR', 'currencyName': 'Euro', 'symbol': '€'},
    {'countryCode': 'MU', 'currencyCode': 'MUR', 'currencyName': 'Mauritian Rupee', 'symbol': 'Rs'},
    {'countryCode': 'MV', 'currencyCode': 'MVR', 'currencyName': 'Maldivian Rufiyaa', 'symbol': 'Rf'},
    {'countryCode': 'MW', 'currencyCode': 'MWK', 'currencyName': 'Malawian Kwacha', 'symbol': 'MK'},
    {'countryCode': 'MX', 'currencyCode': 'MXN', 'currencyName': 'Mexican Peso', 'symbol': '\$'},
    {'countryCode': 'MY', 'currencyCode': 'MYR', 'currencyName': 'Malaysian Ringgit', 'symbol': 'RM'},
    {'countryCode': 'MZ', 'currencyCode': 'MZN', 'currencyName': 'Mozambican Metical', 'symbol': 'MT'},
    {'countryCode': 'NA', 'currencyCode': 'NAD', 'currencyName': 'Namibian Dollar', 'symbol': 'N\$'},
    {'countryCode': 'NC', 'currencyCode': 'XPF', 'currencyName': 'CFP Franc', 'symbol': '₣'},
    {'countryCode': 'NE', 'currencyCode': 'XOF', 'currencyName': 'West African CFA Franc', 'symbol': 'CFA'},
    {'countryCode': 'NF', 'currencyCode': 'AUD', 'currencyName': 'Australian Dollar', 'symbol': '\$'},
    {'countryCode': 'NG', 'currencyCode': 'NGN', 'currencyName': 'Nigerian Naira', 'symbol': '₦'},
    {'countryCode': 'NI', 'currencyCode': 'NIO', 'currencyName': 'Nicaraguan Córdoba', 'symbol': 'C\$'},
    {'countryCode': 'NL', 'currencyCode': 'EUR', 'currencyName': 'Euro', 'symbol': '€'},
    {'countryCode': 'NO', 'currencyCode': 'NOK', 'currencyName': 'Norwegian Krone', 'symbol': 'kr'},
    {'countryCode': 'NP', 'currencyCode': 'NPR', 'currencyName': 'Nepalese Rupee', 'symbol': 'रू'},
    {'countryCode': 'NR', 'currencyCode': 'AUD', 'currencyName': 'Australian Dollar', 'symbol': '\$'},
    {'countryCode': 'NU', 'currencyCode': 'NZD', 'currencyName': 'New Zealand Dollar', 'symbol': '\$'},
    {'countryCode': 'NZ', 'currencyCode': 'NZD', 'currencyName': 'New Zealand Dollar', 'symbol': '\$'},
    {'countryCode': 'OM', 'currencyCode': 'OMR', 'currencyName': 'Omani Rial', 'symbol': 'ر.ع.'},
    {'countryCode': 'PA', 'currencyCode': 'PAB', 'currencyName': 'Panamanian Balboa', 'symbol': 'B/.'},
    {'countryCode': 'PE', 'currencyCode': 'PEN', 'currencyName': 'Peruvian Nuevo Sol', 'symbol': 'S/.'},
    {'countryCode': 'PF', 'currencyCode': 'XPF', 'currencyName': 'CFP Franc', 'symbol': '₣'},
    {'countryCode': 'PG', 'currencyCode': 'PGK', 'currencyName': 'Papua New Guinean Kina', 'symbol': 'K'},
    {'countryCode': 'PH', 'currencyCode': 'PHP', 'currencyName': 'Philippine Peso', 'symbol': '₱'},
    {'countryCode': 'PK', 'currencyCode': 'PKR', 'currencyName': 'Pakistani Rupee', 'symbol': '₨'},
    {'countryCode': 'PL', 'currencyCode': 'PLN', 'currencyName': 'Polish Zloty', 'symbol': 'zł'},
    {'countryCode': 'PM', 'currencyCode': 'EUR', 'currencyName': 'Euro', 'symbol': '€'},
    {'countryCode': 'PN', 'currencyCode': 'NZD', 'currencyName': 'New Zealand Dollar', 'symbol': '\$'},
    {'countryCode': 'PR', 'currencyCode': 'USD', 'currencyName': 'United States Dollar', 'symbol': '\$'},
    {'countryCode': 'PS', 'currencyCode': 'ILS', 'currencyName': 'Israeli New Sheqel', 'symbol': '₪'},
    {'countryCode': 'PT', 'currencyCode': 'EUR', 'currencyName': 'Euro', 'symbol': '€'},
    {'countryCode': 'PW', 'currencyCode': 'USD', 'currencyName': 'United States Dollar', 'symbol': '\$'},
    {'countryCode': 'PY', 'currencyCode': 'PYG', 'currencyName': 'Paraguayan Guarani', 'symbol': '₲'},
    {'countryCode': 'QA', 'currencyCode': 'QAR', 'currencyName': 'Qatari Rial', 'symbol': 'ر.ق'},
    {'countryCode': 'RE', 'currencyCode': 'EUR', 'currencyName': 'Euro', 'symbol': '€'},
    {'countryCode': 'RO', 'currencyCode': 'RON', 'currencyName': 'Romanian Leu', 'symbol': 'lei'},
    {'countryCode': 'RS', 'currencyCode': 'RSD', 'currencyName': 'Serbian Dinar', 'symbol': 'дин.'},
    {'countryCode': 'RU', 'currencyCode': 'RUB', 'currencyName': 'Russian Ruble', 'symbol': '₽'},
    {'countryCode': 'RW', 'currencyCode': 'RWF', 'currencyName': 'Rwandan Franc', 'symbol': 'FRw'},
    {'countryCode': 'SA', 'currencyCode': 'SAR', 'currencyName': 'Saudi Riyal', 'symbol': 'ر.س'},
    {'countryCode': 'SB', 'currencyCode': 'SBD', 'currencyName': 'Solomon Islands Dollar', 'symbol': 'SI\$'},
    {'countryCode': 'SC', 'currencyCode': 'SCR', 'currencyName': 'Seychellois Rupee', 'symbol': 'SR'},
    {'countryCode': 'SD', 'currencyCode': 'SDG', 'currencyName': 'Sudanese Pound', 'symbol': 'ج.س.'},
    {'countryCode': 'SE', 'currencyCode': 'SEK', 'currencyName': 'Swedish Krona', 'symbol': 'kr'},
    {'countryCode': 'SG', 'currencyCode': 'SGD', 'currencyName': 'Singapore Dollar', 'symbol': 'S\$'},
    {'countryCode': 'SH', 'currencyCode': 'SHP', 'currencyName': 'Saint Helena Pound', 'symbol': '£'},
    {'countryCode': 'SI', 'currencyCode': 'EUR', 'currencyName': 'Euro', 'symbol': '€'},
    {'countryCode': 'SJ', 'currencyCode': 'NOK', 'currencyName': 'Norwegian Krone', 'symbol': 'kr'},
    {'countryCode': 'SK', 'currencyCode': 'EUR', 'currencyName': 'Euro', 'symbol': '€'},
    {'countryCode': 'SL', 'currencyCode': 'SLL', 'currencyName': 'Sierra Leonean Leone', 'symbol': 'Le'},
    {'countryCode': 'SM', 'currencyCode': 'EUR', 'currencyName': 'Euro', 'symbol': '€'},
    {'countryCode': 'SN', 'currencyCode': 'XOF', 'currencyName': 'West African CFA Franc', 'symbol': 'CFA'},
    {'countryCode': 'SO', 'currencyCode': 'SOS', 'currencyName': 'Somali Shilling', 'symbol': 'S'},
    {'countryCode': 'SR', 'currencyCode': 'SRD', 'currencyName': 'Surinamese Dollar', 'symbol': 'SRD\$'},
    {'countryCode': 'SS', 'currencyCode': 'SSP', 'currencyName': 'South Sudanese Pound', 'symbol': '£'},
    {'countryCode': 'ST', 'currencyCode': 'STN', 'currencyName': 'São Tomé and Príncipe Dobra', 'symbol': 'Db'},
    {'countryCode': 'SV', 'currencyCode': 'USD', 'currencyName': 'United States Dollar', 'symbol': '\$'},
    {'countryCode': 'SX', 'currencyCode': 'ANG', 'currencyName': 'Netherlands Antillean Guilder', 'symbol': 'ƒ'},
    {'countryCode': 'SY', 'currencyCode': 'SYP', 'currencyName': 'Syrian Pound', 'symbol': 'ل.س'},
    {'countryCode': 'SZ', 'currencyCode': 'SZL', 'currencyName': 'Swazi Lilangeni', 'symbol': 'L'},
    {'countryCode': 'TC', 'currencyCode': 'USD', 'currencyName': 'United States Dollar', 'symbol': '\$'},
    {'countryCode': 'TD', 'currencyCode': 'XAF', 'currencyName': 'Central African CFA Franc', 'symbol': 'FCFA'},
    {'countryCode': 'TF', 'currencyCode': 'EUR', 'currencyName': 'Euro', 'symbol': '€'},
    {'countryCode': 'TG', 'currencyCode': 'XOF', 'currencyName': 'West African CFA Franc', 'symbol': 'CFA'},
    {'countryCode': 'TH', 'currencyCode': 'THB', 'currencyName': 'Thai Baht', 'symbol': '฿'},
    {'countryCode': 'TJ', 'currencyCode': 'TJS', 'currencyName': 'Tajikistani Somoni', 'symbol': 'SM'},
    {'countryCode': 'TK', 'currencyCode': 'NZD', 'currencyName': 'New Zealand Dollar', 'symbol': '\$'},
    {'countryCode': 'TL', 'currencyCode': 'USD', 'currencyName': 'United States Dollar', 'symbol': '\$'},
    {'countryCode': 'TM', 'currencyCode': 'TMT', 'currencyName': 'Turkmenistani Manat', 'symbol': 'T'},
    {'countryCode': 'TN', 'currencyCode': 'TND', 'currencyName': 'Tunisian Dinar', 'symbol': 'د.ت'},
    {'countryCode': 'TO', 'currencyCode': 'TOP', 'currencyName': 'Tongan Pa\'anga', 'symbol': 'T\$'},
    {'countryCode': 'TR', 'currencyCode': 'TRY', 'currencyName': 'Turkish Lira', 'symbol': '₺'},
    {'countryCode': 'TT', 'currencyCode': 'TTD', 'currencyName': 'Trinidad and Tobago Dollar', 'symbol': 'TT\$'},
    {'countryCode': 'TV', 'currencyCode': 'AUD', 'currencyName': 'Australian Dollar', 'symbol': '\$'},
    {'countryCode': 'TW', 'currencyCode': 'TWD', 'currencyName': 'New Taiwan Dollar', 'symbol': 'NT\$'},
    {'countryCode': 'TZ', 'currencyCode': 'TZS', 'currencyName': 'Tanzanian Shilling', 'symbol': 'TSh'},
    {'countryCode': 'UA', 'currencyCode': 'UAH', 'currencyName': 'Ukrainian Hryvnia', 'symbol': '₴'},
    {'countryCode': 'UG', 'currencyCode': 'UGX', 'currencyName': 'Ugandan Shilling', 'symbol': 'USh'},
    {'countryCode': 'UM', 'currencyCode': 'USD', 'currencyName': 'United States Dollar', 'symbol': '\$'},
    {'countryCode': 'US', 'currencyCode': 'USD', 'currencyName': 'United States Dollar', 'symbol': '\$'},
    {'countryCode': 'UY', 'currencyCode': 'UYU', 'currencyName': 'Uruguayan Peso', 'symbol': '\$U'},
    {'countryCode': 'UZ', 'currencyCode': 'UZS', 'currencyName': 'Uzbekistan Som', 'symbol': 'лв'},
    {'countryCode': 'VA', 'currencyCode': 'EUR', 'currencyName': 'Euro', 'symbol': '€'},
    {'countryCode': 'VC', 'currencyCode': 'XCD', 'currencyName': 'East Caribbean Dollar', 'symbol': 'EC\$'},
    {'countryCode': 'VE', 'currencyCode': 'VES', 'currencyName': 'Venezuelan Bolívar', 'symbol': 'Bs'},
    {'countryCode': 'VG', 'currencyCode': 'USD', 'currencyName': 'United States Dollar', 'symbol': '\$'},
    {'countryCode': 'VI', 'currencyCode': 'USD', 'currencyName': 'United States Dollar', 'symbol': '\$'},
    {'countryCode': 'VN', 'currencyCode': 'VND', 'currencyName': 'Vietnamese Dong', 'symbol': '₫'},
    {'countryCode': 'VU', 'currencyCode': 'VUV', 'currencyName': 'Vanuatu Vatu', 'symbol': 'VT'},
    {'countryCode': 'WF', 'currencyCode': 'XPF', 'currencyName': 'CFP Franc', 'symbol': '₣'},
    {'countryCode': 'WS', 'currencyCode': 'WST', 'currencyName': 'Samoan Tala', 'symbol': 'WS\$'},
    {'countryCode': 'YE', 'currencyCode': 'YER', 'currencyName': 'Yemeni Rial', 'symbol': '﷼'},
    {'countryCode': 'YT', 'currencyCode': 'EUR', 'currencyName': 'Euro', 'symbol': '€'},
    {'countryCode': 'ZA', 'currencyCode': 'ZAR', 'currencyName': 'South African Rand', 'symbol': 'R'},
    {'countryCode': 'ZM', 'currencyCode': 'ZMW', 'currencyName': 'Zambian Kwacha', 'symbol': 'ZK'},
    {'countryCode': 'ZW', 'currencyCode': 'USD', 'currencyName': 'United States Dollar', 'symbol': '\$'}
  ];
}
