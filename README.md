# RefalABBrainfuck

Интерпретатор языка программирования [Brainfuck](https://ru.wikipedia.org/wiki/Brainfuck), написанный на языке программирования [РефалАБ](https://github.com/Aleksandr3Bocharov/refalab).

Программа "RefalABBrainfuck" интерпретирует код на языке Brainfuck из исходного файла.

## Особенности

- **Две версии программы:**
    - Консольная версия — классический интерпретатор с вводом/выводом через стандартные потоки
    - GUI версия — графический интерфейс на основе библиотек [raylib](https://www.raylib.com/) и [raygui](https://github.com/raysan5/raygui)
- **Интерпретация из файла** — запуск Brainfuck-программ из исходных файлов
- **Коллекция примеров** — классические Brainfuck-программы в папке `examples`
- **Написан на РефалАБ** — демонстрация возможностей языка для реализации интерпретаторов

## Системные требования

### Базовые требования
- [РефалАБ](https://github.com/Aleksandr3Bocharov/refalab) — компилятор и интерпретатор
- Компилятор C Clang

### Для GUI версии (дополнительно)
- [raylib](https://www.raylib.com/) — библиотека для работы с графикой
- [raygui](https://github.com/raysan5/raygui) — библиотека GUI-элементов

## Сборка

### Windows

**Консольная версия:**

    make_run.bat

