import 'package:flutter/material.dart';

class WidgetDropDown<T> extends StatelessWidget {
  final List<DropdownMenuItem<T>> items;
  final Function(T?)? onChanged;
  final Widget? child;
  final T? value;
  final Widget? hint;
  const WidgetDropDown({
    super.key,
    required this.items,
    this.onChanged,
    this.child,
    this.value,
    this.hint,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double widthSize = size.width;
    double heightSize = size.height;
    return Container(
      width: widthSize * 0.872,
      height: widthSize * 0.144,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffE7E6F8), width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          hint: hint,
          value: value,
          icon: Icon(
            Icons.arrow_drop_down_outlined,
            color: Colors.grey[400],
          ),
          elevation: 16,
          style: const TextStyle(color: Colors.deepPurple),
          items: items,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
