part of 'daily_reminder_timer.dart';

class _ScreenState extends ChangeNotifier {
  static _ScreenState s(BuildContext context, [listen = false]) =>
      Provider.of<_ScreenState>(context, listen: listen);

  int _elapsedSeconds = 0;
  bool _morningIsDone = false;
  bool _eveningIsDone = false;

  set elapsedSeconds(int v) {
    _elapsedSeconds = v;
    notifyListeners();
  }

  int get elapsedSeconds => _elapsedSeconds;

  set morningIsDone(bool v) {
    _morningIsDone = v;
    notifyListeners();
  }

  bool get morningIsDone => _morningIsDone;
  set eveningIsDone(bool v) {
    _eveningIsDone = v;
    notifyListeners();
  }

  bool get eveningIsDone => _eveningIsDone;
}
