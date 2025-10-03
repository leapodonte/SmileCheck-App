part of '../daily_reminder_timer.dart';

class _Body extends StatelessWidget {
  const _Body();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppGradients.smileCheckWeb),
        child: Center(child: BrushingTimer()),
      ),
    );
  }
}

class BrushingTimer extends StatefulWidget {
  const BrushingTimer({super.key});

  @override
  _BrushingTimerState createState() => _BrushingTimerState();
}

class _BrushingTimerState extends State<BrushingTimer> {
  static const int totalSeconds = 10;
  static const int segments = 8;
  static const int segmentDuration = totalSeconds ~/ segments;

  late _ScreenState timerState;
  List<String> brushingInstructions = [
    "Brush upper right outer teeth",
    "Brush upper front outer teeth",
    "Brush upper left outer teeth",
    "Brush upper inner teeth (left to right)",
    "Brush lower left outer teeth",
    "Brush lower front outer teeth",
    "Brush lower right outer teeth",
    "Brush lower inner teeth (right to left)",
  ];

  Timer? _timer;
  // int timerState.elapsedSeconds = 0;

  @override
  void initState() {
    super.initState();
    // timerState = _ScreenState.s(context, true);
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (timerState.elapsedSeconds >= totalSeconds) {
        final title = ModalRoute.of(context)!.settings.arguments as String;
        print(title);
        final email = BlocProvider.of<TeethBloc>(context).state.id;
        context.read<BrushingBloc>().add(UpdateTimer(email, title));
        timer.cancel();
      } else {
        // setState(() {
        timerState.elapsedSeconds++;
        // });
      }
    });
  }

  bool _isTimerStateInitialized = false;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isTimerStateInitialized) {
      timerState = _ScreenState.s(context, true);
      _isTimerStateInitialized = true;
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int currentSegment = timerState.elapsedSeconds ~/ segmentDuration;
    double currentSegmentProgress =
        (timerState.elapsedSeconds % segmentDuration) / segmentDuration;

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.paddingOf(context).bottom + 40,
        top: MediaQuery.paddingOf(context).top + 80,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              SvgPicture.asset('assets/clock.svg', height: 36.sp, width: 36.sp),
              Space.yf(30),
              Text(
                'Morning Check-in',

                style: AppTexts.h1b!.copyWith(
                  foreground: Paint()
                    ..shader = LinearGradient(
                      colors: <Color>[
                        AppColors.gradiantBlack,
                        AppColors.gradiantBlueSecond,
                        AppColors.buttonBlue,
                      ],
                    ).createShader(Rect.fromLTWH(0.0, 0.0, 300.0, 70.0)),
                ),
              ),
              Space.yf(33),

              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 126.r,
                child: Padding(
                  padding: EdgeInsetsGeometry.all(20),
                  child: Image.asset(
                    'assets/timerteeth${(currentSegment + 1) % 4}.png',
                  ),
                ),
              ),
              Space.yf(50),
              Text(
                formatTime(totalSeconds - timerState.elapsedSeconds),
                style: AppTexts.h2b!.copyWith(
                  fontSize: 64.h,
                  color: Colors.white,
                ),
              ),
              Space.yf(40),
              Text(
                "Step ${currentSegment + 1}",
                textAlign: TextAlign.center,
                style: AppTexts.h2b!.copyWith(
                  fontSize: 24.h,
                  color: Colors.white.withValues(alpha: .5),
                ),
              ),
              Text(
                brushingInstructions[currentSegment % segments],
                textAlign: TextAlign.center,
                style: AppTexts.h2!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.white.withValues(alpha: .8),
                ),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(segments, (index) {
              double fill = 0.0;
              if (index < currentSegment) {
                fill = 1.0;
              } else if (index == currentSegment) {
                fill = currentSegmentProgress;
              }

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Container(
                    width: 30.w,
                    height: 8.h,
                    decoration: BoxDecoration(
                      // border: Border.all(color: Colors.white),
                      color: Colors.white.withOpacity(0.5),
                    ),
                    child: FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: fill,
                      child: Container(color: Colors.white),
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  String formatTime(int seconds) {
    int min = seconds ~/ 60;
    int sec = seconds % 60;
    return '${min.toString().padLeft(2, '0')}:${sec.toString().padLeft(2, '0')}';
  }
}
