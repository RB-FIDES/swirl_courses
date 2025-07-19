# ПОВНА УКРАЇНСЬКА ЛОКАЛІЗАЦІЯ SWIRL
# COMPLETE UKRAINIAN LOCALIZATION FOR SWIRL

# ==============================================================================
# ФУНКЦІЇ ПЕРЕКЛАДУ / TRANSLATION FUNCTIONS
# ==============================================================================

# Заміщуємо основну функцію локалізації
s_ua <- function() {
  function(text) {
    # Словник перекладів
    translations <- list(
      # ===================
      # ОСНОВНІ ПОВІДОМЛЕННЯ / CORE MESSAGES
      # ===================
      "Welcome to swirl! Please sign in. If you've been here before, use the same name as you did then. If you are new, call yourself something unique." = 
        "Ласкаво просимо до swirl! Будь ласка, увійди в систему. Якщо ти вже була тут раніше, використовуй те ж ім'я, що і тоді. Якщо ти нова, назвись чимось унікальним.",
      
      "What shall I call you? " = "Як мені тебе називати? ",
      
      "Please don't use any quotes or other punctuation in your name." = 
        "Будь ласка, не використовуй лапки або інші знаки пунктуації в імені.",
      
      "Thanks, " = "Дякую, ",
      
      ". Let's cover a couple of quick housekeeping items before we begin our first lesson. First of all, you should know that when you see '...', that means you should press Enter when you are done reading and ready to continue." = 
        ". Давай швидко розберемо кілька організаційних моментів перед початком першого уроку. По-перше, ти повинна знати, що коли бачиш '...', це означає, що треба натиснути Enter, коли закінчиш читати і будеш готова продовжувати.",
      
      "\n...  <-- That's your cue to press Enter to continue" = 
        "\n...  <-- Це твій сигнал натиснути Enter для продовження",
      
      "Also, when you see 'ANSWER:', the R prompt (>), or when you are asked to select from a list, that means it's your turn to enter a response, then press Enter to continue." = 
        "Також, коли бачиш 'ВІДПОВІДЬ:', R prompt (>), або коли тебе просять вибрати зі списку, це означає, що настала твоя черга ввести відповідь, а потім натиснути Enter для продовження.",
      
      "Continue." = "Продовжити.",
      "Proceed." = "Далі.",
      "Let's get going!" = "Вперед!",
      
      "\nSelect 1, 2, or 3 and press Enter" = "\nВибери 1, 2 або 3 і натисни Enter",
      
      "You can exit swirl and return to the R prompt (>) at any time by pressing the Esc key. If you are already at the prompt, type bye() to exit and save your progress. When you exit properly, you'll see a short message letting you know you've done so." = 
        "Ти можеш вийти з swirl і повернутися до R prompt (>) в будь-який час, натиснувши клавішу Esc. Якщо ти вже на prompt, введи bye() щоб вийти і зберегти прогрес. Коли вийдеш правильно, побачиш коротке повідомлення про це.",
      
      "Let's get started!" = "Почнемо!",
      
      # ===================
      # МЕНЮ / MENUS
      # ===================
      "To begin, you must install a course. I can install a course for you from the internet, or I can send you to a web page (https://github.com/swirldev/swirl_courses) which will provide course options and directions for installing courses yourself. (If you are not connected to the internet, type 0 to exit.)" = 
        "Щоб почати, ти повинна встановити курс. Я можу встановити курс для тебе з інтернету, або можу відправити тебе на веб-сторінку (https://github.com/swirldev/swirl_courses), яка надасть варіанти курсів та інструкції для самостійного встановлення. (Якщо ти не підключена до інтернету, введи 0 для виходу.)",
      
      "Don't install anything for me. I'll do it myself." = 
        "Не встановлюй нічого для мене. Я зроблю це сама.",
      
      "Try again!" = "Спробуй ще раз!",
      "Send me to the course repository for manual installation." = 
        "Відправ мене до репозиторію курсів для ручного встановлення.",
      
      "Sorry, but I'm unable to fetch " = "Вибач, але я не можу завантажити ",
      "right now. Are you sure you have an internet connection?" = 
        "зараз. Ти впевнена, що у тебе є підключення до інтернету?",
      "If so, would you like to try again or visit" = 
        "Якщо так, хочеш спробувати ще раз або відвідати",
      "the course repository for instructions on how to" = 
        "репозиторій курсів для інструкцій про те, як",
      "install a course manually? Type 0 to exit." = 
        "встановити курс вручну? Введи 0 для виходу.",
      
      "OK. I'm opening the swirl course respository in your browser." = 
        "Гаразд. Я відкриваю репозиторій курсів swirl у твоєму браузері.",
      
      "OK. I'm opening the swirl courses web page in your browser." = 
        "Гаразд. Я відкриваю веб-сторінку курсів swirl у твоєму браузері.",
      
      "Please choose a course, or type 0 to exit swirl." = 
        "Будь ласка, вибери курс або введи 0 для виходу з swirl.",
      
      "Please choose a lesson, or type 0 to return to course menu." = 
        "Будь ласка, вибери урок або введи 0 для повернення до меню курсу.",
      
      "Would you like to continue with one of these lessons?" = 
        "Хочеш продовжити один з цих уроків?",
      
      "No. Let me start something new." = "Ні. Дай мені почати щось нове.",
      
      "Take me to the swirl course repository!" = 
        "Відведи мене до репозиторію курсів swirl!",
      
      # ===================
      # СПЕЦІАЛЬНІ КОМАНДИ / SPECIAL COMMANDS
      # ===================
      "When you are at the R prompt (>):" = "Коли ти на R prompt (>):",
      "-- Typing skip() allows you to skip the current question." = 
        "-- Введення skip() дозволяє пропустити поточне запитання.",
      "-- Typing play() lets you experiment with R on your own; swirl will ignore what you do..." = 
        "-- Введення play() дозволяє експериментувати з R самостійно; swirl буде ігнорувати те, що ти робиш...",
      "-- UNTIL you type nxt() which will regain swirl's attention." = 
        "-- ПОКИ ти не введеш nxt(), що поверне увагу swirl.",
      "-- Typing bye() causes swirl to exit. Your progress will be saved." = 
        "-- Введення bye() змушує swirl вийти. Твій прогрес буде збережено.",
      "-- Typing main() returns you to swirl's main menu." = 
        "-- Введення main() повертає тебе до головного меню swirl.",
      "-- Typing info() displays these options again." = 
        "-- Введення info() знову відображає ці опції.",
      
      "Or, type info() for more options." = "Або введи info() для більше опцій.",
      
      # ===================
      # ПОВІДОМЛЕННЯ ПРО ПРОГРЕС / PROGRESS MESSAGES
      # ===================
      "Leaving swirl now. Type swirl() to resume." = 
        "Виходжу з swirl зараз. Введи swirl() для продовження.",
      
      "Resuming lesson..." = "Продовжую урок...",
      
      "Entering play mode. Experiment as you please, then type nxt() when you are ready to resume the lesson." = 
        "Входжу в режим гри. Експериментуй як завгодно, потім введи nxt(), коли будеш готова продовжити урок.",
      
      "Returning to the main menu..." = "Повертаюся до головного меню...",
      
      "You've reached the end of this lesson! Returning to the main menu..." = 
        "Ти досягла кінця цього уроку! Повертаюся до головного меню...",
      
      "Lesson complete! Exiting swirl now..." = 
        "Урок завершено! Виходжу з swirl зараз...",
      
      # ===================
      # ПРОПУСК ТА ВІДПОВІДІ / SKIP AND ANSWERS
      # ===================
      "Entering the following correct answer for you..." = 
        "Вводжу для тебе наступну правильну відповідь...",
      
      "I just sourced the following script, which demonstrates one possible solution." = 
        "Я щойно виконала наступний скрипт, який демонструє одне з можливих рішень.",
      
      "Press Enter when you are ready to continue..." = 
        "Натисни Enter, коли будеш готова продовжити...",
      
      "I just reset the script to its original state. If it doesn't refresh immediately, you may need to click on it." = 
        "Я щойно скинула скрипт до початкового стану. Якщо він не оновиться відразу, тобі може знадобитися клікнути на нього.",
      
      "Sourcing your script..." = "Виконую твій скрипт...",
      
      # ===================
      # ПАКЕТИ / PACKAGES
      # ===================
      "Package" = "Пакет",
      "loaded correctly!" = "завантажено правильно!",
      "This lesson requires the" = "Цей урок потребує пакет",
      "package. Would you like me to install it for you now?" = 
        ". Хочеш, щоб я встановила його для тебе зараз?",
      "Yes" = "Так",
      "No" = "Ні",
      "Trying to install package" = "Намагаюся встановити пакет",
      "now..." = "зараз...",
      "Could not install package" = "Не вдалося встановити пакет",
      
      # ===================
      # COURSERA
      # ===================
      "Would you like me to notify Coursera that you've completed this lesson?" = 
        "Хочеш, щоб я повідомила Coursera, що ти завершила цей урок?",
      "If so, I'll need to get some more info from you." = 
        "Якщо так, мені знадобиться отримати від тебе ще трохи інформації.",
      "Maybe later" = "Можливо, пізніше",
      "You skipped too many questions! You'll need to complete" = 
        "Ти пропустила занадто багато запитань! Тобі знадобиться завершити",
      "this lesson again if you'd like to receive credit. Please" = 
        "цей урок знову, якщо хочеш отримати зарахування. Будь ласка,",
      "don't skip more than one question next time." = 
        "не пропускай більше одного запитання наступного разу.",
      "I've notified Coursera that you have completed " = 
        "Я повідомила Coursera, що ти завершила ",
      "Is the following information correct?" = 
        "Чи правильна наступна інформація?",
      "I'm sorry, something went wrong with automatic submission." = 
        "Вибач, щось пішло не так з автоматичною подачею.",
      "I'm sorry, something went wrong with establishing connection." = 
        "Вибач, щось пішло не так з встановленням з'єднання.",
      "To notify Coursera that you have completed this lesson," = 
        "Щоб повідомити Coursera, що ти завершила цей урок,",
      "please upload" = "будь ласка, завантаж",
      "to Coursera manually. You may do so by visiting the Programming" = 
        "до Coursera вручну. Ти можеш зробити це, відвідавши Programming",
      
      # ===================
      # ПОМИЛКИ / ERRORS
      # ===================
      "Could not find account for user: " = "Не вдалося знайти акаунт для користувача: ",
      
      # ===================
      # ІНШІ / OTHERS
      # ===================
      "Hi! I see that you have some variables saved in your" = 
        "Привіт! Бачу, що у тебе є деякі змінні, збережені у твоєму",
      "workspace. To keep things running smoothly, I recommend you clean up" = 
        "робочому просторі. Щоб все працювало гладко, рекомендую тобі прибрати",
      "before starting swirl." = "перед початком swirl.",
      "Type ls() to see a list of the variables in your workspace." = 
        "Введи ls(), щоб побачити список змінних у твоєму робочому просторі.",
      "Then, type rm(list=ls()) to clear your workspace." = 
        "Потім введи rm(list=ls()), щоб очистити твій робочий простір.",
      "Type swirl() when you are ready to begin." = 
        "Введи swirl(), коли будеш готова почати.",
      "Hi! Type swirl() when you are ready to begin." = 
        "Привіт! Введи swirl(), коли будеш готова почати."
    )
    
    # Повертаємо переклад або оригінальний текст
    if (text %in% names(translations)) {
      return(translations[[text]])
    } else {
      return(text)
    }
  }
}

