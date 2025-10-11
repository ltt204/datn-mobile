# ExpandableBox Option Field System

## Overview
A flexible, type-safe system for creating expandable option boxes with different field types. The system is designed to be easily extensible with new field types.

## Core Components

### 1. OptionFieldConfig (Base Class)
Abstract base class for all option field types.

```dart
abstract class OptionFieldConfig {
  final String label;
  final String? key;
  
  Widget build(BuildContext context);
}
```

### 2. Built-in Option Types

#### SelectionOption (Dropdown)
For selecting from a list of predefined options.

```dart
SelectionOption(
  label: 'Model',
  value: model,
  items: const ['Fast model', 'Balanced model', 'Accurate model'],
  onChanged: (v) => setState(() => model = v!),
)
```

#### TextInputOption
For single or multi-line text input.

```dart
TextInputOption(
  label: 'Description',
  controller: descriptionCtl,
  hint: 'Enter description...',
  maxLines: 3,
)
```

#### NumberInputOption
For numeric input (extends TextInputOption with number keyboard).

```dart
NumberInputOption(
  label: 'Age',
  controller: ageCtl,
  hint: 'Enter age',
  min: 0,
  max: 100,
)
```

#### SwitchOption
For boolean on/off toggle.

```dart
SwitchOption(
  label: 'Enable notifications',
  description: 'Receive push notifications',
  value: notificationsEnabled,
  onChanged: (v) => setState(() => notificationsEnabled = v),
)
```

#### SliderOption
For selecting a value from a range.

```dart
SliderOption(
  label: 'Volume',
  value: volume,
  min: 0,
  max: 100,
  divisions: 10,
  onChanged: (v) => setState(() => volume = v),
  valueFormatter: (v) => '${v.toInt()}%',
)
```

#### EmptyOption
For layout purposes (empty space in a row).

```dart
OptionRow(
  first: SelectionOption(...),
  second: const EmptyOption(), // Empty right side
)
```

### 3. OptionRow
Container for organizing 1 or 2 fields per row.

```dart
OptionRow(
  first: SelectionOption(...),   // Required
  second: SelectionOption(...),  // Optional
)
```

### 4. ExpandableBox
Main widget that uses the option system.

```dart
ExpandableBox(
  title: 'Options',
  showInfoDot: true,
  onInfoTap: () => print('Info'),
  collapsedOptions: [
    OptionRow(first: SelectionOption(...), second: SelectionOption(...)),
  ],
  expandedOptions: [
    OptionRow(first: TextInputOption(...)),
    OptionRow(first: SwitchOption(...)),
  ],
)
```

## Creating Custom Option Types

To add a new option type, extend `OptionFieldConfig`:

```dart
class ColorPickerOption extends OptionFieldConfig {
  final Color value;
  final ValueChanged<Color> onChanged;

  const ColorPickerOption({
    required super.label,
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Labeled(
      label: label,
      child: GestureDetector(
        onTap: () => _showColorPicker(context),
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            color: value,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey),
          ),
        ),
      ),
    );
  }
  
  void _showColorPicker(BuildContext context) {
    // Implementation...
  }
}
```

## Usage Examples

### Example 1: Basic Form
```dart
ExpandableBox(
  title: 'User Info',
  collapsedOptions: [
    OptionRow(
      first: TextInputOption(
        label: 'Name',
        controller: nameCtl,
        hint: 'Enter your name',
      ),
      second: TextInputOption(
        label: 'Email',
        controller: emailCtl,
        hint: 'Enter your email',
      ),
    ),
  ],
  expandedOptions: [
    OptionRow(
      first: NumberInputOption(
        label: 'Age',
        controller: ageCtl,
      ),
      second: SelectionOption(
        label: 'Country',
        value: country,
        items: const ['USA', 'UK', 'Canada'],
        onChanged: (v) => setState(() => country = v!),
      ),
    ),
  ],
)
```

### Example 2: Settings Panel
```dart
ExpandableBox(
  title: 'Settings',
  showInfoDot: false,
  collapsedOptions: [
    OptionRow(
      first: SwitchOption(
        label: 'Dark Mode',
        value: darkMode,
        onChanged: (v) => setState(() => darkMode = v),
      ),
    ),
  ],
  expandedOptions: [
    OptionRow(
      first: SliderOption(
        label: 'Font Size',
        value: fontSize,
        min: 12,
        max: 24,
        divisions: 12,
        onChanged: (v) => setState(() => fontSize = v),
      ),
    ),
    OptionRow(
      first: SwitchOption(
        label: 'Notifications',
        value: notifications,
        onChanged: (v) => setState(() => notifications = v),
      ),
    ),
  ],
)
```

## Benefits

✅ **Type-Safe** - Each option type has its own parameters  
✅ **Extensible** - Easy to add new field types  
✅ **Consistent UI** - All fields follow the same design language  
✅ **Theme-Aware** - Automatically adapts to light/dark mode  
✅ **Reusable** - Use same components across different pages  
✅ **Clean Code** - Declarative API reduces boilerplate  
✅ **Animated** - Smooth expand/collapse transitions  

## Architecture

```
ExpandableBox
├── collapsedOptions: List<OptionRow>
│   └── OptionRow
│       ├── first: OptionFieldConfig
│       └── second?: OptionFieldConfig
└── expandedOptions?: List<OptionRow>
    └── OptionRow
        ├── first: OptionFieldConfig
        └── second?: OptionFieldConfig

OptionFieldConfig (abstract)
├── SelectionOption
├── TextInputOption
│   └── NumberInputOption
├── SwitchOption
├── SliderOption
├── EmptyOption
└── [Your Custom Option]
```

## Best Practices

1. **Use EmptyOption** for single-field rows instead of leaving `second` null
2. **Group related fields** in the same OptionRow
3. **Keep labels concise** - use 1-3 words when possible
4. **Provide hints** for text inputs to guide users
5. **Use appropriate types** - don't use TextInput for selections
6. **Test on both themes** - ensure fields work in light and dark mode

## File Structure

```
lib/shared/widget/
├── option_field.dart        # All option types & OptionRow
├── expandable_box.dart      # Main container widget
├── labeled.dart             # Label wrapper
└── fake_dropdown.dart       # Dropdown component
```
