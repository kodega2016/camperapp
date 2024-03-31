import 'package:bootcamp_detail/bootcamp_details.dart';
import 'package:bootcamp_list/bootcamp_list.dart';
import 'package:bootcamp_repository/bootcamp_repository.dart';
import 'package:camper_app/src/go_router_refresh_stream.dart';
import 'package:camper_app/src/injection_container.dart';
import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:profile_menu/profile_menu.dart';
import 'package:sign_in/sign_in.dart';
import 'package:user_repository/user_repository.dart';

enum AppRoute {
  home,
  signIn,
  bootcamp,
}

GoRouter goRouter({
  required UserRepository userRepository,
}) {
  return GoRouter(
    initialLocation: "/",
    debugLogDiagnostics: true,
    refreshListenable: GoRouterRefreshStream(userRepository.userStream),
    redirect: (context, state) async {
      final isLoggedIn = await userRepository.checkUserAndSetUser();
      if (!isLoggedIn && state.path != "/login") {
        return "/login";
      }

      if (state.path == "/") {
        return "";
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        name: AppRoute.home.name,
        builder: (context, state) => HomeScreen(
          userRepository: sl<UserRepository>(),
        ),
        routes: [
          GoRoute(
            path: 'bootcamp/:id',
            name: AppRoute.bootcamp.name,
            builder: (context, state) => BootcampDetailsScreen(
              bootcampId: state.pathParameters['id'] ?? "",
              bootCampRepository: sl<BootCampRepository>(),
            ),
          ),
        ],
      ),
      GoRoute(
        path: '/login',
        name: AppRoute.signIn.name,
        builder: (context, state) => SignInScreen(
          userRepository: userRepository,
          onSignedIn: () {
            context.go('/');
          },
        ),
      ),
    ],
  );
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.userRepository});
  final UserRepository userRepository;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> getPages() {
    return [
      BootcampListScreen(
        bootCampRepository: sl<BootCampRepository>(),
        onBootcampSelected: (bootcamp) {
          context.go('/bootcamp/${bootcamp.id}');
        },
      ),
      BootcampListScreen(
        bootCampRepository: sl<BootCampRepository>(),
        onBootcampSelected: (bootcamp) {},
      ),
      ProfileMenuScreen(
        onSignOut: () {
          widget.userRepository.logout();
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Ionicons.apps_outline),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.school_outline),
            label: 'Courses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
      body: getPages()[_selectedIndex],
    );
  }
}
