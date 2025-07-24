# 🇺🇦 АКТИВАЦІЯ УКРАЇНСЬКОЇ МОВИ В SWIRL - ПОВНИЙ ПОСІБНИК

## 🚀 НАЙШВИДШИЙ СПОСІБ (1 хвилина)

```r
# Завантаж і активуй одним рядком:
source("activate_ukrainian.R")
activate_ukrainian()
swirl()
```

## 📋 ПОКРОКОВИЙ ПОСІБНИК

### Крок 1: Встановлення R та swirl
```r
# Якщо swirl не встановлений:
install.packages("swirl")
```

### Крок 2: Активація української мови
**Варіант A (рекомендовано):**
```r
source("activate_ukrainian.R")
activate_ukrainian()
```

**Варіант B (автоматичний):**
```r
source("setup_ukrainian_swirl.R")
```

**Варіант C (ручний):**
```r
library(swirl)
source("ukrainian_phrases.R")
activate_ukrainian_phrases()
```

### Крок 3: Запуск swirl
```r
swirl()
```

## 🔍 ПЕРЕВІРКА АКТИВАЦІЇ

```r
# Перевір статус системи:
source("activate_ukrainian.R")
check_ukrainian_status()

# Швидкий тест фраз:
quick_test()
```

## 🛠️ КОРИСНІ КОМАНДИ

```r
# Активація з демонстрацією:
activate_ukrainian(demo=TRUE)

# Активація з тестуванням:
activate_ukrainian(test=TRUE)

# Деактивація (повернення до англійської):
deactivate_ukrainian_phrases()

# Статус системи:
check_ukrainian_status()
```

## 📁 СТРУКТУРА ФАЙЛІВ

- **`activate_ukrainian.R`** - головний файл активації (START HERE!)
- `ukrainian_phrases.R` - українські фрази та функції
- `setup_ukrainian_swirl.R` - швидке налаштування
- `demo_ukrainian_swirl.R` - демонстрація
- `test_system.R` - тестування всієї системи

## 🔧 ВИРІШЕННЯ ПРОБЛЕМ

### Проблема: "swirl не завантажений"
```r
install.packages("swirl")
library(swirl)
source("activate_ukrainian.R")
activate_ukrainian()
```

### Проблема: "Фрази не змінилися"
```r
# Деактивуй і активуй знову:
deactivate_ukrainian_phrases()
activate_ukrainian()
```

### Проблема: "Файл не знайдено"
```r
# Переконайся що ти в правильній папці:
getwd()
list.files(pattern = "ukrainian")
```

## 🎯 ЩО ЗМІНЮЄТЬСЯ

### До активації (англійська):
```
> # Правильна відповідь
"Excellent work!"
"Great job!"

> # Неправильна відповідь  
"That's not the answer I was looking for, but try again."
"Not quite! Try again."
```

### Після активації (українська):
```
> # Правильна відповідь
"Чудова робота!"
"Відмінна робота!"

> # Неправильна відповідь
"Це не та відповідь, яку я шукала, але спробуй ще раз."
"Не зовсім! Спробуй ще раз."
```

## 📞 ПІДТРИМКА

1. **Запусти тест системи:**
   ```r
   source("test_system.R")
   ```

2. **Перевір документацію:**
   - `README_UKRAINIAN.md` - українська документація
   - `UKRAINIAN_SWIRL_INSTRUCTIONS.md` - детальні інструкції

3. **Створи issue** в репозиторії, якщо проблема не вирішується

## 💡 ПОРАДИ

- 🔄 **Система працює тільки в поточній R сесії** - після перезапуску R потрібно активувати знову
- 📚 **Працює з усіма курсами swirl** - не потребує спеціальних налаштувань курсів
- ⚡ **Швидка активація** - використовуй `source("activate_ukrainian.R"); activate_ukrainian()`
- 🎮 **Тестування** - завжди можеш перевірити роботу через `quick_test()`

---

*Створено для проекту RB-FIDES swirl courses* 🇺🇦

**AI-Human Symbiosis Acknowledgment**  
This guide was co-developed through AI-human collaboration.  
*Provider:* GitHub Copilot (OpenAI)  
*Human Supervisor:* @oleksandkov  
*Framework:* FIDES - Framework for Interpretive Dialogue and Epistemic Symbiosis