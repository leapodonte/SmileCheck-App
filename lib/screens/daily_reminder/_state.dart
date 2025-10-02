part of 'daily_reminder.dart';

class _ScreenState extends ChangeNotifier {
  static _ScreenState s(BuildContext context, [listen = false]) =>
      Provider.of<_ScreenState>(context, listen: listen);

  int _index = 3;
  set index(int v) {
    _index = v;
    notifyListeners();
  }

  int get index => _index;
}
