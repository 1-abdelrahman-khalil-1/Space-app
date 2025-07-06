


# 🚀 Space App

A Flutter application that displays the latest NASA news fetched from the [NASA]((https://api.nasa.gov/planetary/apod)).  
The app features a modern UI with news cards, allowing users to tap on a news item to open its full article in the browser.  
Inspired by the NASA app, this project aims to provide an engaging way to stay updated with space exploration news.

---

## ✨ Features

- **Fetch NASA News**: Retrieves the latest news from NASA's Breaking News RSS Feed.
- **Modern UI**: Displays news in elegant cards with titles, descriptions, dates, and placeholder images using `flutter_screenutil` for responsive design and `cached_network_image` for efficient image loading.
- **Browser Integration**: Tapping a news card opens the full article in the device's default browser using `url_launcher`.
- **Responsive Design**: Supports both featured and standard news cards with different aspect ratios (`16:9` for featured, `16:10` for standard).
- **Error Handling**: Shows loading indicators and error messages if news fetching fails.

---

## 📸 Screenshots
![Screenshot_1751820504](https://github.com/user-attachments/assets/6b02ca4a-535d-4d90-b334-2815fce64a34)
![Screenshot_1751820519](https://github.com/user-attachments/assets/ac31a616-6a17-4fcd-b946-b5d9c462b1a4)
![Screenshot_1751821333](https://github.com/user-attachments/assets/74d96bcc-52f3-407c-bc91-053f6e10a408)
![Screenshot_1751821041](https://github.com/user-attachments/assets/0f482027-eb96-48b5-8fe0-35abaf7a1645)
![Screenshot_1751820523](https://github.com/user-attachments/assets/1a8de40a-a2f4-4d9d-b454-7f5d46893f87)
![Screenshot_1751820530](https://github.com/user-attachments/assets/2539e529-69d1-4486-819e-f608411a792e)


---

## 🚀 Getting Started

### 🧪 Installation

#### 1. Clone the Repository

```bash
git clone https://github.com/1-abdelrahman-khalil-1/Space-app.git
cd Space-app
```

#### 2. Install Dependencies

Make sure the following dependencies exist in your `pubspec.yaml`:

```

Then run:

```bash
flutter pub get
```


#### 4. Run the App

```bash
flutter run
```

---

## 🗂 Project Structure

```plaintext
lib/
├── core/
│   └── utils/
│ 
├── features/
│   └── screen/
│       ├── data/
│       │   └── models/
│       │   └── repo/
│       └── presentation/
│           └── cubit
|            └── view
│               └── widgets/
│               
├── main.dart                             # Entry point

```

---

---

## ⚙️ How It Works

1. The app fetches news from [NASA's RSS Feed](https://www.nasa.gov/rss/dyn/breaking_news.rss).
2. News items are parsed into a `NewsModel` (title, description, link, date).
3. Displayed using a `NewsCard` widget. The first item is marked as `isFeatured`.
4. Tapping a news card opens the article in the browser using `url_launcher`.

---

