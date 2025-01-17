# Flutter Navigation with GoRouter

This documentation explains how to set up and use `GoRouter` for navigation in your Flutter application.

---

## Step 1: Add GoRouter Dependency

Add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  go_router: ^14.2.0
```

Run the command:

```bash
flutter pub get
```
To use in your screens write this :
```
import 'package:go_router/go_router.dart';
```
---

## Step 2: Configure Routes

Create a file named `routers.dart` and configure your routes as follows For example:

```dart
import 'router_import.dart'; // Import dependencies using a single file. in that file you write all your imports using export keyword

class AppGoRouter {
  static GoRouter router = GoRouter(routes: [
    GoRoute(
      name: "splash",
      path: "/",
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: AppRouter.onBoarding,
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: AppRouter.privacyPolicy,
      builder: (context, state) => const PrivacyPolicyScreen(),
    ),
  ]);
}

abstract class AppRouter {
  AppRouter._();

  //------------------------ Common ------------------------------
  static const splash = '/';
  static const onBoarding = '/on-boarding';
  static const privacyPolicy = '/privacy-policy';

  //------------------------ User Side ---------------------------
  //--- Authentication ---
  static const userLogin = '/user-login';
  static const userForgotPass = '/user-forgot-password';
  static const userVerifyOtp = '/user-verify-otp';
  static const userCreatePass = '/user-create-pass';
  static const userWelcomeScreen = '/user-welcome';
}
```

---

## Step 3: Integrate GoRouter in `main.dart`

Update your `main.dart` file as follows:

```dart
@override
Widget build(BuildContext context) {
  return MaterialApp.router(
    routeInformationProvider: AppGoRouter.router.routeInformationProvider,
    routeInformationParser: AppGoRouter.router.routeInformationParser,
    routerDelegate: AppGoRouter.router.routerDelegate,
  );
}
```

---

## Step 4: Navigate to a Route

You can navigate to a route using the `context.go`, `context.push`, or other navigation methods provided by `GoRouter`.

### Example:
```dart
onPressed: () {
context.push(AppRouter.userLogin); // Navigate to the User Login screen
}
```

---

## Step 5: Explore GoRouter Methods

### Push Methods
- **`context.push`**: Adds a new route to the stack (like navigating forward).
- **`context.pushReplacement`**: Replaces the current route (removes it from the stack and pushes a new one).
- **`context.pushNamed`**: Pushes a named route with optional parameters and extra data.

### Go Methods
- **`context.go`**: Clears the stack and navigates to a new route (like a hard redirect).
- **`context.goNamed`**: Navigates to a named route with parameters and extra data, clearing the stack.

### Pop Methods
- **`context.pop`**: Removes the current route from the stack (like navigating backward).
- **`context.popWithResult`**: Pops the current route and returns data to the previous screen.
- **`context.popNamed`**: Pops routes until a specified named route is reached.

### Other Methods
- **`context.replace`**: Replaces the current route with another route.
- **`context.canPop`**: Checks if there are routes available to pop.

---

## When to Use

### Use `push`:
- For navigating forward while keeping history.
- When you know the exact path.
- For simpler routes without dynamic parameters.

### Use `pushNamed`:
- For routes with dynamic parameters or query parameters.
- To avoid hardcoding paths and reduce potential errors.

### Use `go`:
- For replacing the entire navigation stack.
- When implementing a hard redirect.

### Use `pop`:
- For navigating back or dismissing dialogs.

---

## Summary

The `GoRouter` package simplifies navigation in Flutter with powerful methods for pushing, replacing, and popping routes. By using named routes and dynamic parameters, you can create a maintainable and scalable navigation system.

For more details, refer to the [GoRouter Documentation](https://pub.dev/packages/go_router).
