# УКРАЇНСЬКІ ФРАЗИ ДЛЯ SWIRL 🇺🇦

Цей проект додає підтримку української мови для курсів swirl в R.

## ШВИДКИЙ СТАРТ

### 🚀 НАЙПРОСТІШИЙ СПОСІБ (рекомендовано):
```r
source("activate_ukrainian.R")
activate_ukrainian()
swirl()
```

### 📋 ПОКРОКОВИЙ СПОСІБ:
1. **Переконайся що swirl встановлений:**
   ```r
   install.packages("swirl")
   ```

2. **Завантаж і активуй українські фрази:**
   ```r
   source("setup_ukrainian_swirl.R")
   ```

3. **Запусти swirl з українськими фразами:**
   ```r
   swirl()
   ```

## СТРУКТУРА ФАЙЛІВ

- `activate_ukrainian.R` - **ГОЛОВНИЙ ФАЙЛ** для активації (рекомендовано)
- `ukrainian_phrases.R` - основні українські фрази та функції
- `setup_ukrainian_swirl.R` - автоматичне налаштування
- `demo_ukrainian_swirl.R` - демонстрація та тестування
- `test_phrases.R` - простий тест фраз
- `UKRAINIAN_SWIRL_INSTRUCTIONS.md` - детальні інструкції англійською

## ЩО ЗМІНЮЄТЬСЯ

Замість англійських повідомлень типу:
- "Excellent work!"
- "That's not the answer I was looking for, but try again."

Ти побачиш українські:
- "Чудова робота!"
- "Це не та відповідь, яку я шукав, але спробуй ще раз."

## ДЕТАЛЬНЕ ВИКОРИСТАННЯ

### Варіант 1: Головний файл (найпростіший)
```r
source("activate_ukrainian.R")
activate_ukrainian()           # базова активація  
activate_ukrainian(demo=TRUE)  # з демонстрацією фраз
activate_ukrainian(test=TRUE)  # з тестуванням
swirl()
```

### Варіант 2: Автоматичне налаштування
```r
source("setup_ukrainian_swirl.R")
swirl()
```

### Варіант 3: Ручне налаштування
```r
library(swirl)
source("ukrainian_phrases.R")
activate_ukrainian_phrases()
swirl()
```

### Варіант 4: Демонстрація
```r
source("demo_ukrainian_swirl.R")
# Побачиш приклади фраз перед запуском swirl
```

## ПЕРЕВІРКА РОБОТИ

```r
# Завантаж головний файл
source("activate_ukrainian.R")

# Перевір статус системи
check_ukrainian_status()

# Активуй українські фрази
activate_ukrainian()

# Швидкий тест
quick_test()

# Перевір чи працює
praise_ua()     # Покаже українську фразу похвали
tryAgain_ua()   # Покаже українську фразу "спробуй ще раз"
```

## ТЕХНІЧНІ ДЕТАЛІ

Система працює шляхом заміни функцій `praise()` та `tryAgain()` в пакеті swirl українськими еквівалентами. Це не змінює вихідний код swirl, а лише замінює функції під час виконання.

## ВІДНОВЛЕННЯ АНГЛІЙСЬКИХ ФРАЗ

Щоб повернутися до англійських фраз, просто перезапусти R:
```r
# Перезапусти R сесію або:
rm(list=ls())
library(swirl)
# Тепер swirl буде використовувати англійські фрази
```

## ПІДТРИМКА

Якщо щось не працює:
1. Переконайся що всі файли в одній папці
2. Перевір чи встановлений swirl: `library(swirl)`
3. Подивись детальні інструкції в `UKRAINIAN_SWIRL_INSTRUCTIONS.md`

---

*Створено для проекту RB-FIDES swirl courses*
