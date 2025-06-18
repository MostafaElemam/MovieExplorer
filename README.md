# 🎬 MovieExplorer
A small UIKit app to browse movies using TMDB API. Built with Clean Architecture + MVVM.

## 📱 Screens
- Movies List (with favorites)
- Movie Details

## 🔧 Tech Stack
- UIKit
- MVVM + Clean Architecture
- SDWebImage
- Alamofire
- Dependency Injection
- Dark Mode supported.

## 🏗️ Architecture
- Presentation: UIKit + ViewModels
- Domain: UseCases + Entities
- Data: Repository + Remote/Local Data Sources

## ⚖️ Tradeoffs & Decisions
- Used `UserDefaults` for favorite state for simplicity.
- Manual DI was chosen for control and simplicity.

