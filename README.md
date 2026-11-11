<div align="center">

# 🧠 RefalABBrainfuck

**Интерпретатор [Brainfuck](https://ru.wikipedia.org/wiki/Brainfuck), написанный на [РефалАБ](https://github.com/Aleksandr3Bocharov/refalab)**

[![Лицензия: BSL-1.0](https://img.shields.io/badge/лицензия-BSL--1.0-blue.svg)](LICENSE_1_0.txt)
[![РефалАБ](https://img.shields.io/badge/РефалАБ-2.1+-orange.svg)](https://github.com/Aleksandr3Bocharov/refalab)
[![Компилятор](https://img.shields.io/badge/компилятор-Clang-lightgrey.svg)](https://clang.llvm.org/)
[![Платформы](https://img.shields.io/badge/платформы-Windows%20%7C%20Linux%20%7C%20macOS-success.svg)](#-сборка-и-запуск)

[Возможности](#-возможности) •
[Требования](#-требования) •
[Сборка и запуск](#-сборка-и-запуск) •
[Примеры](#-примеры-программ) •
[Структура](#-структура-проекта)

</div>

---

Программа **RefalABBrainfuck** читает исходный файл с кодом на Brainfuck и интерпретирует его. Проект показывает, что на РефалАБ можно писать интерпретаторы, и при этом остаётся полноценным рабочим инструментом.

## ✨ Возможности

| | |
| :--- | :--- |
| 🖥️ **Консольная версия** | Классический интерпретатор с вводом/выводом через стандартные потоки |
| 🪟 **GUI версия** | Графический интерфейс на [raylib](https://www.raylib.com/) и [raygui](https://github.com/raysan5/raygui) |
| 📄 **Запуск из файла** | Интерпретация Brainfuck-программ из исходных файлов |
| 📚 **Коллекция примеров** | Классические программы в папке [`examples`](examples) |
| 🔤 **Поддержка кириллицы** | В GUI используется шрифт DejaVu |

## 📋 Требования

### Для обеих версий

- **РефалАБ** версии **2.1** или выше;
- компилятор C **Clang**;
- настроенные переменные окружения (см. [документацию РефалАБ](https://github.com/Aleksandr3Bocharov/refalab)):

| Переменная | Назначение |
| :--- | :--- |
| `REFALABBIN` | путь к исполняемым файлам РефалАБ |
| `REFALABCFLAGS` | флаги компилятора C |
| `REFALABINCLUDE` | путь к заголовочным файлам |
| `REFALABLFLAGS` | флаги компоновщика |

### Дополнительно для GUI версии

**raylib 5.5**

<details>
<summary><b>🪟 Windows</b></summary>

1. Скачайте [raylib 5.5 для Windows x64](https://github.com/raysan5/raylib/releases/download/5.5/raylib-5.5_win64_mingw-w64.zip) или [для Windows x86](https://github.com/raysan5/raylib/releases/download/5.5/raylib-5.5_win32_mingw-w64.zip) (mingw-w64);
2. Распакуйте архив в любую директорию;
3. В `make_run_gui.bat` замените путь в строке на свой:

```bat
set RAYLIB=F:\Programming\raylib-5.5_win64_mingw-w64
```

</details>

<details>
<summary><b>🐧 POSIX (Linux / macOS)</b></summary>

Установите raylib через пакетный менеджер, например для Ubuntu:

```sh
apt install libraylib-dev
```

Скрипт сборки использует системные библиотеки.

</details>

**raygui** уже включён в проект (`src/raygui/`), отдельная установка не нужна.

## 🚀 Сборка и запуск

| | Консольная версия | GUI версия |
| :--- | :--- | :--- |
| **Windows** | `make_run.bat program.b` | `make_run_gui.bat` |
| **POSIX** | `./make_run program.b` | `./make_run_gui` |

### Консольная версия

Скрипт компилирует исходники РефалАБ и C, создаёт `bin/refalabbrainfuck` и запускает его с указанным файлом.

```sh
./make_run examples/hello1.b          # POSIX
make_run.bat examples\hello1.b        # Windows
```

Вывод:

```text
Интерпретатор языка программирования Brainfuck на РефалАБ.

Программа "RefalABBrainfuck" интерпретирует код на языке Brainfuck из исходного файла.

Открытие исходного файла "examples/hello1.b" с кодом на языке программирования Brainfuck.

Запуск интерпретатора кода на языке программирования Brainfuck.
Hello World!
```

> [!NOTE]
> Программа принимает ровно один аргумент — имя существующего файла с Brainfuck-кодом.

**Коды ошибок**

| Код | Причина |
| :---: | :--- |
| `9` | неправильный синтаксис командной строки |
| `19` | исходный файл не существует |
| `29` | ошибка открытия файла |
| `99` | синтаксические ошибки в Brainfuck-коде |

**Повторный запуск без перекомпиляции** (быстрее):

```sh
./bin/refalabbrainfuck program.b          # POSIX
bin\refalabbrainfuck.exe program.b        # Windows
```

### GUI версия

```sh
./make_run_gui          # POSIX
make_run_gui.bat        # Windows
```

Окно 1024×360 пикселей, 60 FPS, поддержка кириллицы.

**Горячие клавиши**

| Действие | Клавиши | Кнопка |
| :--- | :---: | :--- |
| Выбрать файл с Brainfuck-кодом | `Ctrl+O` | «Открыть файл» |
| Запустить интерпретатор | `Ctrl+R` | «Запустить интерпретатор» |
| Подтвердить в диалоге | `Enter` | «ОК» / «Да» |
| Отменить в диалоге | `Escape` | «Нет» |

**Порядок работы**

1. Запустите программу;
2. Откройте файл с кодом (`Ctrl+O`);
3. Запустите интерпретатор (`Ctrl+R`);
4. Просмотрите результат.

**Ошибки и выход**

- При синтаксических ошибках открывается диалог со списком ошибок, его можно прокручивать стрелками вверх/вниз;
- при закрытии окна появляется запрос подтверждения: «Да» или `Enter` — выйти, «Нет» или `Escape` — остаться.

**Повторный запуск без перекомпиляции:**

```sh
./bin/refalabbrainfuck_gui          # POSIX
bin\refalabbrainfuck_gui.exe        # Windows
```

## 🔣 Команды Brainfuck

| Команда | Описание |
| :---: | :--- |
| `>` | переместить указатель памяти вправо |
| `<` | переместить указатель памяти влево |
| `+` | увеличить значение в текущей ячейке |
| `-` | уменьшить значение в текущей ячейке |
| `.` | вывести символ из текущей ячейки |
| `,` | ввести символ в текущую ячейку |
| `[` | начать цикл (выполнять, пока значение не равно 0) |
| `]` | конец цикла |

## 📚 Примеры программ

Все примеры лежат в папке [`examples`](examples).

| Файл | Описание |
| :--- | :--- |
| `hello1.b` … `hello5.b` | пять вариантов классической программы «Hello, World!» |
| `cat.b` | программа-эхо `,[.,]`: читает ввод и выводит его обратно до конца файла |
| `cell_size.b` | определяет размер ячейки памяти интерпретатора (8, 16 или 32 бита) по поведению при переполнении |
| `quine.b` | выводит собственный исходный код |
| `looping_counter.b` | демонстрирует вложенные циклы и вывод последовательности символов |
| `test.b`, `test_fail.b` | проверка корректности работы интерпретатора, включая обработку ошибок |

## 📁 Структура проекта

```text
refalabbrainfuck/
├── examples/          # примеры Brainfuck-программ
├── fonts/             # шрифты для GUI версии
├── src/               # исходный код на РефалАБ и C
│   └── raygui/        # библиотека raygui
├── make_run           # сборка и запуск, POSIX
├── make_run.bat       # сборка и запуск, Windows
├── make_run_gui       # сборка и запуск GUI, POSIX
├── make_run_gui.bat   # сборка и запуск GUI, Windows
├── LICENSE_1_0.txt    # лицензия BSL-1.0
└── README.md
```

## 📄 Лицензия

[Boost Software License 1.0](LICENSE_1_0.txt) (BSL-1.0).

## 👤 Автор

**Александр Бочаров** (Aleksandr Bocharov), 2024–2026

## 🔗 Ссылки

- [РефалАБ](https://github.com/Aleksandr3Bocharov/refalab) — основной проект
- [Brainfuck в Википедии](https://ru.wikipedia.org/wiki/Brainfuck)
- [raylib](https://www.raylib.com/) и [raygui](https://github.com/raysan5/raygui)
