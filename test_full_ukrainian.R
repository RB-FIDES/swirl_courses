# ТЕСТ ПОВНОЇ УКРАЇНІЗАЦІЇ SWIRL
# FULL UKRAINIZATION TEST FOR SWIRL

# Завантажуємо наші файли в правильному порядку
cat("🚀 ЗАПУСКАЄМО ТЕСТ ПОВНОЇ УКРАЇНІЗАЦІЇ\n")
cat("🚀 LAUNCHING FULL UKRAINIZATION TEST\n\n")

# Спочатку завантажуємо основні фрази
if (file.exists("ukrainian_phrases.R")) {
  source("ukrainian_phrases.R")
  cat("✅ Основні фрази завантажено\n")
} else {
  cat("❌ Файл ukrainian_phrases.R не знайдено\n")
}

# Потім завантажуємо повну українізацію
if (file.exists("full_ukrainian_swirl.R")) {
  source("full_ukrainian_swirl.R")
  cat("✅ Повна українізація завантажена\n")
} else {
  cat("❌ Файл full_ukrainian_swirl.R не знайдено\n")
}

# Тестуємо
cat("\n" %R% paste(rep("=", 60), collapse="") %R% "\n")
cat("ДЕМОНСТРАЦІЯ УКРАЇНСЬКИХ ПОВІДОМЛЕНЬ:\n")
cat(paste(rep("=", 60), collapse="") %R% "\n\n")

# Тест функції локалізації
s_test <- s_ua()
cat("ТЕСТ ПЕРЕКЛАДУ ПОВІДОМЛЕНЬ:\n")
cat("- Оригінал: 'Welcome to swirl!'\n")
cat("- Переклад:", s_test("Welcome to swirl! Please sign in. If you've been here before, use the same name as you did then. If you are new, call yourself something unique."), "\n\n")

cat("- Оригінал: 'What shall I call you?'\n") 
cat("- Переклад:", s_test("What shall I call you? "), "\n\n")

cat("- Оригінал: 'Please choose a course'\n")
cat("- Переклад:", s_test("Please choose a course, or type 0 to exit swirl."), "\n\n")

# Тест фраз похвали та помилок
if (exists("praise_ua")) {
  cat("ТЕСТ ФРАЗ ПОХВАЛИ:\n")
  for(i in 1:3) {
    cat("✓", praise_ua(), "\n")
  }
  cat("\n")
} else {
  cat("❌ Функція praise_ua() не знайдена\n")
}

if (exists("tryAgain_ua")) {
  cat("ТЕСТ ФРАЗ 'СПРОБУЙ ЩЕ РАЗ':\n")
  for(i in 1:3) {
    cat("✗", tryAgain_ua(), "\n")
  }
  cat("\n")
} else {
  cat("❌ Функція tryAgain_ua() не знайдена\n")
}

cat(paste(rep("=", 60), collapse="") %R% "\n")
cat("ІНСТРУКЦІЇ:\n")
cat("1. Запусти activate_full_ukrainian_swirl() для повної українізації\n")
cat("2. Запусти swirl() щоб побачити українські повідомлення\n")
cat("3. Запусти deactivate_ukrainian_swirl() щоб повернутися до англійської\n")
cat(paste(rep("=", 60), collapse="") %R% "\n\n")

# Автоматично активуємо якщо потрібно
activate_ukrainian <- readline("Активувати українізацію зараз? (y/n): ")
if (tolower(activate_ukrainian) %in% c("y", "yes", "так", "т")) {
  if (exists("activate_full_ukrainian_swirl")) {
    activate_full_ukrainian_swirl()
    cat("\n🎉 Готово! Тепер запусти: swirl()\n")
  } else {
    cat("❌ Функція активації не знайдена\n")
  }
} else {
  cat("👍 Гаразд. Активуй вручну коли будеш готова.\n")
}
