#' Update installed course: select from installed, delete and reinstall (English version)
update_installed_course_en <- function(local_course_dir = "swirl-courses") {
  swirl_courses_dir <- if (exists("swirl_courses_dir", where = asNamespace("swirl"), inherits = FALSE)) {
    suppressWarnings(swirl:::swirl_courses_dir())
  } else {
    file.path(Sys.getenv("HOME"), "R", "swirl", "Courses")
  }
  # Get list of installed courses
  if (dir.exists(swirl_courses_dir)) {
    installed_courses <- list.dirs(swirl_courses_dir, full.names = TRUE, recursive = FALSE)
    course_names <- basename(installed_courses)
    if (length(course_names) == 0) {
      cat("ℹ️ No installed courses found.\n")
      return(invisible(NULL))
    }
    cat("\nSelect a course to update (delete and reinstall):\n")
    for (i in seq_along(course_names)) {
      cat(sprintf("%d) %s\n", i, course_names[i]))
    }
    cat(sprintf("%d) Return\n", length(course_names) + 1))
    choice <- suppressWarnings(as.integer(readline("Enter course number: ")))
    if (!is.na(choice) && choice >= 1 && choice <= length(course_names)) {
      update_course_en(course_names[choice], local_course_dir)
    } else if (choice == (length(course_names) + 1)) {
      cat("⏪ Returning to menu.\n")
      return(invisible(NULL))
    } else {
      cat("⛔ Invalid choice. Try again.\n")
      return(invisible(NULL))
    }
  } else {
    cat("ℹ️ swirl installed courses folder not found.\n")
  }
}

#' Update course: delete and reinstall (English version)
update_course_en <- function(course_name, local_course_dir = "swirl-courses") {
  course_path <- file.path(local_course_dir, course_name)
  swirl_courses_dir <- if (exists("swirl_courses_dir", where = asNamespace("swirl"), inherits = FALSE)) {
    suppressWarnings(swirl:::swirl_courses_dir())
  } else {
    file.path(Sys.getenv("HOME"), "R", "swirl", "Courses")
  }
  installed_path <- file.path(swirl_courses_dir, course_name)
  if (dir.exists(installed_path)) {
    unlink(installed_path, recursive = TRUE, force = TRUE)
    cat(sprintf("🗑️ Course '%s' deleted.\n", course_name))
  } else {
    cat(sprintf("ℹ️ Course '%s' was not installed.\n", course_name))
  }
  if (dir.exists(course_path)) {
    cat(sprintf("ℹ️ Installing course from directory: %s\n", course_path))
    tryCatch({
      swirl::install_course_directory(course_path)
      cat(sprintf("✓ Course '%s' successfully installed and loaded!\n", course_name))
    }, error = function(e) {
      cat(sprintf("❌ Course directory '%s' does not exist! %s\n", course_path, e$message))
    })
  } else {
    cat(sprintf("❌ Course directory '%s' not found for installation!\n", course_path))
  }
}

#' Оновити встановлений курс: обрати з встановлених, видалити і встановити заново
update_installed_course <- function(local_course_dir = "swirl-courses") {
  swirl_courses_dir <- if (exists("swirl_courses_dir", where = asNamespace("swirl"), inherits = FALSE)) {
    suppressWarnings(swirl:::swirl_courses_dir())
  } else {
    file.path(Sys.getenv("HOME"), "R", "swirl", "Courses")
  }
  # Отримати список встановлених курсів
  if (dir.exists(swirl_courses_dir)) {
    installed_courses <- list.dirs(swirl_courses_dir, full.names = TRUE, recursive = FALSE)
    course_names <- basename(installed_courses)
    if (length(course_names) == 0) {
      cat("ℹ️ Встановлених курсів не знайдено.\n")
      return(invisible(NULL))
    }
    cat("\nОберіть курс для оновлення (видалити і встановити заново):\n")
    for (i in seq_along(course_names)) {
      cat(sprintf("%d) %s\n", i, course_names[i]))
    }
    cat(sprintf("%d) Повернутися\n", length(course_names) + 1))
    choice <- suppressWarnings(as.integer(readline("Введіть номер курсу: ")))
    if (!is.na(choice) && choice >= 1 && choice <= length(course_names)) {
      update_course(course_names[choice], local_course_dir)
    } else if (choice == (length(course_names) + 1)) {
      cat("⏪ Повернення до меню.\n")
      return(invisible(NULL))
    } else {
      cat("⛔ Невірний вибір. Спробуйте ще раз.\n")
      return(invisible(NULL))
    }
  } else {
    cat("ℹ️ Папка встановлених курсів swirl не знайдена.\n")
  }
}

