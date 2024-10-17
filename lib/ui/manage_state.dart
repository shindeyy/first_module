import 'package:flutter/material.dart';

//Self manage state
class TapboxA extends StatefulWidget {
  const TapboxA({super.key});

  @override
  State<TapboxA> createState() => _TapboxAState();
}

class _TapboxAState extends State<TapboxA> {
  bool _isActive = false;

  void _handelTap() {
    setState(() {
      _isActive = !_isActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handelTap,
      child: Container(
        decoration: BoxDecoration(
            color: _isActive ? Colors.lightGreen[700] : Colors.grey[600]),
        child: Center(
            child: Column(
          children: [
            Text(
              _isActive ? 'Active' : 'Inactive',
              style: const TextStyle(fontSize: 32, color: Colors.white),
            ),
            const Text(
              'Self manage state',
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
          ],
        )),
      ),
    );
  }
}

//Parent manage state
class ParentWidget extends StatefulWidget {
  const ParentWidget({super.key});

  @override
  State<ParentWidget> createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _isActive = false;
  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _isActive = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            child: TapboxB(
          active: _isActive,
          onChanged: _handleTapboxChanged,
        )),
        const SizedBox(height: 10),
        SizedBox(
            child: TapboxC(
          active: _isActive,
          onChanged: _handleTapboxChanged,
        )),
      ],
    );
  }
}

class TapboxB extends StatelessWidget {
  const TapboxB({super.key, this.active = false, required this.onChanged});

  final bool active;
  final ValueChanged<bool> onChanged;

  void _handleTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        decoration: BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
        child: Center(
            child: Column(
          children: [
            Text(
              active ? 'Active' : 'Inactive',
              style: const TextStyle(fontSize: 22, color: Colors.white),
            ),
            const Text(
              'Parent State',
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
          ],
        )),
      ),
    );
  }
}

//mix-and-match state

class TapboxC extends StatefulWidget {
  const TapboxC({
    super.key,
    this.active = false,
    required this.onChanged,
  });

  final bool active;
  final ValueChanged<bool> onChanged;

  @override
  State<TapboxC> createState() => _TapboxCState();
}

class _TapboxCState extends State<TapboxC> {
  bool _highlight = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap() {
    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    // This example adds a green border on tap down.
    // On tap up, the square changes to the opposite state.
    return GestureDetector(
      onTapDown: _handleTapDown, // Handle the tap events in the order that
      onTapUp: _handleTapUp, // they occur: down, up, tap, cancel
      onTap: _handleTap,
      onTapCancel: _handleTapCancel,
      child: Container(
        decoration: BoxDecoration(
          color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          border: _highlight
              ? Border.all(
                  color: Colors.teal[700]!,
                  width: 10,
                )
              : null,
        ),
        child: Center(
            child: Column(
          children: [
            Text(widget.active ? 'Active' : 'Inactive',
                style: const TextStyle(fontSize: 32, color: Colors.white)),
            const Text('mix-and-match-state',
                style: TextStyle(fontSize: 14, color: Colors.white))
          ],
        )),
      ),
    );
  }
}
