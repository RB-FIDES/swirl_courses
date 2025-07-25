# ГОЛОВНИЙ ФАЙЛ ДЛЯ АКТИВАЦІЇ УКРАЇНСЬКОЇ МОВИ В SWIRL
# MAIN FILE FOR ACTIVATING UKRAINIAN LANGUAGE IN SWIRL

# ==============================================================================
# ФУНКЦІЯ АКТИВАЦІЇ УКРАЇНСЬКОЇ МОВИ / UKRAINIAN ACTIVATION FUNCTION
# ==============================================================================

activate <- function(demo = FALSE, test = FALSE) {
  # --- Language selection ---
  cat("Interface language?\n")
  cat("1) Українська\n")
  cat("2) English\n")
  lang_choice <- readline("Enter number (1/2) and press ENTER: ")
  
  # Set labels according to language
  if (lang_choice == "2") {
    L <- list(
      start = "🇺🇦 Activating Ukrainian language for swirl... 🇺🇦\n\n",
      delete_prompt = "Do you want to remove local swirl courses?\n",
      yes = "1) Yes\n",
      no_continue = "2) No, continue\n",
      enter_choice = "Enter number (1/2) and press ENTER: ",
      no_courses = "ℹ️ No local courses found.\n",
      select_delete = "\nSelect a course to remove:\n",
      continue = "Continue",
      deleted = "  🗑️ Removed course: ",
      invalid = "⛔ Invalid choice. Try again.\n",
      skip_delete = "⏩ Skipped course removal.\n",
      install_prompt = "\nDo you want to install a local swirl course?\n",
      yes_install = "1) Yes\n",
      no_install = "2) No, continue\n",
      random_install = "3) Install a random course\n",
      available_courses = "\nℹ️ Available courses from swirl-courses folder:\n",
      enter_number_or_manual = "Select a course number to install, %d for manual input, or %d for random course: ",
      manual_course = "Enter course name (name_of_course): ",
      random_course = "Install a random course",
      not_found = "No local courses found. Enter course name manually (name_of_course): ",
      not_found_folder = "No local swirl-courses folder found. Enter course name manually (name_of_course): ",
      installing = "\nℹ️ Installing course from directory: ",
      installed = "✓ Course '%s' successfully installed and loaded!\n",
      not_exist = "❌ Course directory '%s' does not exist!\n",
      install_next = "\nWhat would you like to do next?\n1) Install another course\n2) Continue\n",
      packages_missing = "\n❗ Required packages not installed:\n   ",
      packages_action = "Choose an action:\n1) Install packages\n2) Continue without installing\n",
      packages_install_cmd = "\n📦 To install packages, run:\ninstall.packages(c(%s))\n",
      packages_next = "Type 'next()' after finishing package installation: ",
      packages_success = "✓ All required packages installed!\n",
      packages_skipped = "⚠️ Continuing without installing swirl packages.\nSome features may be unavailable.\n",
      swirl_loaded = "✓ swirl package loaded\n",
      swirl_not_installed = "❌ swirl package not installed, cannot continue!\n",
      translation_choose = "\nWhich translation version do you want to activate?\n1) Ukrainian phrases only\n2) Full Ukrainian translation\n3) Keep original (no translation)\n",
      translation_enter = "Enter number (1/2/3) and press ENTER: ",
      only_phrases = "\n🔄 Activating only Ukrainian phrases...\n",
      only_phrases_ok = "✓ Ukrainian phrases activated!\n",
      only_phrases_fail = "❌ Error activating Ukrainian phrases: ",
      full_translation = "\n🔄 Activating full Ukrainian translation...\n",
      full_translation_ok = "✓ Full Ukrainian translation activated!\n",
      full_translation_fail = "❌ Error activating full Ukrainian translation: ",
      keep_original = "\n⏩ Kept original swirl phrases and interface.\n",
      demo_title = "\n📋 PHRASES DEMONSTRATION\n",
      demo_sep = paste(rep("-", 50), collapse=""),
      demo_praise = "Praise phrases:\n",
      demo_try_again = "\nTry again phrases:\n",
      test_title = "\n🧪 TESTING\n",
      finish_ua = "\n🎉 UKRAINIAN LANGUAGE ACTIVATED! 🎉\n",
      swirl_start = "📚 Now run swirl() to start a course:\n\n    swirl()\n\n",
      commands = "💡 Useful commands:\n    activate_ukrainian_phrases_only()     # activate only Ukrainian phrases\n    activate_ukrainian_full_translation() # activate full Ukrainian translation\n    deactivate_ukrainian_translation()    # revert to standard English swirl\n    check_ukrainian_status()              # check translation status\n    quick_activate()                      # quick activation\n    quick_test()                          # quick phrase test\n    activate_ukrainian(demo=TRUE)         # show demo\n\n🚀 To start swirl, run:\n    swirl()\n\n"
    )
  } else {
    L <- list(
      start = "🇺🇦 Активація української мови для swirl... 🇺🇦\n\n",
      delete_prompt = "Бажаєте видалити локальні курси swirl?\n",
      yes = "1) Так\n",
      no_continue = "2) Ні, продовжити\n",
      enter_choice = "Введіть номер (1/2) та натисніть ENTER: ",
      no_courses = "ℹ️ Локальні курси не знайдено.\n",
      select_delete = "\nОберіть курс для видалення:\n",
      continue = "Продовжити",
      deleted = "  🗑️ Видалено курс: ",
      invalid = "⛔ Невірний вибір. Спробуйте ще раз.\n",
      skip_delete = "⏩ Пропущено видалення курсів.\n",
      install_prompt = "\nЧи бажаєте встановити локальний курс swirl?\n",
      yes_install = "1) Так\n",
      no_install = "2) Ні, продовжити\n",
      random_install = "3) Встановити рандомний курс\n",
      available_courses = "\nℹ️ Доступні курси з папки swirl-courses:\n",
      enter_number_or_manual = "Оберіть курс для встановлення за номером, %d для ручного вводу, або %d для рандомного курсу: ",
      manual_course = "Введіть назву курсу (name_of_course): ",
      random_course = "Встановити рандомний курс",
      not_found = "Не знайдено локальних курсів. Введіть назву курсу вручну (name_of_course): ",
      not_found_folder = "Не знайдено локальної папки swirl-courses. Введіть назву курсу вручну (name_of_course): ",
      installing = "\nℹ️ Встановлюю курс із директорії: ",
      installed = "✓ Курс '%s' успішно встановлено і завантажено!\n",
      not_exist = "❌ Директорія курсу '%s' не існує!\n",
      install_next = "\nЩо бажаєте зробити далі?\n1) Встановити ще курс\n2) Продовжити\n",
      packages_missing = "\n❗ Необхідні пакети не встановлені:\n   ",
      packages_action = "Виберіть дію:\n1) Встановити пакети\n2) Продовжити без встановлення\n",
      packages_install_cmd = "\n📦 Для встановлення пакетів виконайте:\ninstall.packages(c(%s))\n",
      packages_next = "Введіть 'next()' після завершення встановлення пакетів: ",
      packages_success = "✓ Всі необхідні пакети встановлені!\n",
      packages_skipped = "⚠️ Ви продовжили без встановлення пакетів swirl.\nДеякі функції можуть бути недоступні.\n",
      swirl_loaded = "✓ Пакет swirl завантажено\n",
      swirl_not_installed = "❌ Пакет swirl не встановлений, не можу продовжити!\n",
      translation_choose = "\nЯку версію перекладу бажаєте активувати?\n1) Тільки українські фрази (ukrainian_phrases_only)\n2) Повна українізація (ukrainian_full_translation)\n3) Залишити оригінал (без перекладу)\n",
      translation_enter = "Введіть номер (1/2/3) та натисніть ENTER: ",
      only_phrases = "\n🔄 Активую тільки українські фрази...\n",
      only_phrases_ok = "✓ Українські фрази активовано!\n",
      only_phrases_fail = "❌ Помилка активації українських фраз: ",
      full_translation = "\n🔄 Активую повну українізацію...\n",
      full_translation_ok = "✓ Повна українізація активована!\n",
      full_translation_fail = "❌ Помилка активації повної українізації: ",
      keep_original = "\n⏩ Залишено оригінальні фрази та інтерфейс swirl.\n",
      demo_title = "\n📋 ДЕМОНСТРАЦІЯ ФРАЗ / PHRASES DEMONSTRATION\n",
      demo_sep = paste(rep("-", 50), collapse=""),
      demo_praise = "Фрази похвали (Praise phrases):\n",
      demo_try_again = "\nФрази 'спробуй ще раз' (Try again phrases):\n",
      test_title = "\n🧪 ТЕСТУВАННЯ / TESTING\n",
      finish_ua = "\n🎉 УКРАЇНСЬКА МОВА АКТИВОВАНА! 🎉\n",
      swirl_start = "📚 Тепер запусти swirl() для початку курсу:\n\n    swirl()\n\n",
      commands = "💡 Корисні команди:\n    activate_ukrainian_phrases_only()     # активувати тільки українські фрази\n    activate_ukrainian_full_translation() # активувати повну українізацію\n    deactivate_ukrainian_translation()    # повернути стандартний англійський swirl\n    check_ukrainian_status()              # перевірити статус перекладу\n    quick_activate()                      # швидка активація\n    quick_test()                          # швидкий тест фраз\n    activate_ukrainian(demo=TRUE)         # показати демо\n\n🚀 Для старту swirl виконайте:\n    swirl()\n\n"
    )
  }
  
  cat(L$start)
  # --- Remove courses ---
  cat(L$delete_prompt)
  cat(L$yes)
  cat(L$no_continue)
  del_choice <- readline(L$enter_choice)
  
  swirl_courses_dir <- if (exists("swirl_courses_dir", where = asNamespace("swirl"), inherits = FALSE)) {
    suppressWarnings(swirl:::swirl_courses_dir())
  } else {
    file.path(Sys.getenv("HOME"), "R", "swirl", "Courses")
  }
  
  if (del_choice == "1" && dir.exists(swirl_courses_dir)) {
    repeat {
      courses <- list.dirs(swirl_courses_dir, full.names = TRUE, recursive = FALSE)
      if (length(courses) == 0) {
        cat(L$no_courses)
        break
      }
      cat(L$select_delete)
      for (i in seq_along(courses)) {
        cat(sprintf("%d) %s\n", i, basename(courses[i])))
      }
      cat(sprintf("%d) %s\n", length(courses) + 1, L$continue))
      course_choice <- suppressWarnings(as.integer(readline(L$enter_choice)))
      if (is.na(course_choice) || course_choice == (length(courses) + 1)) {
        break
      }
      if (course_choice >= 1 && course_choice <= length(courses)) {
        unlink(courses[course_choice], recursive = TRUE, force = TRUE)
        cat(L$deleted, basename(courses[course_choice]), "\n")
      } else {
        cat(L$invalid)
      }
    }
  } else if (del_choice == "2") {
    cat(L$skip_delete)
  }
  
  # --- Install local course ---
  cat(L$install_prompt)
  cat(L$yes_install)
  cat(L$no_install)
  cat(L$random_install)
  inst_choice <- readline(L$enter_choice)
  
  if (inst_choice == "1" || inst_choice == 1) {
    repeat {
      cat(L$available_courses)
      local_course_dir <- "swirl-courses"
      if (dir.exists(local_course_dir)) {
        course_paths <- list.dirs(local_course_dir, full.names = TRUE, recursive = FALSE)
        course_names <- basename(course_paths)
        n_manual <- length(course_names) + 1
        n_random <- length(course_names) + 2
        if (length(course_names) > 0) {
          for (i in seq_along(course_names)) {
            cat(sprintf("%d) %s\n", i, course_names[i]))
          }
          cat(sprintf("%d) %s\n", n_manual, ifelse(lang_choice=="2", "Manual input", "Ввести назву вручну")))
          cat(sprintf("%d) %s\n", n_random, ifelse(lang_choice=="2", "Install a random course", "Встановити рандомний курс")))
          course_choice <- suppressWarnings(
            as.integer(readline(sprintf(L$enter_number_or_manual, n_manual, n_random)))
          )
          if (is.na(course_choice)) {
            cat(L$invalid)
            next
          }
          if (course_choice == n_manual) {
            chosen_course <- readline(L$manual_course)
            course_path <- file.path(local_course_dir, chosen_course)
          } else if (course_choice == n_random) {
            # Select a random course
            set.seed(as.integer(Sys.time())) # different each time
            rand_idx <- sample(seq_along(course_names), 1)
            course_path <- course_paths[rand_idx]
            chosen_course <- course_names[rand_idx]
            cat(ifelse(lang_choice=="2", 
                       sprintf("Random course selected: %s\n", chosen_course), 
                       sprintf("Вибрано рандомний курс: %s\n", chosen_course)))
          } else if (course_choice >= 1 && course_choice <= length(course_names)) {
            course_path <- course_paths[course_choice]
            chosen_course <- course_names[course_choice]
          } else {
            cat(L$invalid)
            course_path <- NULL
          }
        } else {
          chosen_course <- readline(L$not_found)
          course_path <- file.path(local_course_dir, chosen_course)
        }
      } else {
        chosen_course <- readline(L$not_found_folder)
        course_path <- file.path(local_course_dir, chosen_course)
      }
      
      if (!is.null(course_path) && dir.exists(course_path)) {
        cat(L$installing, course_path, "\n")
        tryCatch({
          swirl::install_course_directory(course_path)
          cat(sprintf(L$installed, basename(course_path)))
        }, error = function(e) {
          cat(sprintf(L$not_exist, course_path), e$message, "\n")
        })
      } else if (!is.null(course_path)) {
        cat(sprintf(L$not_exist, course_path))
      }
      
      next_action <- readline(L$install_next)
      if (next_action == "2") break
    }
  } else if (inst_choice == "3" || inst_choice == 3) {
    # Random install shortcut: install a random course immediately
    local_course_dir <- "swirl-courses"
    if (dir.exists(local_course_dir)) {
      course_paths <- list.dirs(local_course_dir, full.names = TRUE, recursive = FALSE)
      course_names <- basename(course_paths)
      if (length(course_names) > 0) {
        set.seed(as.integer(Sys.time()))
        rand_idx <- sample(seq_along(course_names), 1)
        course_path <- course_paths[rand_idx]
        chosen_course <- course_names[rand_idx]
        cat(ifelse(lang_choice=="2", 
                   sprintf("Random course selected: %s\n", chosen_course), 
                   sprintf("Вибрано рандомний курс: %s\n", chosen_course)))
        if (!is.null(course_path) && dir.exists(course_path)) {
          cat(L$installing, course_path, "\n")
          tryCatch({
            swirl::install_course_directory(course_path)
            cat(sprintf(L$installed, basename(course_path)))
          }, error = function(e) {
            cat(sprintf(L$not_exist, course_path), e$message, "\n")
          })
        } else {
          cat(sprintf(L$not_exist, course_path))
        }
      } else {
        cat(L$not_found)
      }
    } else {
      cat(L$not_found_folder)
    }
  } else {
    cat(L$skip_delete)
  }
  
  # --- Packages check ---
  required_pkgs <- c("swirl")
  missing_pkgs <- required_pkgs[!sapply(required_pkgs, requireNamespace, quietly = TRUE)]
  if (length(missing_pkgs) > 0) {
    cat(L$packages_missing, paste(missing_pkgs, collapse = ", "), "\n")
    cat(L$packages_action)
    choice_pkgs <- readline(L$enter_choice)
    if (choice_pkgs == "1") {
      cat(sprintf(L$packages_install_cmd, paste(sprintf('"%s"', missing_pkgs), collapse = ", ")))
      repeat {
        next_cmd <- readline(L$packages_next)
        if (tolower(gsub("[()]", "", next_cmd)) == "next") break
      }
      still_missing <- missing_pkgs[!sapply(missing_pkgs, requireNamespace, quietly = TRUE)]
      if (length(still_missing) > 0) {
        stop("❌ Some packages are still not installed: ", paste(still_missing, collapse = ", "))
      } else {
        cat(L$packages_success)
      }
    } else {
      cat(L$packages_skipped)
    }
  }
  
  # --- Load swirl ---
  if (requireNamespace("swirl", quietly = TRUE)) {
    suppressPackageStartupMessages(library(swirl))
    cat(L$swirl_loaded)
  } else {
    cat(L$swirl_not_installed)
    return(invisible(FALSE))
  }
  
  # --- Translation choice ---
  cat(L$translation_choose)
  trans_choice <- readline(L$translation_enter)
  
  if (trans_choice == "1") {
    cat(L$only_phrases)
    tryCatch({
      source("ukrainian_phrases.R")
      ukrainian_phrases_activate()
      cat(L$only_phrases_ok)
    }, error = function(e) {
      cat(L$only_phrases_fail, e$message, "\n")
    })
  } else if (trans_choice == "2") {
    cat(L$full_translation)
    tryCatch({
      source("ukrainian_phrases.R")
      ukrainian_phrases_activate()
      if (file.exists("full_ukrainian_swirl.R")) {
        source("full_ukrainian_swirl.R")
        if (exists("full_ukrainian_swirl_activate")) {
          full_ukrainian_swirl_activate()
          cat(L$full_translation_ok)
        }
      }
    }, error = function(e) {
      cat(L$full_translation_fail, e$message, "\n")
    })
  } else {
    cat(L$keep_original)
  }
  
  # --- Demo & test ---
  if (demo) {
    cat(L$demo_title)
    cat(L$demo_sep, "\n")
    cat(L$demo_praise)
    for(i in 1:3) {
      cat("  ✓", praise_ua(), "\n")
    }
    cat(L$demo_try_again)
    for(i in 1:3) {
      cat("  ↻", tryAgain_ua(), "\n")
    }
    cat(L$demo_sep, "\n\n")
  }
  
  if (test) {
    cat(L$test_title)
    test_ukrainian_phrases()
  }
  
  # --- Finish ---
  cat(L$finish_ua)
  cat(L$swirl_start)
  cat(L$commands)
  
  invisible(TRUE)
}