#' Оновити курс: видалити і встановити заново
update_course <- function(course_name, local_course_dir = "swirl-courses") {
  # Шлях до курсу
  course_path <- file.path(local_course_dir, course_name)
  swirl_courses_dir <- if (exists("swirl_courses_dir", where = asNamespace("swirl"), inherits = FALSE)) {
    suppressWarnings(swirl:::swirl_courses_dir())
  } else {
    file.path(Sys.getenv("HOME"), "R", "swirl", "Courses")
  }
  # Видалити курс, якщо він встановлений
  installed_path <- file.path(swirl_courses_dir, course_name)
  if (dir.exists(installed_path)) {
    unlink(installed_path, recursive = TRUE, force = TRUE)
    cat(sprintf("🗑️ Курс '%s' видалено.\n", course_name))
  } else {
    cat(sprintf("ℹ️ Курс '%s' не був встановлений.\n", course_name))
  }
  # Встановити курс
  if (dir.exists(course_path)) {
    cat(sprintf("ℹ️ Встановлюю курс із директорії: %s\n", course_path))
    tryCatch({
      swirl::install_course_directory(course_path)
      cat(sprintf("✓ Курс '%s' успішно встановлено і завантажено!\n", course_name))
    }, error = function(e) {
      cat(sprintf("❌ Директорія курсу '%s' не існує! %s\n", course_path, e$message))
    })
  } else {
    cat(sprintf("❌ Директорія курсу '%s' не знайдена для встановлення!\n", course_path))
  }
}

# ГОЛОВНИЙ ФАЙЛ ДЛЯ АКТИВАЦІЇ УКРАЇНСЬКОЇ МОВИ В SWIRL
# MAIN FILE FOR ACTIVATING UKRAINIAN LANGUAGE IN SWIRL

# ==============================================================================
# Глобальний прапорець, щоб активація була лише один раз за сесію
# ==============================================================================

.swirl_ua_session_started <- FALSE # створюємо глобальний прапорець

