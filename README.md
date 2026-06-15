<h1>📰 NewsHub</h1>

<p>
A simple and clean <b>Flutter News Application</b> that fetches the latest news using the
<b>NewsAPI (newsorg)</b>.  
The app is built using <b>BLoC</b> for state management, <b>MVVM</b> architecture, and
<b>Hive</b> for local storage (bookmarks).
</p>

<hr/>

<h2>🎥 App Demo</h2>

https://github.com/user-attachments/assets/09f42ba1-97f8-4eb5-b6ad-bee19875b86f

<p align="center">
  <i>Short demo showing authentication, news feed, article details, and bookmarks.</i>
</p>

<hr/>

<h2>🚀 Features</h2>
<ul>
  <li>Fetch latest news headlines using REST API</li>
  <li>Image carousel slider for top headlines</li>
  <li>Email & Password authentication (Firebase Auth)</li>
  <li>Bookmark news articles (offline support)</li>
  <li>Delete bookmarked articles</li>
  <li>Clean UI with smooth navigation</li>
  <li>Loading and error state handling using BLoC</li>
</ul>

<hr/>

<h2>🛠️ Tech Stack</h2>
<ul>
  <li><b>Flutter</b></li>
  <li><b>BLoC</b> (State Management)</li>
  <li><b>MVVM Architecture</b></li>
  <li><b>Firebase Authentication</b> (Email & Password)</li>
  <li><b>Hive</b> (Local Database)</li>
  <li><b>REST API</b></li>
  <li><b>NewsAPI (newsorg)</b></li>
</ul>

<hr/>

<h2>📂 Project Architecture</h2>
<pre>
lib/
├── bloc/
│   ├── events/
│   ├── states/
│   └── bloc_class/
├── model/
│   ├── remote/
│   └── local/
├── repository/
├── view/
│   ├── HomeScreen/
│   ├── BookmarkScreen/
│   └── detail_screen.dart
└── main.dart
</pre>

<hr/>

<h2>📡 API Used</h2>
<p>
<b>NewsAPI</b>  
<br/>
Website: https://newsapi.org/
</p>


<hr/>

<h2>⚙️ Setup & Installation</h2>

<ol>
  <li>Clone the repository</li>
</ol>

<pre>
git clone https://github.com/Shahid-tech964/News_App.git
</pre>

<ol start="2">
  <li>Install dependencies</li>
</ol>

<pre>
flutter pub get
</pre>


<ol start="3">
  <li>Run the app</li>
</ol>

<pre>
flutter run
</pre>

<hr/>

<h2>📦 Local Storage</h2>
<p>
The app uses <b>Hive</b> to store bookmarked news articles locally.
Bookmarks remain saved even after restarting the app.
</p>

<hr/>

<h2>🧠 State Management</h2>
<p>
<b>BLoC</b> is used to handle:
</p>
<ul>
  <li>API fetching</li>
  <li>Loading and error states</li>
  <li>Firebase authentication states</li>
  <li>Local Hive operations</li>
</ul>

<hr/>

<h2>📸 Screens</h2>
<ul>
  <li>Login & Signup Screen</li>
  <li>Home Screen (Top Headlines)</li>
  <li>News Detail Screen</li>
  <li>Bookmark Screen</li>
</ul>

<hr/>

<h2>📌 Future Improvements</h2>
<ul>
  <li>UI/UX enhancements with modern theming and animations</li>
  <li>Light & Dark mode support with dynamic theming</li>
  <li>Improved exception handling with user-friendly error messages</li>
  <li>Network connectivity detection and offline state handling</li>
  <li>News-related chatbot for article summaries and recommendations</li>
  <li>Better app security (API key protection, improved auth flow)</li>
  <li>Performance optimization and code refactoring</li>
  <li>Pagination and infinite scrolling</li>
  <li>Category-wise and search-based news filtering</li>
  <li>iOS support and platform-specific UI improvements</li>
</ul>

<hr/>

<h2>🤝 Contributing</h2>
<p>
Contributions are welcome!  
If you have ideas for improvements, bug fixes, or new features:
</p>
<ul>
  <li>Fork the repository</li>
  <li>Create a new branch</li>
  <li>Make your changes</li>
  <li>Submit a pull request</li>
</ul>

<p>
All contributions that improve code quality, performance, or user experience are appreciated.
</p>

<hr/>

<h2>⭐ Support</h2>
<p>
If you like this project, give it a ⭐ on GitHub!
</p>
