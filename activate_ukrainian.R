# ГОЛОВНИЙ ФАЙЛ ДЛЯ АКТИВАЦІЇ УКРАЇНСЬКОЇ МОВИ В SWIRL
# MAIN FILE FOR ACTIVATING UKRAINIAN LANGUAGE IN SWIRL
#
# Цей файл є єдиною точкою входу для активації української мови
# This file is the single entry point for activating Ukrainian language

# ==============================================================================
# ФУНКЦІЯ АКТИВАЦІЇ УКРАЇНСЬКОЇ МОВИ / UKRAINIAN ACTIVATION FUNCTION
# ==============================================================================

activate_ukrainian <- function(demo = FALSE, test = FALSE) {
  cat("🇺🇦 Активація української мови для swirl... 🇺🇦\n")
  cat("🇺🇦 Activating Ukrainian language for swirl... 🇺🇦\n\n")
  
  # Крок 1: Перевірка та встановлення swirl
  if (!require("swirl", quietly = TRUE)) {
    cat("📦 Встановлюю пакет swirl...\n")
    cat("📦 Installing swirl package...\n")
    install.packages("swirl")
    library(swirl)
  } else {
    library(swirl)
    cat("✓ Пакет swirl завантажено\n")
    cat("✓ swirl package loaded\n")
  }
  
  # Крок 2: Завантаження українських фраз
  cat("📝 Завантажую українські фрази...\n")
  cat("📝 Loading Ukrainian phrases...\n")
  
  tryCatch({
    source("ukrainian_phrases.R")
    cat("✓ Українські фрази завантажено\n")
    cat("✓ Ukrainian phrases loaded\n")
  }, error = function(e) {
    stop("❌ Помилка завантаження файлу ukrainian_phrases.R: ", e$message)
  })
  
  # Додатково: Завантаження повної українізації, якщо файл існує
  if (file.exists("full_ukrainian_swirl.R")) {
    cat("📝 Завантажую додаткові фрази з full_ukrainian_swirl.R...\n")
    tryCatch({
      source("full_ukrainian_swirl.R")
      cat("✓ Додаткові фрази завантажено (full_ukrainian_swirl.R)\n")
    }, error = function(e) {
      cat("⚠️ Не вдалося завантажити full_ukrainian_swirl.R: ", e$message, "\n")
    })
  }
  
  # Крок 3: Активація фраз
  cat("🔄 Активую українські фрази...\n")
  cat("🔄 Activating Ukrainian phrases...\n")
  
  tryCatch({
    activate_ukrainian_phrases()
    # Якщо є функція повної українізації, активувати також
    if (exists("activate_full_ukrainian_swirl")) {
      activate_full_ukrainian_swirl()
      cat("✓ Повна українізація активована (full_ukrainian_swirl.R)\n")
    }
  }, error = function(e) {
    stop("❌ Помилка активації українських фраз: ", e$message)
  })
  
  # Крок 4: Демонстрація (якщо запитано)
  if (demo) {
    cat("\n📋 ДЕМОНСТРАЦІЯ ФРАЗ / PHRASES DEMONSTRATION\n")
    cat(paste(rep("-", 50), collapse=""), "\n")
    cat("Фрази похвали (Praise phrases):\n")
    for(i in 1:3) {
      cat("  ✓", praise_ua(), "\n")
    }
    cat("\nФрази 'спробуй ще раз' (Try again phrases):\n")
    for(i in 1:3) {
      cat("  ↻", tryAgain_ua(), "\n")
    }
    cat(paste(rep("-", 50), collapse=""), "\n\n")
  }
  
  # Крок 5: Тестування (якщо запитано)
  if (test) {
    cat("\n🧪 ТЕСТУВАННЯ / TESTING\n")
    test_ukrainian_phrases()
  }
  
  # Фінальне повідомлення
  cat("\n🎉 УКРАЇНСЬКА МОВА АКТИВОВАНА! 🎉\n")
  cat("🎉 UKRAINIAN LANGUAGE ACTIVATED! 🎉\n\n")
  cat("📚 Тепер запусти swirl() для початку курсу:\n")
  cat("📚 Now run swirl() to start a course:\n\n")
  cat("    swirl()\n\n")
  cat("💡 Корисні команди (Useful commands):\n")
  cat("    check_ukrainian_status()  # перевірити статус\n")
  cat("    deactivate_ukrainian_translation()  # вимкнути будь-яку українізацію\n")
  cat("    activate_ukrainian(demo=TRUE)  # показати демо\n\n")
  
  invisible(TRUE)
}

