import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController textController;
  final Function(String) onSearch;

  const SearchTextField({
    super.key,
    required this.textController,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: textController,
            cursorColor: Colors.black,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(18),
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: IconButton(
                  icon: const Icon(Icons.search, color: Colors.black),
                  onPressed: () {
                    onSearch(textController.text);
                  },
                  padding: const EdgeInsets.all(12),
                ),
              ),
              hintText: 'Search by food name',
              hintStyle: TextStyle(
                fontSize: 15,
                color: Colors.grey[800],
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
              focusedBorder: const OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}