activate <- function(demo = FALSE, test = FALSE) {
  # --- Language selection ---
  cat("Interface language?\n")
  cat("1) Українська\n")
  cat("2) English\n")
  lang_choice <- readline("Enter number (1/2) and press ENTER: ")
  
  # Set labels according to language
  if (lang_choice == "2") {
    L <- list(
      lang_choice = "2",
      start = "🇺🇦 Activating Ukrainian language for swirl... 🇺🇦\n\n",
      available_options = "\nAvailable options?\n",
      option_continue = "1) Continue\n",
      option_install = "2) Install\n",
      option_delete = "3) Delete\n",
      option_update_installed = "4) Update installed course\n",
      enter_choice = "Enter number (1/2/3/4) and press ENTER: ",
      enter_choice_simple = "Enter number and press ENTER: ",
      delete_prompt = "Do you want to remove local swirl courses?\n",
      yes = "1) Yes\n",
      no_continue = "2) Return\n",
      no_courses = "ℹ️ No local courses found.\n",
      select_delete = "\nSelect a course to remove:\n",
      continue = "Return",
      deleted = "  🗑️ Removed course: ",
      invalid = "⛔ Invalid choice. Try again.\n",
      skip_delete = "⏩ Skipped course removal.\n",
      install_prompt = "\nDo you want to install a local swirl course?\n",
      yes_install = "1) Yes\n",
      no_install = "2) Return\n",
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
      install_next = "\nWhat would you like to do next?\n1) Install another course\n2) Return\n",
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
      commands = "💡 Useful commands:\n    info_fun()                            # show all available functions\n    activate_ukrainian_phrases_only()     # activate only Ukrainian phrases\n    activate_ukrainian_full_translation() # activate full Ukrainian translation\n    deactivate_ukrainian_translation()    # revert to standard English swirl\n    check_ukrainian_status()              # check translation status\n    quick_activate()                      # quick activation\n    quick_test()                          # quick phrase test\n    activate(demo=TRUE)                   # show demo\n    install_course_interactive()          # install courses interactively\n    delete_course_interactive()           # delete courses interactively\n    update_course_interactive()           # update courses interactively\n\n🚀 To start swirl, run:\n    swirl()\n\n",
      swirl_run_prompt = "\nRun swirl now?\n1) Yes\n2) No\n"
    )
  } else {
    L <- list(
      lang_choice = "1",
      start = "🇺🇦 Активація української мови для swirl... 🇺🇦\n\n",
      available_options = "\nДоступні опції?\n",
      option_continue = "1) Продовжити\n",
      option_install = "2) Встановити\n",
      option_delete = "3) Видалити\n",
      option_update_installed = "4) Оновити встановлений курс\n",
      enter_choice = "Введіть номер (1/2/3/4) та натисніть ENTER: ",
      enter_choice_simple = "Введіть номер та натисніть ENTER: ",
      delete_prompt = "Бажаєте видалити локальні курси swirl?\n",
      yes = "1) Так\n",
      no_continue = "2) Повернутися\n",
      no_courses = "ℹ️ Локальні курси не знайдено.\n",
      select_delete = "\nОберіть курс для видалення:\n",
      continue = "Повернутися",
      deleted = "  🗑️ Видалено курс: ",
      invalid = "⛔ Невірний вибір. Спробуйте ще раз.\n",
      skip_delete = "⏩ Пропущено видалення курсів.\n",
      install_prompt = "\nЧи бажаєте встановити локальний курс swirl?\n",
      yes_install = "1) Так\n",
      no_install = "2) Повернутися\n",
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
      install_next = "\nЩо бажаєте зробити далі?\n1) Встановити ще курс\n2) Повернутися\n",
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
      commands = "💡 Корисні команди:\n    info_fun()                            # показати всі доступні функції\n    activate_ukrainian_phrases_only()     # активувати тільки українські фрази\n    activate_ukrainian_full_translation() # активувати повну українізацію\n    deactivate_ukrainian_translation()    # повернути стандартний англійський swirl\n    check_ukrainian_status()              # перевірити статус перекладу\n    quick_activate()                      # швидка активація\n    quick_test()                          # швидкий тест фраз\n    activate(demo=TRUE)                   # показати демо\n    install_course_interactive()          # встановити курси інтерактивно\n    delete_course_interactive()           # видалити курси інтерактивно\n    update_course_interactive()           # оновити курси інтерактивно\n\n🚀 Для старту swirl виконайте:\n    swirl()\n\n",
      swirl_run_prompt = "\nЗапустити swirl?\n1) Так\n2) Ні\n"
    )
  }
  
  cat(L$start)
  
  swirl_courses_dir <- if (exists("swirl_courses_dir", where = asNamespace("swirl"), inherits = FALSE)) {
    suppressWarnings(swirl:::swirl_courses_dir())
  } else {
    file.path(Sys.getenv("HOME"), "R", "swirl", "Courses")
  }
  
  # --- Main options menu loop ---
  repeat {
    cat(L$available_options)
    cat(L$option_continue)
    cat(L$option_install)
    cat(L$option_delete)
    cat(L$option_update_installed)
    main_choice <- readline(L$enter_choice)
    
    if (main_choice == "1") {
      # Continue - exit the loop
      break
    } else if (main_choice == "3") {
      # --- Remove courses ---
      cat(L$delete_prompt)
      cat(L$yes)
      cat(L$no_continue)
      del_choice <- readline(ifelse(lang_choice=="2", "Enter number (1/2) and press ENTER: ", "Введіть номер (1/2) та натисніть ENTER: "))
      
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
          course_choice <- suppressWarnings(as.integer(readline(L$enter_choice_simple)))
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
      # After deletion, continue the main loop to show options again
      
    } else if (main_choice == "2") {
      # --- Install local course ---
      cat(L$install_prompt)
      cat(L$yes_install)
      cat(L$no_install)
      cat(L$random_install)
      inst_choice <- readline(ifelse(lang_choice=="2", "Enter number (1/2/3) and press ENTER: ", "Введіть номер (1/2/3) та натисніть ENTER: "))
      
      if (inst_choice == "1") {
        repeat {
          cat(L$available_courses)
          local_course_dir <- "swirl-courses"
          if (dir.exists(local_course_dir)) {
            course_paths <- list.dirs(local_course_dir, full.names = TRUE, recursive = FALSE)
            course_names <- basename(course_paths)
            n_manual <- length(course_names) + 1
            n_random <- length(course_names) + 2
            n_return <- length(course_names) + 3
            if (length(course_names) > 0) {
              for (i in seq_along(course_names)) {
                cat(sprintf("%d) %s\n", i, course_names[i]))
              }
              cat(sprintf("%d) %s\n", n_manual, ifelse(lang_choice=="2", "Manual input", "Ввести назву вручну")))
              cat(sprintf("%d) %s\n", n_random, ifelse(lang_choice=="2", "Install a random course", "Встановити рандомний курс")))
              cat(sprintf("%d) %s\n", n_return, ifelse(lang_choice=="2", "Return", "Повернутися")))
              course_choice <- suppressWarnings(
                as.integer(readline(L$enter_choice_simple))
              )
              if (is.na(course_choice)) {
                cat(L$invalid)
                next
              }
              if (course_choice == n_manual) {
                chosen_course <- readline(L$manual_course)
                course_path <- file.path(local_course_dir, chosen_course)
              } else if (course_choice == n_random) {
                set.seed(as.integer(Sys.time()))
                rand_idx <- sample(seq_along(course_names), 1)
                course_path <- course_paths[rand_idx]
                chosen_course <- course_names[rand_idx]
                cat(ifelse(lang_choice=="2", 
                           sprintf("Random course selected: %s\n", chosen_course), 
                           sprintf("Вибрано рандомний курс: %s\n", chosen_course)))
              } else if (course_choice >= 1 && course_choice <= length(course_names)) {
                course_path <- course_paths[course_choice]
                chosen_course <- course_names[course_choice]
              } else if (course_choice == n_return) {
                break
              } else {
                cat(L$invalid)
                next
              }
            } else {
              chosen_course <- readline(L$not_found)
              course_path <- file.path(local_course_dir, chosen_course)
            }
          } else {
            chosen_course <- readline(L$not_found_folder)
            course_path <- file.path(local_course_dir, chosen_course)
          }
          
          if (!is.null(course_path) && course_choice != n_return && dir.exists(course_path)) {
            cat(L$installing, course_path, "\n")
            tryCatch({
              swirl::install_course_directory(course_path)
              cat(sprintf(L$installed, basename(course_path)))
            }, error = function(e) {
              cat(sprintf(L$not_exist, course_path), e$message, "\n")
            })
          } else if (!is.null(course_path) && course_choice != n_return) {
            cat(sprintf(L$not_exist, course_path))
          }
          
          if (course_choice == n_return) break
          
          # Після встановлення автоматично вийти з циклу встановлення
          if (course_choice != n_return && !is.null(course_path)) {
            cat(ifelse(lang_choice=="2", 
                       "✅ Installation completed. Returning to main menu.\n", 
                       "✅ Встановлення завершено. Повернення до головного меню.\n"))
            break
          }
        }
      } else if (inst_choice == "3") {
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
      # After installation, continue the main loop to show options again
      
    } else if (main_choice == "4") {
      # --- Update installed course ---
      if (lang_choice == "2") {
        update_installed_course_en()
      } else {
        update_installed_course()
      }
      # After update, return to main menu
      
    } else {
      cat(L$invalid)
      # Invalid choice - continue the main loop
    }
  }
  
  # --- Packages check ---
  required_pkgs <- c("swirl")
  missing_pkgs <- required_pkgs[!sapply(required_pkgs, requireNamespace, quietly = TRUE)]
  if (length(missing_pkgs) > 0) {
    cat(L$packages_missing, paste(missing_pkgs, collapse = ", "), "\n")
    cat(L$packages_action)
    choice_pkgs <- readline(ifelse(lang_choice=="2", "Enter number (1/2) and press ENTER: ", "Введіть номер (1/2) та натисніть ENTER: "))
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
      # Встановлюємо тихий режим перед завантаженням
      assign(".quiet_mode", TRUE, envir = .GlobalEnv)
      source("ukrainian_phrases.R")
      ukrainian_phrases_activate(quiet = TRUE)
      cat(L$only_phrases_ok)
    }, error = function(e) {
      cat(L$only_phrases_fail, e$message, "\n")
    })
  } else if (trans_choice == "2") {
    cat(L$full_translation)
    tryCatch({
      # Встановлюємо тихий режим для обох файлів
      assign(".quiet_mode", TRUE, envir = .GlobalEnv)
      assign(".quiet_mode_full", TRUE, envir = .GlobalEnv)
      source("ukrainian_phrases.R")
      ukrainian_phrases_activate(quiet = TRUE)
      if (file.exists("full_ukrainian_swirl.R")) {
        source("full_ukrainian_swirl.R")
        if (exists("full_ukrainian_swirl_activate")) {
          full_ukrainian_swirl_activate(quiet = TRUE)
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
  
  # --- Помічаємо, що активація завершена ---
  assign(".swirl_ua_session_started", TRUE, envir = .GlobalEnv)
  
  # --- Clean up activation functions from global environment ---
  tryCatch({
    rm(list = c("update_course", "update_course_en"), envir = .GlobalEnv)
  }, error = function(e) {
    # Ignore errors if functions don't exist
  })
  
  # --- Prompt to run swirl ---
  repeat {
    cat(L$swirl_run_prompt)
    swirl_run_choice <- readline(ifelse(lang_choice=="2", "Enter number (1/2) and press ENTER: ", "Введіть номер (1/2) та натисніть ENTER: "))
    
    if (swirl_run_choice == "1") {
      # Тихо перезавантажити переклад
      if (trans_choice == "1") {
        assign(".quiet_mode", TRUE, envir = .GlobalEnv)
        suppressMessages(source("ukrainian_phrases.R"))
        suppressMessages(ukrainian_phrases_activate(quiet = TRUE))
      } else if (trans_choice == "2") {
        assign(".quiet_mode", TRUE, envir = .GlobalEnv)
        assign(".quiet_mode_full", TRUE, envir = .GlobalEnv)
        suppressMessages(source("ukrainian_phrases.R"))
        suppressMessages(ukrainian_phrases_activate(quiet = TRUE))
        if (file.exists("full_ukrainian_swirl.R")) {
          suppressMessages(source("full_ukrainian_swirl.R"))
          suppressMessages(full_ukrainian_swirl_activate(quiet = TRUE))
        }
      }
      
      # Очистити тільки тимчасові змінні активації
      cleanup_vars <- c("L", "lang_choice", "trans_choice", "main_choice", "swirl_run_choice",
                        "del_choice", "inst_choice", "course_choice", "next_action", 
                        "choice_pkgs", "swirl_courses_dir", "required_pkgs", "missing_pkgs",
                        "still_missing", "courses", "course_paths", "course_names",
                        "chosen_course", "course_path", "n_manual", "n_random", "n_return",
                        "rand_idx", "installed_courses", "local_course_dir", "activate")
      
      existing_vars <- intersect(cleanup_vars, ls(envir = .GlobalEnv))
      if (length(existing_vars) > 0) {
        rm(list = existing_vars, envir = .GlobalEnv)
      }
      
      cat("\n🚀 Запуск swirl...\n")
      swirl()
      break
      
    } else if (swirl_run_choice == "2") {
      # Очистити тільки тимчасові змінні активації
      cleanup_vars <- c("L", "lang_choice", "trans_choice", "main_choice", "swirl_run_choice",
                        "del_choice", "inst_choice", "course_choice", "next_action", 
                        "choice_pkgs", "swirl_courses_dir", "required_pkgs", "missing_pkgs",
                        "still_missing", "courses", "course_paths", "course_names",
                        "chosen_course", "course_path", "n_manual", "n_random", "n_return",
                        "rand_idx", "installed_courses", "local_course_dir")
      
      existing_vars <- intersect(cleanup_vars, ls(envir = .GlobalEnv))
      if (length(existing_vars) > 0) {
        rm(list = existing_vars, envir = .GlobalEnv)
      }
      
      cat(ifelse(lang_choice=="2", "You can run swirl() later to start.", "Ви можете виконати swirl() пізніше для старту.\n"))
      break
      
    } else {
      cat(L$invalid)
    }
  }
  
  invisible(TRUE)
}

# ==============================================================================
# Activation commands for user
# ==============================================================================

activate_ukrainian_phrases_only <- function() {
  assign(".quiet_mode", TRUE, envir = .GlobalEnv)
  source("ukrainian_phrases.R")
  ukrainian_phrases_activate(quiet = FALSE)
  cat("✓ Українські фрази активовано!\n")
}

activate_ukrainian_full_translation <- function() {
  assign(".quiet_mode", TRUE, envir = .GlobalEnv)
  assign(".quiet_mode_full", TRUE, envir = .GlobalEnv)
  source("ukrainian_phrases.R")
  ukrainian_phrases_activate(quiet = TRUE)
  if (file.exists("full_ukrainian_swirl.R")) {
    source("full_ukrainian_swirl.R")
    if (exists("full_ukrainian_swirl_activate")) {
      full_ukrainian_swirl_activate(quiet = FALSE)
      cat("✓ Повна українізація активована!\n")
    }
  }
}

deactivate_ukrainian_translation <- function() {
  # Скидає прапорець, щоб можна було провести активацію заново
  assign(".swirl_ua_session_started", FALSE, envir = .GlobalEnv)
  # Деактивація української локалізації
  if (!"swirl" %in% loadedNamespaces()) {
    cat("❌ swirl package is not loaded.\n")
    return(invisible(FALSE))
  }
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
  if (!requireNamespace("swirl", quietly = TRUE)) {
    install.packages("swirl")
    library(swirl)
  } else {
    library(swirl)
  }
  assign(".quiet_mode", TRUE, envir = .GlobalEnv)
  assign(".quiet_mode_full", TRUE, envir = .GlobalEnv)
  source("ukrainian_phrases.R")
  if (file.exists("full_ukrainian_swirl.R")) {
    source("full_ukrainian_swirl.R")
    if (exists("full_ukrainian_swirl_activate")) {
      full_ukrainian_swirl_activate(quiet = TRUE)
    }
  }
  ukrainian_phrases_activate(quiet = TRUE)
}

quick_test <- function() {
  cat("🧪 Швидкий тест фраз:\n")
  if (exists("praise_ua")) {
    cat("✓ Похвала:", praise_ua(), "\n")
    cat("↻ Спробуй ще раз:", tryAgain_ua(), "\n")
  } else {
    cat("❌ Українські фрази не завантажені. Виконай activate()\n")
  }
}

# ==============================================================================
# Course management functions / Функції керування курсами
# ==============================================================================
#' Показати інформацію про всі доступні функції / Show information about all available functions
info_fun <- function() {
  cat("🇺🇦 UKRAINIAN SWIRL - ДОСТУПНІ ФУНКЦІЇ / AVAILABLE FUNCTIONS 🇺🇦\n")
  cat("================================================================\n\n")
  
  cat("📋 ОСНОВНІ ФУНКЦІЇ / MAIN FUNCTIONS:\n")
  cat("------------------------------------\n")
  cat("activate()                               # Головна функція активації (вимикається після запуску `swril()` в кінці `activate()` ) \n")
  cat("activate(demo=TRUE)                      # Показати демо фраз \n")
  cat("activate(test=TRUE)                      # Тестування фраз \n\n")
  
  cat("🔧 ФУНКЦІЇ ПЕРЕКЛАДУ / TRANSLATION FUNCTIONS:\n")
  cat("----------------------------------------------\n")
  cat("activate_ukrainian_phrases_only()        # Активувати тільки українські фрази\n")
  cat("                                         # Activate only Ukrainian phrases\n\n")
  cat("activate_ukrainian_full_translation()    # Активувати повну українізацію\n")
  cat("                                         # Activate full Ukrainian translation\n\n")
  cat("deactivate_ukrainian_translation()       # Повернути стандартний англійський swirl\n")
  cat("                                         # Revert to standard English swirl\n\n")
  cat("check_ukrainian_status()                 # Перевірити статус перекладу\n")
  cat("                                         # Check translation status\n\n")
  
  cat("⚡ ШВИДКІ ФУНКЦІЇ / QUICK FUNCTIONS:\n")
  cat("------------------------------------\n")
  cat("quick_activate()                         # Швидка активація повної українізації\n")
  cat("                                         # Quick full Ukrainian activation\n\n")
  cat("quick_test()                             # Швидкий тест фраз\n")
  cat("                                         # Quick phrase test\n\n")
  
  cat("📦 КЕРУВАННЯ КУРСАМИ / COURSE MANAGEMENT:\n")
  cat("-----------------------------------------\n")
  cat("install_course_interactive()             # Інтерактивне встановлення курсів\n")
  cat("                                         # Interactive course installation\n\n")
  cat("delete_course_interactive()              # Інтерактивне видалення курсів\n")
  cat("                                         # Interactive course deletion\n\n")
  cat("update_course_interactive()              # Інтерактивне оновлення курсів\n")
  cat("                                         # Interactive course update\n\n")
  
  cat("ℹ️ ДОПОМІЖНІ ФУНКЦІЇ / HELPER FUNCTIONS:\n")
  cat("----------------------------------------\n")
  cat("info_fun()                               # Показати цю довідку\n")
  cat("                                         # Show this help information\n\n")
  
  cat("🚀 ЗАПУСК SWIRL / START SWIRL:\n")
  cat("------------------------------\n")
  cat("swirl()                                  # Запустити swirl після активації\n")
  cat("                                         # Start swirl after activation\n\n")
  
  cat("📝 ПРИКЛАДИ ВИКОРИСТАННЯ / USAGE EXAMPLES:\n")
  cat("------------------------------------------\n")
  cat("# Перший запуск / First run:\n")
  cat("activate()                               # Пройти повну активацію\n\n")
  
  cat("# Швидкий старт / Quick start:\n")
  cat("quick_activate()                         # Швидка активація\n")
  cat("swirl()                                  # Запуск swirl\n\n")
  
  cat("# Керування курсами / Course management:\n")
  cat("install_course_interactive()             # Встановити курси\n")
  cat("update_course_interactive()              # Оновити курси\n")
  cat("delete_course_interactive()              # Видалити курси\n\n")
  
  cat("# Перевірка статусу / Status check:\n")
  cat("check_ukrainian_status()                 # Перевірити активний переклад\n")
  cat("quick_test()                             # Тест українських фраз\n\n")
  
  cat("💡 ПОРАДИ / TIPS:\n")
  cat("-----------------\n")
  cat("• Використовуйте activate() для першого налаштування\n")
  cat("  Use activate() for initial setup\n\n")
  cat("• Використовуйте quick_activate() для швидкого старту\n")
  cat("  Use quick_activate() for quick start\n\n")
  cat("• Всі функції працюють незалежно від activate()\n")
  cat("  All functions work independently from activate()\n\n")
  cat("• Для повернення до англійської версії: deactivate_ukrainian_translation()\n")
  cat("  To return to English version: deactivate_ukrainian_translation()\n\n")
  
  cat("🆘 ДОПОМОГА / HELP:\n")
  cat("-------------------\n")
  cat("Якщо виникли проблеми, спробуйте:\n")
  cat("If you encounter problems, try:\n\n")
  cat("1. deactivate_ukrainian_translation()    # Скинути до англійської версії\n")
  cat("2. source('activate_ukrainian.R')        # Повторний запуск скрипту\n\n")
  cat("3. activate()                            # Повторна активація\n\n")
  
  cat("✅ Готово! / Done! Виберіть потрібну функцію з списку вище.\n")
  cat("Choose the needed function from the list above.\n")
}

#' Інтерактивне встановлення курсів
install_course_interactive <- function(local_course_dir = "swirl-courses") {
  cat("📦 ВСТАНОВЛЕННЯ КУРСІВ / COURSE INSTALLATION\n")
  cat("==========================================\n\n")
  
  repeat {
    cat("ℹ️ Доступні курси з папки swirl-courses / Available courses from swirl-courses folder:\n")
    
    if (dir.exists(local_course_dir)) {
      course_paths <- list.dirs(local_course_dir, full.names = TRUE, recursive = FALSE)
      course_names <- basename(course_paths)
      n_manual <- length(course_names) + 1
      n_random <- length(course_names) + 2
      n_return <- length(course_names) + 3
      
      if (length(course_names) > 0) {
        for (i in seq_along(course_names)) {
          cat(sprintf("%d) %s\n", i, course_names[i]))
        }
        cat(sprintf("%d) Ввести назву вручну / Manual input\n", n_manual))
        cat(sprintf("%d) Встановити рандомний курс / Install random course\n", n_random))
        cat(sprintf("%d) Повернутися / Return\n", n_return))
        
        course_choice <- suppressWarnings(as.integer(readline("Введіть номер / Enter number: ")))
        
        if (is.na(course_choice)) {
          cat("⛔ Невірний вибір. Спробуйте ще раз / Invalid choice. Try again.\n")
          next
        }
        
        if (course_choice == n_manual) {
          chosen_course <- readline("Введіть назву курсу / Enter course name: ")
          course_path <- file.path(local_course_dir, chosen_course)
        } else if (course_choice == n_random) {
          set.seed(as.integer(Sys.time()))
          rand_idx <- sample(seq_along(course_names), 1)
          course_path <- course_paths[rand_idx]
          chosen_course <- course_names[rand_idx]
          cat(sprintf("Вибрано рандомний курс / Random course selected: %s\n", chosen_course))
        } else if (course_choice >= 1 && course_choice <= length(course_names)) {
          course_path <- course_paths[course_choice]
          chosen_course <- course_names[course_choice]
        } else if (course_choice == n_return) {
          break
        } else {
          cat("⛔ Невірний вибір. Спробуйте ще раз / Invalid choice. Try again.\n")
          next
        }
        
      } else {
        chosen_course <- readline("Не знайдено локальних курсів. Введіть назву курсу вручну / No local courses found. Enter course name manually: ")
        course_path <- file.path(local_course_dir, chosen_course)
      }
    } else {
      chosen_course <- readline("Не знайдено папки swirl-courses. Введіть назву курсу вручну / No swirl-courses folder found. Enter course name manually: ")
      course_path <- file.path(local_course_dir, chosen_course)
    }
    
    if (course_choice != n_return && dir.exists(course_path)) {
      cat(sprintf("ℹ️ Встановлюю курс / Installing course: %s\n", course_path))
      tryCatch({
        swirl::install_course_directory(course_path)
        cat(sprintf("✓ Курс '%s' успішно встановлено! / Course '%s' successfully installed!\n", basename(course_path), basename(course_path)))
      }, error = function(e) {
        cat(sprintf("❌ Помилка встановлення / Installation error: %s\n", e$message))
      })
    } else if (course_choice != n_return) {
      cat(sprintf("❌ Директорія курсу '%s' не існує! / Course directory '%s' does not exist!\n", course_path, course_path))
    }
    
    if (course_choice == n_return) break
    
    next_action <- readline("Що далі? 1) Встановити ще курс 2) Вийти / What next? 1) Install another course 2) Exit: ")
    if (next_action == "2") break
  }
  
  cat("✅ Завершено / Completed!\n")
}

#' Інтерактивне видалення курсів
delete_course_interactive <- function() {
  cat("🗑️ ВИДАЛЕННЯ КУРСІВ / COURSE DELETION\n")
  cat("====================================\n\n")
  
  swirl_courses_dir <- if (exists("swirl_courses_dir", where = asNamespace("swirl"), inherits = FALSE)) {
    suppressWarnings(swirl:::swirl_courses_dir())
  } else {
    file.path(Sys.getenv("HOME"), "R", "swirl", "Courses")
  }
  
  if (!dir.exists(swirl_courses_dir)) {
    cat("ℹ️ Папка встановлених курсів swirl не знайдена / swirl installed courses folder not found.\n")
    return(invisible(NULL))
  }
  
  repeat {
    courses <- list.dirs(swirl_courses_dir, full.names = TRUE, recursive = FALSE)
    if (length(courses) == 0) {
      cat("ℹ️ Встановлених курсів не знайдено / No installed courses found.\n")
      break
    }
    
    cat("Оберіть курс для видалення / Select a course to remove:\n")
    for (i in seq_along(courses)) {
      cat(sprintf("%d) %s\n", i, basename(courses[i])))
    }
    cat(sprintf("%d) Повернутися / Return\n", length(courses) + 1))
    
    course_choice <- suppressWarnings(as.integer(readline("Введіть номер / Enter number: ")))
    if (is.na(course_choice) || course_choice == (length(courses) + 1)) {
      break
    }
    
    if (course_choice >= 1 && course_choice <= length(courses)) {
      course_name <- basename(courses[course_choice])
      confirm <- readline(sprintf("Дійсно видалити курс '%s'? (y/N) / Really delete course '%s'? (y/N): ", course_name, course_name))
      if (tolower(confirm) %in% c("y", "yes", "так", "т")) {
        unlink(courses[course_choice], recursive = TRUE, force = TRUE)
        cat(sprintf("🗑️ Видалено курс / Removed course: %s\n", course_name))
      } else {
        cat("⏩ Скасовано / Cancelled.\n")
      }
    } else {
      cat("⛔ Невірний вибір. Спробуйте ще раз / Invalid choice. Try again.\n")
    }
  }
  
  cat("✅ Завершено / Completed!\n")
}

#' Інтерактивне оновлення курсів
update_course_interactive <- function(local_course_dir = "swirl-courses") {
  cat("🔄 ОНОВЛЕННЯ КУРСІВ / COURSE UPDATE\n")
  cat("==================================\n\n")
  
  swirl_courses_dir <- if (exists("swirl_courses_dir", where = asNamespace("swirl"), inherits = FALSE)) {
    suppressWarnings(swirl:::swirl_courses_dir())
  } else {
    file.path(Sys.getenv("HOME"), "R", "swirl", "Courses")
  }
  
  if (!dir.exists(swirl_courses_dir)) {
    cat("ℹ️ Папка встановлених курсів swirl не знайдена / swirl installed courses folder not found.\n")
    return(invisible(NULL))
  }
  
  installed_courses <- list.dirs(swirl_courses_dir, full.names = TRUE, recursive = FALSE)
  course_names <- basename(installed_courses)
  
  if (length(course_names) == 0) {
    cat("ℹ️ Встановлених курсів не знайдено / No installed courses found.\n")
    return(invisible(NULL))
  }
  
  repeat {
    cat("Оберіть курс для оновлення (видалити і встановити заново) / Select a course to update (delete and reinstall):\n")
    for (i in seq_along(course_names)) {
      cat(sprintf("%d) %s\n", i, course_names[i]))
    }
    cat(sprintf("%d) Повернутися / Return\n", length(course_names) + 1))
    
    choice <- suppressWarnings(as.integer(readline("Введіть номер / Enter number: ")))
    if (is.na(choice) || choice == (length(course_names) + 1)) {
      break
    }
    
    if (choice >= 1 && choice <= length(course_names)) {
      course_name <- course_names[choice]
      course_path <- file.path(local_course_dir, course_name)
      installed_path <- file.path(swirl_courses_dir, course_name)
      
      cat(sprintf("🔄 Оновлюю курс / Updating course: %s\n", course_name))
      
      # Видалити встановлений курс
      if (dir.exists(installed_path)) {
        unlink(installed_path, recursive = TRUE, force = TRUE)
        cat(sprintf("🗑️ Курс '%s' видалено / Course '%s' deleted.\n", course_name, course_name))
      } else {
        cat(sprintf("ℹ️ Курс '%s' не був встановлений / Course '%s' was not installed.\n", course_name, course_name))
      }
      
      # Встановити курс заново
      if (dir.exists(course_path)) {
        cat(sprintf("ℹ️ Встановлюю курс / Installing course from: %s\n", course_path))
        tryCatch({
          swirl::install_course_directory(course_path)
          cat(sprintf("✓ Курс '%s' успішно оновлено! / Course '%s' successfully updated!\n", course_name, course_name))
        }, error = function(e) {
          cat(sprintf("❌ Помилка встановлення / Installation error: %s\n", e$message))
        })
      } else {
        cat(sprintf("❌ Директорія курсу '%s' не знайдена! / Course directory '%s' not found!\n", course_path, course_path))
      }
      
      next_action <- readline("Що далі? / What next?\n1) Оновити ще курс / Update another course\n2) Вийти / Exit\nВведіть номер / Enter number (1/2): ")
      if (next_action == "2") break
      
    } else {
      cat("⛔ Невірний вибір. Спробуйте ще раз / Invalid choice. Try again.\n")
    }
  }
  
  cat("✅ Завершено / Completed!\n")
  
}