# ==============================================================================
# ФУНКЦІЯ АКТИВАЦІЇ ЛИШЕ УКРАЇНСЬКИХ ФРАЗ / PHRASES-ONLY ACTIVATION FUNCTION
# ==============================================================================
activate_ukrainian_phrases_only <- function(demo = FALSE, test = FALSE) {
  cat("🇺🇦 Активація лише українських фраз для swirl... 🇺🇦\n")
  cat("🇺🇦 Activating only Ukrainian phrases for swirl... 🇺🇦\n\n")
  
  # Крок 1: Перевірка та встановлення swirl
  if (!require("swirl", quietly = TRUE)) {
    cat("📦 Встановлюю пакет swirl...\n")
    cat("📦 Installing swirl package...\n")
    install.packages("swirl")
    library(swirl)
  } else {
    library(swirl)
    cat("✓ Пакет swirl завантажено\n")
    cat("✓ swirl package loaded\n")
  }
  
  # Крок 2: Завантаження українських фраз
  cat("📝 Завантажую українські фрази...\n")
  cat("📝 Loading Ukrainian phrases...\n")
  
  tryCatch({
    source("ukrainian_phrases.R")
    cat("✓ Українські фрази завантажено\n")
    cat("✓ Ukrainian phrases loaded\n")
  }, error = function(e) {
    stop("❌ Помилка завантаження файлу ukrainian_phrases.R: ", e$message)
  })
  
  # Крок 3: Активація фраз
  cat("🔄 Активую українські фрази...\n")
  cat("🔄 Activating Ukrainian phrases...\n")
  
  tryCatch({
    activate_ukrainian_phrases()
    cat("✓ Українські фрази активовані\n")
    cat("✓ Ukrainian phrases activated\n")
  }, error = function(e) {
    stop("❌ Помилка активації українських фраз: ", e$message)
  })
  
  # Крок 4: Демонстрація (якщо запитано)
  if (demo) {
    cat("\n📋 ДЕМОНСТРАЦІЯ ФРАЗ / PHRASES DEMONSTRATION\n")
    cat(paste(rep("-", 50), collapse=""), "\n")
    cat("Фрази похвали (Praise phrases):\n")
    for(i in 1:3) {
      cat("  ✓", praise_ua(), "\n")
    }
    cat("\nФрази 'спробуй ще раз' (Try again phrases):\n")
    for(i in 1:3) {
      cat("  ↻", tryAgain_ua(), "\n")
    }
    cat(paste(rep("-", 50), collapse=""), "\n\n")
  }
  
  # Крок 5: Тестування (якщо запитано)
  if (test) {
    cat("\n🧪 ТЕСТУВАННЯ / TESTING\n")
    test_ukrainian_phrases()
  }
  
  # Фінальне повідомлення
  cat("\n🎉 УКРАЇНСЬКІ ФРАЗИ АКТИВОВАНІ! 🎉\n")
  cat("🎉 UKRAINIAN PHRASES ACTIVATED! 🎉\n\n")
  cat("📚 Тепер запусти swirl() для початку курсу:\n")
  cat("📚 Now run swirl() to start a course:\n\n")
  cat("    swirl()\n\n")
  cat("💡 Корисні команди (Useful commands):\n")
  cat("    check_ukrainian_status()  # перевірити статус\n")
  cat("    deactivate_ukrainian_translation()  # вимкнути будь-яку українізацію\n")
  cat("    activate_ukrainian_phrases_only(demo=TRUE)  # показати демо\n\n")
  
  invisible(TRUE)
}

# ==============================================================================
# ФУНКЦІЯ ПОВНОГО ВИМКНЕННЯ УКРАЇНІЗАЦІЇ (FULL DEACTIVATION)
# ==============================================================================

deactivate_ukrainian_translation <- function() {
  cat("🚫 Вимикаю ВСІ українські переклади та відновлюю англійські фрази swirl...\n")
  cat("🚫 Deactivating ALL Ukrainian translations and restoring English swirl phrases...\n")
  
  # Спробувати вимкнути повну українізацію, якщо така функція існує
  if (exists("deactivate_full_ukrainian_swirl")) {
    tryCatch({
      deactivate_full_ukrainian_swirl()
      cat("✓ Повна українізація вимкнена (full_ukrainian_swirl.R)\n")
    }, error = function(e) {
      cat("⚠️ Не вдалося вимкнути повну українізацію: ", e$message, "\n")
    })
  }
  
  # Спробувати вимкнути українські фрази (базові)
  if (exists("deactivate_ukrainian_phrases")) {
    tryCatch({
      deactivate_ukrainian_phrases()
      cat("✓ Українські фрази вимкнені (ukrainian_phrases.R)\n")
    }, error = function(e) {
      cat("⚠️ Не вдалося вимкнути українські фрази: ", e$message, "\n")
    })
  }
  
  cat("🔁 Тепер використовуються стандартні англійські повідомлення swirl.\n")
  cat("🔁 English swirl messages are now active.\n")
  
  invisible(TRUE)
}

