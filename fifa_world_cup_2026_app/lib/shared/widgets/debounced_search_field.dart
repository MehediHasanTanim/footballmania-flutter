import 'package:flutter/material.dart';

import '../../core/utils/debouncer.dart';

class DebouncedSearchField extends StatefulWidget {
  const DebouncedSearchField({
    super.key,
    required this.hintText,
    required this.onChanged,
    this.initialValue,
    this.onClear,
    this.debounceDuration = const Duration(milliseconds: 500),
  });

  final String hintText;
  final String? initialValue;
  final ValueChanged<String> onChanged;
  final VoidCallback? onClear;
  final Duration debounceDuration;

  @override
  State<DebouncedSearchField> createState() => _DebouncedSearchFieldState();
}

class _DebouncedSearchFieldState extends State<DebouncedSearchField> {
  late final TextEditingController _controller;
  late final Debouncer _debouncer;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue ?? '');
    _debouncer = Debouncer(delay: widget.debounceDuration);
  }

  @override
  void didUpdateWidget(covariant DebouncedSearchField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialValue != oldWidget.initialValue &&
        widget.initialValue != _controller.text) {
      _controller.text = widget.initialValue ?? '';
    }
  }

  @override
  void dispose() {
    _debouncer.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      onChanged: (value) => _debouncer(() => widget.onChanged(value)),
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefixIcon: const Icon(Icons.search),
        suffixIcon: _controller.text.isEmpty && widget.onClear == null
            ? null
            : IconButton(
                tooltip: 'Clear search',
                icon: const Icon(Icons.close),
                onPressed: () {
                  _debouncer.cancel();
                  _controller.clear();
                  widget.onChanged('');
                  widget.onClear?.call();
                  setState(() {});
                },
              ),
      ),
    );
  }
}
