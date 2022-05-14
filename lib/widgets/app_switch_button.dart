import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class AppSwitchButton extends StatefulWidget {
  final ValueChanged<bool> onChanged;

  const AppSwitchButton({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<AppSwitchButton> createState() => _AppSwitchButtonState();
}

class _AppSwitchButtonState extends State<AppSwitchButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final Size switchSize = const Size(65, 25);

  Offset _dragOffset = Offset.zero;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragCancel: _onDragCancel,
      onHorizontalDragEnd: _onDragEnd,
      onHorizontalDragUpdate: _onDragUpdate,
      child: SizedBox.fromSize(
        size: switchSize,
        child: Neumorphic(
          style: NeumorphicStyle(
            shadowDarkColor: Colors.black.withOpacity(0.4),
            color: Colors.grey.withOpacity(0.3),
          ),
          child: Stack(
            children: [
              Positioned.fill(
                left: 6,
                right: 6,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "ON",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: Colors.red.shade600,
                      ),
                    ),
                    Text(
                      "OFF",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 3,
                top: 2,
                child: SizedBox.fromSize(
                  size: Size(switchSize.width * 0.5 - 3, switchSize.height - 4),
                  child: AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) => Transform.translate(
                      offset: Offset(
                          (switchSize.width - 6) *
                              0.5 *
                              _animationController.value,
                          0.0),
                      child: child,
                    ),
                    child: Neumorphic(
                      style: NeumorphicStyle(
                        color: const Color(0xFFEDEDED),
                        shadowDarkColor: Colors.black.withOpacity(0.4),
                      ),
                      child: Center(
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.30),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          width: 3,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onDragCancel() => _completeAnimation();

  void _onDragEnd(DragEndDetails details) => _completeAnimation();

  void _onDragUpdate(DragUpdateDetails details) {
    _dragOffset = details.localPosition;
    _computeAnimController();
  }

  void _computeAnimController() {
    try {
      double dragXPerc = (_dragOffset.dx / switchSize.width).clamp(0.0, 1.0);
      _animationController.value = dragXPerc;
    } catch (ex) {
      debugPrint(ex.toString());
    }
  }

  void _completeAnimation() {
    if (_animationController.value < 0.5) {
      _animationController.reverse().orCancel;
      widget.onChanged(false);
    } else {
      _animationController.forward().orCancel;
      widget.onChanged(true);
    }
  }
}