# ==============================================================================
# ФУНКЦІЯ ПЕРЕВІРКИ СТАТУСУ / STATUS CHECK FUNCTION  
# ==============================================================================

check_ukrainian_status <- function() {
  cat("🔍 Перевірка статусу української мови...\n")
  cat("🔍 Checking Ukrainian language status...\n\n")
  
  # Перевірка чи завантажений swirl
  if (!"swirl" %in% loadedNamespaces()) {
    cat("❌ Пакет swirl не завантажений\n")
    cat("❌ swirl package not loaded\n")
    cat("💡 Виконай: library(swirl)\n")
    return(invisible(FALSE))
  }
  
  # Перевірка чи активовані українські фрази
  tryCatch({
    current_praise <- get("praise", envir = asNamespace("swirl"))
    if (exists("praise_ua") && identical(current_praise, praise_ua)) {
      cat("✅ Українські фрази АКТИВНІ\n")
      cat("✅ Ukrainian phrases ACTIVE\n")
      cat("📋 Приклад: ", praise_ua(), "\n")
      return(invisible(TRUE))
    } else {
      cat("⚠️  Англійські фрази активні\n")
      cat("⚠️  English phrases active\n")
      cat("💡 Виконай: activate_ukrainian()\n")
      return(invisible(FALSE))
    }
  }, error = function(e) {
    cat("❌ Помилка перевірки статусу: ", e$message, "\n")
    return(invisible(FALSE))
  })
}

# ==============================================================================
# ШВИДКІ КОМАНДИ / QUICK COMMANDS
# ==============================================================================

# Швидка активація без повідомлень
quick_activate <- function() {
  if (!require("swirl", quietly = TRUE)) {
    install.packages("swirl")
    library(swirl)
  } else {
    library(swirl)
  }
  source("ukrainian_phrases.R")
  if (file.exists("full_ukrainian_swirl.R")) {
    source("full_ukrainian_swirl.R")
    if (exists("activate_full_ukrainian_swirl")) {
      activate_full_ukrainian_swirl()
    }
  }
  activate_ukrainian_phrases()
  invisible(TRUE)
}

# Швидкий тест
quick_test <- function() {
  cat("🧪 Швидкий тест фраз:\n")
  if (exists("praise_ua")) {
    cat("✓ Похвала:", praise_ua(), "\n")
    cat("↻ Спробуй ще раз:", tryAgain_ua(), "\n")
  } else {
    cat("❌ Українські фрази не завантажені. Виконай activate_ukrainian()\n")
  }
}

# ==============================================================================
# АВТОМАТИЧНЕ ВИКОНАННЯ / AUTO EXECUTION
# ==============================================================================

# Виводимо інформацію при завантаженні файлу
cat("🇺🇦 ГОЛОВНИЙ ФАЙЛ АКТИВАЦІЇ УКРАЇНСЬКОЇ МОВИ 🇺🇦\n")
cat("🇺🇦 MAIN UKRAINIAN LANGUAGE ACTIVATION FILE 🇺🇦\n\n")
cat("📋 Доступні команди (Available commands):\n")
cat("  activate_ukrainian()                  # повна активація\n")
cat("  activate_ukrainian(demo=TRUE)         # з демонстрацією\n") 
cat("  activate_ukrainian(test=TRUE)         # з тестуванням\n")
cat("  activate_ukrainian_phrases_only()     # лише українські фрази\n")
cat("  activate_ukrainian_phrases_only(demo=TRUE) # лише фрази з демо\n")
cat("  deactivate_ukrainian_translation()    # вимкнути всі українізації\n")
cat("  check_ukrainian_status()              # перевірити статус\n")
cat("  quick_activate()                      # швидка активація\n")
cat("  quick_test()                          # швидкий тест\n\n")
cat("🚀 ШВИДКИЙ СТАРТ: activate_ukrainian()\n")
cat("🚀 QUICK START: activate_ukrainian()\n\n")

# ==============================================================================
# AI-HUMAN SYMBIOSIS ACKNOWLEDGMENT
# ==============================================================================
# This activation system was co-developed through AI-human collaboration
# Provider: GitHub Copilot Chat (GPT-4 based)
# Human Supervisor: @oleksandkov  
# Framework: FIDES - Framework for Interpretive Dialogue and Epistemic Symbiosis 