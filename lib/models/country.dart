class Country {
  final String name;
  final String flagEmoji;

  Country({required this.name, required this.flagEmoji});
}

final List<Country> countries = [
  Country(name: 'China', flagEmoji: '🇨🇳'),
  Country(name: 'United States', flagEmoji: '🇺🇸'),
  Country(name: 'France', flagEmoji: '🇫🇷'),
  Country(name: 'Japan', flagEmoji: '🇯🇵'),
  Country(name: 'United Kingdom', flagEmoji: '🇬🇧'),
  Country(name: 'Germany', flagEmoji: '🇩🇪'),
];
