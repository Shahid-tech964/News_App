<h1>📰 Flutter News App</h1>

<p>
A simple and clean <b>Flutter News Application</b> that fetches the latest news using the
<b>NewsAPI (newsorg)</b>.  
The app is built using <b>BLoC</b> for state management, <b>MVVM</b> architecture, and
<b>Hive</b> for local storage (bookmarks).
</p>

<hr/>

<h2>🚀 Features</h2>
<ul>
  <li>Fetch latest news headlines using REST API</li>
  <li>Image carousel slider for top headlines</li>
  <li>Bookmark news articles (offline support)</li>
  <li>Delete bookmarked articles</li>
  <li>Clean UI with smooth navigation</li>
  <li>Error and loading state handling</li>
</ul>

<hr/>

<h2>🛠️ Tech Stack</h2>
<ul>
  <li><b>Flutter</b></li>
  <li><b>BLoC</b> (State Management)</li>
  <li><b>MVVM Architecture</b></li>
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

<p>
You need to generate your own API key and add it to the project.
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
  <li>Add your NewsAPI key</li>
</ol>

<p>
Update the API key inside your API service file.
</p>

<ol start="4">
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
  <li>Local Hive operations</li>
</ul>

<hr/>

<h2>📸 Screens</h2>
<ul>
  <li>Home Screen (Top Headlines)</li>
  <li>News Detail Screen</li>
  <li>Bookmark Screen</li>
</ul>

<hr/>

<h2>📌 Future Improvements</h2>
<ul>
  <li>Search news functionality</li>
  <li>Category-wise news</li>
  <li>Dark mode</li>
  <li>Pagination</li>
</ul>

<hr/>



<hr/>

<h2>⭐ Support</h2>
<p>
If you like this project, give it a ⭐ on GitHub!
</p>
