# rafia_cake_tech

A new Flutter project

## Goals:
a create 3 pages: 1 create_pin_screen, 2 confirm_pin_screen 3 authenticate_screen

## 1 Create PIN screen:
   1 This Create PIN page allows user to enter digits to create the pin
   2 Has four indicators
   3 Allows only four digits to be entered
   4 upon entering the fourth digit, the user is navigated to Re-enter PIN page


## 2 Confirm PIN screen:

   1 This Re-enter PIN page allows user to enter digits to create the pin
   2 Has four indicators
   3 Allows only four digits to be entered
   4 upon entering the fourth digit, the user is navigated to Menu page
   5 Uses BlocConsumer for Listening states and Building the required widget, CupertinoAlertDialog 
   6 Bloc method is invoked to store data in Hive db
   7 CupertinoAlertDialog shows either Success message or Error message
   8 Error message is shown when Re-entered PIN doesn't match with the Created PIN

## 3 Authenticate PIN Screen:
   1 This Enter PIN page allows user to enter digits to create the pin
   2 Has four indicators
   3 Allows only four digits to be entered
   4 upon entering the fourth digit, the user is shown a CupertinoAlertDialog 
   5 Uses BlocConsumer for Listening states and Building the required widget, CupertinoAlertDialog 
   6 Bloc methods are invoked for getting Hive db data for matching Entered PIN
   7 CupertinoAlertDialog shows either Success message or Error message
   8 Error message is shown when Entered PIN doesn't match with the PIN stored in Hive db

## Navigation:
On Generate Route management

## State Management: 
Bloc 

## Local Database:
Hive





A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutterdev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutterdev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutterdev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference
