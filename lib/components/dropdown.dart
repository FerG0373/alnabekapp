import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class AppDropDown {
  // Método para insertar un Dropdown.
  static Widget insertarDropDown(List<String> items) {
    return DropdownSearch(
      items: (filter, loadProps) => items,
      decoratorProps: DropDownDecoratorProps(
        decoration: InputDecoration(
          labelText: "Tipo",
        ),
      ),
    );
  }
}