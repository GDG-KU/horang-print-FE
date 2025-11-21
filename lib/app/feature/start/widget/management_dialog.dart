import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:horang_print/app/extension/build_context_x.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ManagementDialog extends StatefulWidget {
  const ManagementDialog({super.key});

  @override
  State<ManagementDialog> createState() => _ManagementDialogState();
}

class _ManagementDialogState extends State<ManagementDialog> {
  String _inputPin = '';

  void _onNumberPress(String number) {
    if (_inputPin.length < 4) {
      setState(() {
        _inputPin += number;
      });
    }
    if (_inputPin.length == 4) {
      if (_inputPin == "2580") {
        Navigator.of(context).pop(true);
      } else {
        Navigator.of(context).pop(false);
      }
    }
  }

  void _onDeletePress() {
    if (_inputPin.isNotEmpty) {
      setState(() {
        _inputPin = _inputPin.substring(0, _inputPin.length - 1);
      });
    }
  }

  void _onClearPress() {
    setState(() {
      _inputPin = '';
    });
  }

  Widget _buildKeypadButton(String text, VoidCallback onPressed) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: SizedBox(
          height: 60,
          child: ShadButton.secondary(
            onPressed: onPressed,
            child: Text(text, style: const TextStyle(fontSize: 24)),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ShadDialog(
      title: const Text('관리자 모드 진입'),
      description: const Text('관리자 비밀번호를 입력해주세요.'),
      child: SizedBox(
        width: 300,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 20),
            // PIN Display
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index < _inputPin.length
                        ? context.colorScheme.primary
                        : context.colorScheme.secondary,
                  ),
                );
              }),
            ),
            const SizedBox(height: 30),
            // Keypad
            Row(
              children: [
                _buildKeypadButton('1', () => _onNumberPress('1')),
                _buildKeypadButton('2', () => _onNumberPress('2')),
                _buildKeypadButton('3', () => _onNumberPress('3')),
              ],
            ),
            Row(
              children: [
                _buildKeypadButton('4', () => _onNumberPress('4')),
                _buildKeypadButton('5', () => _onNumberPress('5')),
                _buildKeypadButton('6', () => _onNumberPress('6')),
              ],
            ),
            Row(
              children: [
                _buildKeypadButton('7', () => _onNumberPress('7')),
                _buildKeypadButton('8', () => _onNumberPress('8')),
                _buildKeypadButton('9', () => _onNumberPress('9')),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: SizedBox(
                      height: 60,
                      child: ShadButton.ghost(
                        onPressed: _onClearPress,
                        child: const Text('C', style: TextStyle(fontSize: 20)),
                      ),
                    ),
                  ),
                ),
                _buildKeypadButton('0', () => _onNumberPress('0')),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: SizedBox(
                      height: 60,
                      child: ShadButton.ghost(
                        onPressed: _onDeletePress,
                        child: const Icon(Icons.backspace_outlined),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
