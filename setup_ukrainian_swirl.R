# Скрипт для швидкої активації українських фраз у swirl
# Quick activation script for Ukrainian phrases in swirl

# Завантажуємо необхідні бібліотеки
if (!require("swirl", quietly = TRUE)) {
  install.packages("swirl")
  library(swirl)
} else {
  library(swirl)
}

# Завантажуємо українські фрази
source("ukrainian_phrases.R")

# Активуємо українські фрази
activate_ukrainian_phrases()

# Виводимо інформацію про готовність
cat("\n🇺🇦 SWIRL ГОТОВИЙ З УКРАЇНСЬКИМИ ФРАЗАМИ! 🇺🇦\n")
cat("🇺🇦 SWIRL READY WITH UKRAINIAN PHRASES! 🇺🇦\n\n")
cat("Тепер можеш запустити swirl():\n")
cat("Now you can run swirl():\n\n")
cat("swirl()\n\n")
cat("Щоб повернутися до англійських фраз, виконай:\n")
cat("To return to English phrases, run:\n")
cat("deactivate_ukrainian_phrases()\n\n")