# ==============================================================================
# Activation commands for user
# ==============================================================================

activate_ukrainian_phrases_only <- function() {
  source("ukrainian_phrases.R")
  ukrainian_phrases_activate()
  cat("✓ Українські фрази активовано!\n")
}

activate_ukrainian_full_translation <- function() {
  source("ukrainian_phrases.R")
  ukrainian_phrases_activate()
  if (file.exists("full_ukrainian_swirl.R")) {
    source("full_ukrainian_swirl.R")
    if (exists("full_ukrainian_swirl_activate")) {
      full_ukrainian_swirl_activate()
      cat("✓ Повна українізація активована!\n")
    }
  }
}

deactivate_ukrainian_translation <- function() {
  # Deactivate Ukrainian translation for swirl (restores English interface)
  if (!"swirl" %in% loadedNamespaces()) {
    cat("❌ swirl package is not loaded.\n")
    return(invisible(FALSE))
  }
  # Try to detach and reload swirl to restore original functions
  try({
    detach("package:swirl", unload = TRUE)
    suppressPackageStartupMessages(library(swirl))
    cat("🔁 Стандартний англійський swirl активовано.\n")
    cat("✅ Українську локалізацію вимкнено!\n")
    cat("Standard English swirl restored!\n")
  }, silent = TRUE)
  invisible(TRUE)
}


check_ukrainian_status <- function() {
  if (!"swirl" %in% loadedNamespaces()) {
    cat("❌ Пакет swirl не завантажений\n")
    return(invisible(FALSE))
  }
  tryCatch({
    current_praise <- get("praise", envir = asNamespace("swirl"))
    if (exists("praise_ua") && identical(current_praise, praise_ua)) {
      cat("✅ Українські фрази АКТИВНІ\n")
      cat("📋 Приклад: ", praise_ua(), "\n")
    } else {
      cat("⚠️ Англійські фрази активні\n")
    }
  }, error = function(e) {
    cat("❌ Помилка перевірки статусу: ", e$message, "\n")
  })
}

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
    if (exists("full_ukrainian_swirl_activate")) {
      full_ukrainian_swirl_activate()
    }
  }
  ukrainian_phrases_activate()
}

quick_test <- function() {
  cat("🧪 Швидкий тест фраз:\n")
  if (exists("praise_ua")) {
    cat("✓ Похвала:", praise_ua(), "\n")
    cat("↻ Спробуй ще раз:", tryAgain_ua(), "\n")
  } else {
    cat("❌ Українські фрази не завантажені. Виконай activate_ukrainian()\n")
  }
}