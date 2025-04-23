import 'dart:io';

import 'package:flutter/material.dart';
import 'package:open_maps_example/utils/debouncer.dart';

class SearchInput extends StatefulWidget {
  bool backgroundSearch;
  void Function(String)? onChanged;
  void Function()? onTap;
  void Function()? onPressed;
  SearchInput({
    super.key,
    this.backgroundSearch = false,
    this.onChanged,
    this.onTap,
    this.onPressed,
  });

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  final _debouncer = Debouncer(delay: Duration(milliseconds: 2000));
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, Platform.isIOS ? 70 : 50, 10, 0),
      child: TextFormField(
        onTap: widget.onTap,
        controller: searchController,
        cursorHeight: 12,
        style: TextStyle(fontSize: 12),
        decoration: InputDecoration(
          hintText: 'Realiza una búsqueda',
          prefixIcon:
              widget.backgroundSearch
                  ? IconButton(onPressed: widget.onPressed, icon: Icon(Icons.arrow_back))
                  : Icon(Icons.search),
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),

        onChanged: (value) {
          _debouncer.debounce(value, (val) {
            if (val == '') return;
            widget.onChanged!(val);
          });
        },
      ),
    );
  }
}
