Special Days App

Special Days App is a SwiftUI-based application that allows users to view and manage special days, such as holidays or personal important dates. It includes features for localization, searching, and adding custom special days.

Features

🌍 Country Selection: Choose between Turkey, USA, and Germany to display country-specific special days.
🔎 Search Bar: Easily search through special days by name or date.
📅 Add Personal Special Days: Users can add their own important dates.
🎨 Smooth Animations: User interactions include smooth animations for a better experience.
🌟 Localization: Dynamic text and UI elements change based on the selected country.
🗂 Persist Data: Personal special days are stored and can be managed within the app.
Technologies Used

SwiftUI: For building the user interface.
SwiftData: For managing data storage and retrieval.
AppStorage: For persistent storage of user preferences.
Combine: For managing state and reactive programming.
NSAttributedString: For parsing and handling RTF files.
Foundation: Core utilities for date handling and localization.
Screenshots

Add screenshots of your app here to showcase its UI and features.

Getting Started

Prerequisites
Xcode Version: 14.0 or higher
iOS Version: 16.0 or higher
Swift Version: 5.7 or higher
Installation
Clone the repository:
git clone https://github.com/yourusername/special-days-app.git
Open the project in Xcode:
cd special-days-app
open SpecialDaysApp.xcodeproj
Build and run the app on the simulator or a physical device.
Usage

Country Selection:
Use the arrow buttons to switch between countries (Turkey, USA, Germany).
The UI dynamically updates based on the selected country.
Search Special Days:
Use the search bar to filter special days by name or date.
Add Custom Special Days:
Input a name and select a date to add your own important day.
The added days will be displayed in the "My Special Days" section.
Delete Special Days:
Swipe left on an item in the list to delete it.
Project Structure

RootView: Entry point of the app containing the TabView.
SpecialDaysView: Displays special days for the selected country.
MySpecialDaysView: Allows users to manage their personal special days.
SpecialDaysViewModel: Handles data logic and localization for the app.
AddDaysModel: Model for storing user-added special days.
ModelRTF: Model for parsing and managing special days from RTF files.
Contribution

Contributions are welcome! If you want to improve this app:

Fork the repository.
Create a new branch for your feature or bugfix:
git checkout -b feature-name
Commit your changes:
git commit -m "Add your message here"
Push the branch:
git push origin feature-name
Open a pull request.
License

This project is licensed under the MIT License. See the LICENSE file for details.