# Створюємо оператор для україзації
"%N%" <- function(f, text) {
  if (identical(f, s_ua())) {
    return(f(text))
  } else {
    return(text)
  }
}

# ==============================================================================
# ФУНКЦІЯ АКТИВАЦІЇ ПОВНОЇ УКРАЇНІЗАЦІЇ / FULL UKRAINIZATION ACTIVATION
# ==============================================================================

activate_full_ukrainian_swirl <- function() {
  if (!requireNamespace("swirl", quietly = TRUE)) {
    stop("Пакет swirl не встановлений! / Package swirl is not installed!")
  }
  
  cat("🇺🇦 АКТИВУЄМО ПОВНУ УКРАЇНІЗАЦІЮ SWIRL...\n")
  cat("🇺🇦 ACTIVATING FULL SWIRL UKRAINIZATION...\n\n")
  
  # Замінюємо функції похвали та "спробуй ще раз"
  source("ukrainian_phrases.R", local = TRUE)
  activate_ukrainian_phrases()
  
  # Замінюємо функцію локалізації
  try(assignInNamespace("s", s_ua, ns="swirl"), silent = TRUE)
  
  # Додаткові заміни для специфічних функцій
  try({
    # Заміняємо readline для питання імені
    original_readline <- base::readline
    ukrainian_readline <- function(prompt = "") {
      if (prompt == "What shall I call you? ") {
        prompt <- "Як мені тебе називати? "
      } else if (prompt == "ANSWER: ") {
        prompt <- "ВІДПОВІДЬ: "
      } else if (prompt == "Yes or No? ") {
        prompt <- "Так чи Ні? "
      } else if (prompt == "Submission login (email): ") {
        prompt <- "Логін для подачі (email): "
      } else if (prompt == "Submission password: ") {
        prompt <- "Пароль для подачі: "
      } else if (prompt == "Press Enter when you are ready to continue...") {
        prompt <- "Натисни Enter, коли будеш готова продовжити..."
      }
      original_readline(prompt)
    }
    
    assignInNamespace("readline", ukrainian_readline, ns="base")
  }, silent = TRUE)
  
  cat("✅ Українізація активована!\n")
  cat("✅ Ukrainization activated!\n\n")
  cat("Тепер можеш запустити: swirl()\n")
  cat("Now you can run: swirl()\n\n")
  
  invisible(TRUE)
}

# ==============================================================================
# ФУНКЦІЯ ДЕАКТИВАЦІЇ / DEACTIVATION FUNCTION
# ==============================================================================

deactivate_ukrainian_swirl <- function() {
  cat("🔄 ДЕАКТИВУЄМО УКРАЇНІЗАЦІЮ...\n")
  cat("🔄 DEACTIVATING UKRAINIZATION...\n\n")
  
  # Перезавантажуємо swirl namespace
  try({
    unloadNamespace("swirl")
    library(swirl)
  }, silent = TRUE)
  
  cat("✅ Повернулися до англійської версії\n")
  cat("✅ Returned to English version\n\n")
  
  invisible(TRUE)
}

cat("📁 Файл повної українізації завантажено!\n")
cat("📁 Full ukrainization file loaded!\n\n")
cat("Використовуй:\n")
cat("Use:\n")
cat("activate_full_ukrainian_swirl()   # Повна українізація\n")
cat("deactivate_ukrainian_swirl()      # Повернення до англійської\n")
cat("activate_ukrainian_phrases()      # Тільки фрази похвали/помилок\n")
