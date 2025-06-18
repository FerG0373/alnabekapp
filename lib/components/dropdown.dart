import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class AppDropDown {
  // Método para insertar un Dropdown.
  static Widget insertarDropDown(List<String> items, {String? selectedValue, ValueChanged<String?>? onChanged}) {
    return DropdownSearch<String>(
      items: (filter, loadProps) => items,
      selectedItem: selectedValue,
      onChanged: onChanged,
      decoratorProps: DropDownDecoratorProps(
        decoration: InputDecoration(
          labelText: "Tipo",
        ),
      ),
    );
  }
}