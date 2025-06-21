# Flexi Border

A Flutter package that lets you draw customizable borders on any subset of the four sides of a widget, with support for:

* **Solid** or **dashed** lines via `dashPattern`
* **Half** or **full** segment lengths (`BorderMode`) with optional `+/- offsets`
* **Per‐side start/end offsets** to tweak exactly where each segment begins and ends
* **Rounded corners** (when not using `customPath`), or manual corner arcs when you need full control

---

## 📦 Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  flexi_border: ^0.0.6
```

Then:

```bash
flutter pub get
```

Import in your Dart code:

```dart
import 'package:flexi_border/flexi_border.dart';
```

---

## 🚀 Usage

### Flutter Examples

#### 1️⃣ Corner Border

```dart
FlexiBorder(
                borderMode: BorderMode.full,
                topStartOffset:4.8,
                topEndOffset: -300/2,
                leftStartOffset:4.8,
                rightStartOffset: 4.8,
                bottomStartOffset: 4.8,
                bottomEndOffset: -300/2,
                strokeWidth: 1,
                dashPattern: [10,10],
                borderColor: Colors.white,

                child: Container(
                    width:300,
                    height:90,
                    decoration: BoxDecoration(
                      color:Colors.black,
                    ),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/hi.gif',
                          width: 70,
                          height:70,
                        ),
                        SizedBox(
                          width: 10,
                          height: 90
                        ),
                        Text("I'm Shanu",
                          style: TextStyle(
                            fontSize: 40,
                            color: Colors.white
                          ),
                        )
                      ],
                    ),
                  )
                      ),
```

#### 2️⃣ Evenly Dashed Border

```dart
FlexiBorder(
                borderMode: BorderMode.full,
                topStartOffset:4.8,
                topEndOffset: -300/2,
                leftStartOffset:4.8,
                rightStartOffset: 4.8,
                bottomStartOffset: 4.8,
                bottomEndOffset: -300/2,
                strokeWidth: 10,
                dashPattern: [6,1],
                borderColor: Colors.white,

                child: Container(
                    width:300,
                    height:90,
                    decoration: BoxDecoration(
                      color:Colors.black,
                    ),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/hi.gif',
                          width: 70,
                          height:70,
                        ),
                        SizedBox(
                          width: 10,
                          height: 90
                        ),
                        Text("I'm Shanu",
                          style: TextStyle(
                            fontSize: 40,
                            color: Colors.white
                          ),
                        )
                      ],
                    ),
                  )
                      ),
```

#### 3️⃣ Half Rectangle Side

```dart
FlexiBorder(
                borderMode: BorderMode.full,
                drawRight: false,
                topStartOffset:4.8,
                topEndOffset: -300/2,
                leftStartOffset:4.8,
                rightStartOffset: 4.8,
                bottomEndOffset: 4.8,
                bottomStartOffset: -300/2,
                strokeWidth: 2,
                dashPattern: [5,5],
                borderColor: Colors.white,

                child: Container(
                    width:300,
                    height:90,
                    decoration: BoxDecoration(
                      color:Colors.black,
                    ),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/hi.gif',
                          width: 70,
                          height:70,
                        ),
                        SizedBox(
                          width: 10,
                          height: 90
                        ),
                        Text("I'm Shanu",
                          style: TextStyle(
                            fontSize: 40,
                            color: Colors.white
                          ),
                        )
                      ],
                    ),
                  )
                      ),
```

---

## 🌐 Preview

### 1️⃣ Corner Border

![Solid Thick Border](example/screenshots/corner.png)

---

### 2️⃣ Evenly Dashed Border

![Dashed Medium Border](example/screenshots/dashed.png)

---

### 3️⃣ Half Rectangle Side

![Mixed-Style Border](example/screenshots/halfrect.png)

---

## 📖 API Reference

Import:

```dart
import 'package:flexi_border/flexi_border.dart';
```

### `FlexiBorder` Widget

| Property            | Type           | Default           | Description                                 |
| ------------------- | -------------- | ----------------- | ------------------------------------------- |
| `child`             | `Widget`       | **Required**      | The widget you're wrapping with the border. |
| `borderColor`       | `Color`        | `Colors.white`    | Color of the border line.                   |
| `dashPattern`       | `List<double>` | `[4,2]`           | `[dashLength, gapLength]`. `[]` = solid.    |
| `strokeWidth`       | `double`       | `1`               | Width of the border stroke.                 |
| `drawTop`           | `bool`         | `true`            | Whether to draw the top side.               |
| `drawRight`         | `bool`         | `true`            | Whether to draw the right side.             |
| `drawBottom`        | `bool`         | `true`            | Whether to draw the bottom side.            |
| `drawLeft`          | `bool`         | `true`            | Whether to draw the left side.              |
| `borderMode`        | `BorderMode`   | `BorderMode.full` | `.full` (100%) or `.half` (50%) + offset.   |
| `topStartOffset`    | `double`       | `0`               | Shift the top start X by this many px.      |
| `topEndOffset`      | `double`       | `0`               | Shift the top end X by this many px.        |
| `rightStartOffset`  | `double`       | `0`               | Shift the right start Y by this many px.    |
| `rightEndOffset`    | `double`       | `0`               | Shift the right end Y by this many px.      |
| `bottomStartOffset` | `double`       | `0`               | Shift the bottom start X by this many px.   |
| `bottomEndOffset`   | `double`       | `0`               | Shift the bottom end X by this many px.     |
| `leftStartOffset`   | `double`       | `0`               | Shift the left start Y by this many px.     |
| `leftEndOffset`     | `double`       | `0`               | Shift the left end Y by this many px.       |

### `BorderMode`

| Member                 | Description                       |
| ---------------------- | --------------------------------- |
| `BorderMode.full`      | Use full `child` width/height.    |
| `BorderMode.half`      | Use half of `child` width/height. |
| `BorderMode.half + 20` | Use half + 20px.                  |
| `BorderMode.full - 10` | Use full - 10px.                  |

---

## ✅ Contributing

PRs welcome! Feel free to open issues or submit pull requests on [GitHub](https://github.com/Shanu33/flexi_border).

---

## 📜 License

MIT © 2025 Shanu33

---

## ☕ Support Me

If you find my work useful, consider supporting me:

[![Buy Me a Coffee](https://img.shields.io/badge/Buy_Me_a_Coffee-FFDD00?style=for-the-badge&logo=buy-me-a-coffee&logoColor=black)](https://buymeacoffee.com/shahnawazsx)

```
```
