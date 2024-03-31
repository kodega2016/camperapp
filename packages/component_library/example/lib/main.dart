import 'package:component_library/component_library.dart';
import 'package:example/src/screens/auth/forgot_password.dart';
import 'package:example/src/screens/auth/login_screen.dart';
import 'package:example/src/screens/auth/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var lightTheme = WidgetbookTheme(name: 'Light', data: ThemeData.light());
    return Widgetbook.material(
      addons: [
        DeviceFrameAddon(
          devices: Devices.all,
          initialDevice: Devices.ios.iPhone13ProMax,
        ),
        AlignmentAddon(),
        ThemeAddon(
          themes: [
            lightTheme,
            WidgetbookTheme(name: 'Dark', data: ThemeData.dark())
          ],
          initialTheme: lightTheme,
          themeBuilder: (context, ThemeData theme, child) =>
              Theme(data: theme, child: child),
        ),
      ],
      directories: [
        WidgetbookFolder(
          isInitiallyExpanded: false,
          name: "Screens",
          children: [
            WidgetbookComponent(
              name: 'Auth',
              useCases: [
                WidgetbookUseCase(
                  name: 'LoginScreen',
                  builder: (context) => const LoginScreen(),
                ),
                WidgetbookUseCase(
                  name: 'RegisterScreen',
                  builder: (context) => const RegisterScreen(),
                ),
                WidgetbookUseCase(
                  name: 'ForgotPasswordScreen',
                  builder: (context) => const ForgotPasswordScreen(),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'SelectField',
              useCases: [
                WidgetbookUseCase(
                  name: 'Checkbox',
                  builder: (context) => PCheckBox(
                    value: false,
                    onChanged: (value) {
                      debugPrint('Checkbox value: $value');
                    },
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Checkbox with label',
                  builder: (context) => PCheckBox(
                    label: 'Remember me',
                    value: false,
                    onChanged: (value) {
                      debugPrint('Checkbox value: $value');
                    },
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'FilledButton',
              useCases: [
                WidgetbookUseCase(
                  name: 'FilledButton',
                  builder: (context) => PFilledButton(
                    label: "Let's get started",
                    onPressed: () {},
                  ),
                ),
                WidgetbookUseCase(
                  name: 'FilledButton with icon',
                  builder: (context) => PFilledButton(
                    label: "Let's get started",
                    icon: const Icon(Icons.arrow_forward),
                    onPressed: () {},
                  ),
                ),
                WidgetbookUseCase(
                  name: 'FilledButton in progress',
                  builder: (context) => PFilledButton.inProgress(
                    label: "Let's get started",
                  ),
                ),
              ],
            ),
          ],
        ),
        WidgetbookFolder(
          isInitiallyExpanded: false,
          name: "Other Components",
          children: [
            WidgetbookComponent(
              name: 'Badge',
              useCases: [
                WidgetbookUseCase(
                  name: 'Badge',
                  builder: (context) => const PBadge(
                    label: Text("New product available"),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'ChoiceChip',
                  builder: (context) => PChoiceChip(
                    label: "Agree to terms",
                    selected: false,
                    onSelected: (value) {
                      debugPrint('Selected: $value');
                    },
                  ),
                ),
                WidgetbookUseCase(
                  name: 'ChoiceChip with avatar',
                  builder: (context) => PChoiceChip(
                    label: "Agree to terms",
                    selected: false,
                    avatar: const Icon(Icons.check),
                    onSelected: (value) {
                      debugPrint('Selected: $value');
                    },
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Card',
                  builder: (context) => const PCard(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          title: Text('Flutter and Firebase'),
                          subtitle: Text('Build a complete app'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
