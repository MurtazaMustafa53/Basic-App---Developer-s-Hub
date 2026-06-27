# Basic Flutter Utility App

A clean, responsive Flutter application built with an architecture separating reusable custom components (Models/UI kits), business/storage logic (Controllers), and application screens (Views).

## 🚀 Features

* **Secure Authentication Portal:** A centralized login workflow verifying strict format requirements via a dedicated validation engine.
* **Dynamic Dashboard Hub:** An optimized visual matrix routing interaction seamlessly across individual app modules.
* **Persistent State Management Metrics:**
    * **Counter Application:** A relative integer tracker managing asynchronous data writes dynamically.
    * **To-Do Lists Organizer:** An optimized runtime array workflow managing data push, selective pop operations, and state reconciliation across hardware recycles.

---

## 🛠️ Project Design & File Matrix

```text
lib/
│
├── Controller/
│   ├── counterController.dart   # Controls state persistence for runtime integers
│   └── TodolistController.dart  # Controls state mutation for saved task strings
│
├── Model/
│   ├── Custombutton.dart        # Reusable global design button template
│   ├── Customcard.dart          # High-performance grid navigation block
│   ├── Customtextformfield.dart # Encapsulated form layout field mapping parameters
│   └── Validation.dart          # Isolated data format checking formulas
│
├── View/
│   ├── HomePage.dart            # Main Dashboard screen layout grid
│   ├── Counterpage.dart         # Integer step increment rendering UI
│   └── TodoListpage.dart        # Reactive task workflow tracking view
│
└── main.dart                    # Application structural entry point config