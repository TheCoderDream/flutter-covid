import 'package:flutter/material.dart';

class CDropDown extends StatelessWidget {
  final List<String> countries;
  final String country;
  final void Function(String?) onChanged;

  CDropDown(
      {Key? key,
      required this.countries,
      required this.country,
      required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      height: 40,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(30)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: country,
          items: _buildDropdownItems(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> _buildDropdownItems() {
    return countries
        .map((e) => DropdownMenuItem(
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 12,
                    child: Image.asset(
                      'assets/images/${e.toLowerCase()}_flag.png',
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    e,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
              value: e,
            ))
        .toList();
  }
}
