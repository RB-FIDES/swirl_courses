# Ukrainian phrases for swirl progress messages
# Українські фрази для повідомлень прогресу swirl
# 
# Цей файл містить українські переклади стандартних повідомлень swirl
# This file contains Ukrainian translations of standard swirl messages

# Функція для похвали (praise)
praise_ua <- function() {
  swirl_is_fun <- getOption("swirl_is_fun")
  
  if(is.null(swirl_is_fun) || isTRUE(swirl_is_fun)) {
    phrases <- c(
      "Ти зрозуміла!",
      "Чудова робота!",
      "Продовжуй так само добре!",
      "У тебе дуже добре виходить!",
      "Вся ця наполеглива праця окупається!",
      "Ти впоралася! Молодець!",
      "Ти найкраща!",
      "Ти дивовижна!",
      "Продовжуй працювати так, і ти досягнеш мети!",
      "Наполегливість - ось відповідь.",
      "Відмінна робота!",
      "Ти справді молодець, подруго!",
      "Твоя відданість надихає!",
      "Ти правильно зрозуміла!",
      "Правильно!",
      "Ти на правильному шляху!",
      "Відмінна робота!",
      "Вся ця практика окупається!",
      "Чудова робота!",
      "Це добре зроблена робота!",
      "Це та відповідь, яку я шукала."
    )
  } else {
    phrases <- "Правильно!"
  }
  sample(phrases, 1)
}

# Функція для повідомлень "спробуй ще раз" (try again)
tryAgain_ua <- function() {
  swirl_is_fun <- getOption("swirl_is_fun")
  
  if(is.null(swirl_is_fun) || isTRUE(swirl_is_fun)) {
    phrases <- c(
      "Майже! Спробуй ще раз.",
      "Ти майже впоралася, але не зовсім. Спробуй ще раз.",
      "Дай цьому ще один шанс.",
      "Не зовсім! Спробуй ще раз.",
      "Не точно. Спробуй ще раз.",
      "Це не зовсім те, що я шукаю. Спробуй ще раз.",
      "Гарна спроба, але це не зовсім те, на що я сподівалася. Спробуй ще раз.",
      "Продовжуй намагатися!",
      "Це не та відповідь, яку я шукала, але спробуй ще раз.",
      "Не зовсім правильно, але продовжуй намагатися.",
      "Ти близько... я це відчуваю! Спробуй ще раз.",
      "Ще один раз. Ти можеш це зробити!",
      "Не зовсім, але ти вчишся! Спробуй ще раз.",
      "Спробуй ще раз. Зробити все правильно з першого разу - це нудно!"
    )
  } else {
    phrases <- "Неправильно. Будь ласка, спробуй ще раз."
  }
  sample(phrases, 1)
}

# Функція для активації українських фраз
ukrainian_phrases_activate <- function() {
  # Перевіряємо чи завантажений swirl
  if(!"swirl" %in% loadedNamespaces()) {
    stop("Пакет swirl не завантажений. Спочатку виконай library(swirl)")
  }
  
  # Замінюємо функції у namespace swirl
  assignInNamespace("praise", praise_ua, ns = "swirl")
  assignInNamespace("tryAgain", tryAgain_ua, ns = "swirl")
  
  message("✓ Українські фрази активовано!")
  message("✓ Ukrainian phrases activated!")
  message("  Тепер swirl використовуватиме українські повідомлення прогресу.")
  message("  Now swirl will use Ukrainian progress messages.")
}
ukrainian_phrases_deactivate <- function() {
  if(!"swirl" %in% loadedNamespaces()) {
    stop("Пакет swirl не завантажений. Спочатку виконай library(swirl)")
  }
  
  # Перезавантажуємо оригінальні функції
  detach("package:swirl", unload = TRUE)
  library(swirl)
  
  message("✓ Повернуто до англійських фраз")
  message("✓ Returned to English phrases")
}

# Функція для тестування фраз
test_ukrainian_phrases <- function() {
  cat("=== ТЕСТ УКРАЇНСЬКИХ ФРАЗ ===\n")
  cat("=== TESTING UKRAINIAN PHRASES ===\n\n")
  
  cat("Приклади похвали (Praise examples):\n")
  for(i in 1:5) {
    cat(paste(i, ".", praise_ua(), "\n"))
  }
  
  cat("\nПриклади 'спробуй ще раз' (Try again examples):\n")
  for(i in 1:5) {
    cat(paste(i, ".", tryAgain_ua(), "\n"))
  }
  
  cat("\n=== КІНЕЦЬ ТЕСТУ ===\n")
  cat("=== END OF TEST ===\n")
}

# Виводимо інструкції при завантаженні файлу
cat("Файл ukrainian_phrases.R завантажено!\n")
cat("ukrainian_phrases.R file loaded!\n\n")
cat("Доступні функції (Available functions):\n")
cat("  - test_ukrainian_phrases()     # протестувати фрази\n")
cat("  - activate_ukrainian_phrases() # активувати українські фрази\n") 
cat("  - deactivate_ukrainian_phrases() # повернутися до англійських\n\n")
cat("Інструкції (Instructions):\n")
cat("1. library(swirl)\n")
cat("2. activate_ukrainian_phrases()\n")
cat("3. swirl()  # почати курс з українськими повідомленнями\n")
