# MAIN FILE FOR ACTIVATING UKRAINIAN LANGUAGE IN SWIRL

# Load labels dictionary
source("activate_ukrainian_labels.R")

al <- function(name, lang = NULL) {
  lang_code <- if (is.null(lang)) get("lang_code", envir = .GlobalEnv, inherits = FALSE) else lang
  activate_labels[[lang_code]][[name]]
}

get_swirl_courses_dir <- function() {
  if (exists("swirl_courses_dir", where = asNamespace("swirl"), inherits = FALSE)) {
    suppressWarnings(swirl:::swirl_courses_dir())
  } else {
    file.path(Sys.getenv("HOME"), "R", "swirl", "Courses")
  }
}

.swirl_ua_session_started <- FALSE

activate <- function(demo = FALSE, test = FALSE) {
  if (exists(".swirl_ua_session_started", envir = .GlobalEnv) &&
      get(".swirl_ua_session_started", envir = .GlobalEnv)) {
    cat("Активація вже проведена. Просто запускаємо swirl.\n")
    swirl()
    return(invisible(TRUE))
  }
  
  cat("Interface language?\n")
  cat("1) Українська\n")
  cat("2) English\n")
  lang_choice <- readline("Enter number (1/2) and press ENTER: ")
  lang_code <- if (lang_choice == "2") "en" else "uk"
  assign("lang_code", lang_code, envir = .GlobalEnv)
  cat(al("start"))
  
  swirl_courses_dir <- get_swirl_courses_dir()
  
  repeat {
    cat(al("available_options"))
    cat(al("option_continue"))
    cat(al("option_install"))
    cat(al("option_delete"))
    cat(al("option_update_installed"))
    main_choice <- readline(al("enter_choice"))
    
    if (main_choice == "1") break
    
    if (main_choice == "3") {
      cat(al("delete_prompt"))
      cat(al("yes"))
      cat(al("no_continue"))
      del_choice <- readline(al("enter_choice"))
      if (del_choice == "1" && dir.exists(swirl_courses_dir)) {
        repeat {
          courses <- list.dirs(swirl_courses_dir, full.names = TRUE, recursive = FALSE)
          if (length(courses) == 0) {
            cat(al("no_courses"))
            break
          }
          cat(al("select_delete"))
          for (i in seq_along(courses)) cat(sprintf("%d) %s\n", i, basename(courses[i])))
          cat(sprintf("%d) %s\n", length(courses) + 1, al("continue")))
          course_choice <- suppressWarnings(as.integer(readline(al("enter_choice_simple")))
          )
          if (is.na(course_choice) || course_choice == (length(courses) + 1)) break
          if (course_choice >= 1 && course_choice <= length(courses)) {
            unlink(courses[course_choice], recursive = TRUE, force = TRUE)
            cat(al("deleted"), basename(courses[course_choice]), "\n")
          } else cat(al("invalid"))
        }
      } else if (del_choice == "2") cat(al("skip_delete"))
      next
    }
    
    if (main_choice == "2") {
      install_course_interactive()
      next
    }
    
    if (main_choice == "4") {
      update_course_interactive()
      next
    }
    
    cat(al("invalid"))
  }
  
  required_pkgs <- c("swirl")
  missing_pkgs <- required_pkgs[!sapply(required_pkgs, requireNamespace, quietly = TRUE)]
  if (length(missing_pkgs) > 0) {
    cat(al("packages_missing"), paste(missing_pkgs, collapse = ", "), "\n")
    cat(al("packages_action"))
    choice_pkgs <- readline(al("enter_choice"))
    if (choice_pkgs == "1") {
      cat(sprintf(al("packages_install_cmd"), paste(sprintf('"%s"', missing_pkgs), collapse = ", ")))
      repeat {
        next_cmd <- readline(al("packages_next"))
        if (tolower(gsub("[()]", "", next_cmd)) == "next") break
      }
      still_missing <- missing_pkgs[!sapply(missing_pkgs, requireNamespace, quietly = TRUE)]
      if (length(still_missing) > 0) stop("❌ Some packages are still not installed: ", paste(still_missing, collapse = ", "))
      else cat(al("packages_success"))
    } else cat(al("packages_skipped"))
  }
  
  if (requireNamespace("swirl", quietly = TRUE)) {
    suppressPackageStartupMessages(library(swirl))
    cat(al("swirl_loaded"))
  } else {
    cat(al("swirl_not_installed"))
    return(invisible(FALSE))
  }
  
  cat(al("translation_choose"))
  trans_choice <- readline(al("translation_enter"))
  if (trans_choice == "1") {
    cat(al("only_phrases"))
    tryCatch({
      source("ukrainian_phrases.R")
      ukrainian_phrases_activate()
      cat(al("only_phrases_ok"))
    }, error = function(e) cat(al("only_phrases_fail"), e$message, "\n"))
  } else if (trans_choice == "2") {
    cat(al("full_translation"))
    tryCatch({
      source("ukrainian_phrases.R")
      ukrainian_phrases_activate()
      if (file.exists("full_ukrainian_swirl.R")) {
        source("full_ukrainian_swirl.R")
        if (exists("full_ukrainian_swirl_activate")) {
          full_ukrainian_swirl_activate()
          cat(al("full_translation_ok"))
        }
      }
    }, error = function(e) cat(al("full_translation_fail"), e$message, "\n"))
  } else cat(al("keep_original"))
  
  if (demo) {
    cat(al("demo_title"))
    cat(al("demo_sep"), "\n")
    cat(al("demo_praise"))
    for(i in 1:3) cat("  ✓", praise_ua(), "\n")
    cat(al("demo_try_again"))
    for(i in 1:3) cat("  ↻", tryAgain_ua(), "\n")
    cat(al("demo_sep"), "\n\n")
  }
  if (test) {
    cat(al("test_title"))
    test_ukrainian_phrases()
  }
  
  cat(al("finish_ua"))
  cat(al("swirl_start"))
  cat(al("commands"))
  
  assign(".swirl_ua_session_started", TRUE, envir = .GlobalEnv)
  
  repeat {
    cat(al("swirl_run_prompt"))
    swirl_run_choice <- readline(al("enter_choice"))
    if (swirl_run_choice == "1") {
      swirl()
      tryCatch({
        rm(activate, envir = .GlobalEnv)
        cat("Функцію activate() видалено з глобального простору. Для повторної активації використай reset_activate() або quick_restart_activate().\n")
      }, error = function(e) {
        cat("Не вдалося видалити activate(): ", e$message, "\n")
      })
      break
    } else if (swirl_run_choice == "2") {
      cat(ifelse(lang_code=="en", "You can run swirl() later to start.", "Ви можете виконати swirl() пізніше для старту.\n"))
      tryCatch({
        rm(activate, envir = .GlobalEnv)
        cat("Функцію activate() видалено з глобального простору. Для повторної активації використай reset_activate() або quick_restart_activate().\n")
      }, error = function(e) {
        cat("Не вдалося видалити activate(): ", e$message, "\n")
      })
      break
    } else cat(al("invalid"))
  }
  invisible(TRUE)
}

# ==============================
# REstart activate() # admin only
# ==============================
restart_activate_ukrainian_full <- function(...) {
  if (exists(".swirl_ua_session_started", envir = .GlobalEnv)) {
    assign(".swirl_ua_session_started", FALSE, envir = .GlobalEnv)
  }
  cleanup_vars <- c("lang_code", "L", "lang_choice", "trans_choice", "main_choice", "swirl_run_choice",
                    "del_choice", "inst_choice", "course_choice", "next_action", 
                    "choice_pkgs", "swirl_courses_dir", "required_pkgs", "missing_pkgs",
                    "still_missing", "courses", "course_paths", "course_names",
                    "chosen_course", "course_path", "n_manual", "n_random", "n_return",
                    "rand_idx", "installed_courses", "local_course_dir")
  existing_vars <- intersect(cleanup_vars, ls(envir = .GlobalEnv))
  if (length(existing_vars) > 0) {
    rm(list = existing_vars, envir = .GlobalEnv)
  }
  sys.source("activate_ukrainian.R", envir = .GlobalEnv)
  activate(...)
}

reset_activation <- function() {
  assign(".swirl_ua_session_started", FALSE, envir = .GlobalEnv)
  deactivate_ukrainian_translation()
  sys.source("activate_ukrainian_test_demo.R", envir = .GlobalEnv)
  cat("Прапорець активації було скинуто. Українську локалізацію вимкнено. Функцію activate() відновлено, можна запускати activate() знову.\n")
}

quick_restart_activation <- function(...) {
  reset_activate()
  deactivate_ukrainian_translation()
  activate(...)
}

# ==============================
# Helper functions for course management
# ==============================

info_fun <- function() {
  cat("🇺🇦 UKRAINIAN SWIRL - ДОСТУПНІ ФУНКЦІЇ / AVAILABLE FUNCTIONS 🇺🇦\n")
  cat("================================================================\n\n")
  cat("📋 ОСНОВНІ ФУНКЦІЇ / MAIN FUNCTIONS:\nactivate() - активує переклад (тільки 1 раз  за сесію R)\nactivate(demo=TRUE)\nactivate(test=TRUE)\n\n")
  cat("🔧 ФУНКЦІЇ ПЕРЕКЛАДУ / TRANSLATION FUNCTIONS:\nactivate_ukrainian_phrases_only() - активує українські фрази ( хвалять і підбадьорюють) \nactivate_ukrainian_full_translation() - активує повний переклад інтерфейсу swirl()\ndeactivate_ukrainian_translation() - деактивує будь-який український переклад\ncheck_ukrainian_status()\n\n")
  cat("⚡ ШВИДКІ ФУНКЦІЇ / QUICK FUNCTIONS:\nquick_activate() - яктивує повний переклад \nquick_test()\n\n")
  cat("📦 КЕРУВАННЯ КУРСАМИ / COURSE MANAGEMENT:\ninstall_course_interactive() - інтерактивне встановлення курсу (локально) \ndelete_course_interactive() - інтерактивне видалення курсу\nupdate_course_interactive() - інтерактивне оновлення курсу (видалення  та локальне встановлення)\n\n")
  cat("ℹ️ ДОПОМІЖНІ ФУНКЦІЇ / HELPER FUNCTIONS:\ninfo_fun() -інформація про команди \nreset_activate() -  дозволяє активувати activate() ще раз\nquick_restart_activate() - перезапускає activate()\n\n")  
  cat("🚀 ЗАПУСК SWIRL / START SWIRL:\nswirl()\n\n")
}

install_course_interactive <- function(local_course_dir = "swirl-courses") {
  repeat {
    cat(al("available_courses"))
    if (dir.exists(local_course_dir)) {
      course_paths <- list.dirs(local_course_dir, full.names = TRUE, recursive = FALSE)
      course_names <- basename(course_paths)
      n_manual <- length(course_names) + 1
      n_random <- length(course_names) + 2
      n_return <- length(course_names) + 3
      if (length(course_names) > 0) {
        for (i in seq_along(course_names)) cat(sprintf("%d) %s\n", i, course_names[i]))
        cat(sprintf("%d) %s\n", n_manual, al("manual_course")))
        cat(sprintf("%d) %s\n", n_random, al("random_course")))
        cat(sprintf("%d) %s\n", n_return, al("continue")))
        course_choice <- suppressWarnings(as.integer(readline(al("enter_choice_simple")))
        )
        if (is.na(course_choice)) {
          cat(al("invalid")); next
        }
        if (course_choice == n_manual) {
          chosen_course <- readline(al("manual_course"))
          course_path <- file.path(local_course_dir, chosen_course)
        } else if (course_choice == n_random) {
          set.seed(as.integer(Sys.time()))
          rand_idx <- sample(seq_along(course_names), 1)
          course_path <- course_paths[rand_idx]
          chosen_course <- course_names[rand_idx]
          cat(sprintf("%s\n", chosen_course))
        } else if (course_choice >= 1 && course_choice <= length(course_names)) {
          course_path <- course_paths[course_choice]
          chosen_course <- course_names[course_choice]
        } else if (course_choice == n_return) break
        else { cat(al("invalid")); next }
      } else {
        chosen_course <- readline(al("not_found"))
        course_path <- file.path(local_course_dir, chosen_course)
      }
    } else {
      chosen_course <- readline(al("not_found_folder"))
      course_path <- file.path(local_course_dir, chosen_course)
    }
    if (!is.null(course_path) && course_choice != n_return && dir.exists(course_path)) {
      cat(al("installing"), course_path, "\n")
      tryCatch({
        swirl::install_course_directory(course_path)
        cat(sprintf(al("installed"), basename(course_path)))
      }, error = function(e) cat(sprintf(al("not_exist"), course_path), e$message, "\n"))
    } else if (!is.null(course_path) && course_choice != n_return) {
      cat(sprintf(al("not_exist"), course_path))
    }
    if (course_choice == n_return) break
    next_action <- readline(al("install_next"))
    if (next_action == "2") break
  }
  cat("✅ Завершено / Completed!\n")
}

delete_course_interactive <- function() {
  swirl_courses_dir <- get_swirl_courses_dir()
  if (!dir.exists(swirl_courses_dir)) {
    cat(al("no_courses"))
    return(invisible(NULL))
  }
  repeat {
    courses <- list.dirs(swirl_courses_dir, full.names = TRUE, recursive = FALSE)
    if (length(courses) == 0) { cat(al("no_courses")); break }
    cat(al("select_delete"))
    for (i in seq_along(courses)) cat(sprintf("%d) %s\n", i, basename(courses[i])))
    cat(sprintf("%d) %s\n", length(courses) + 1, al("continue")))
    course_choice <- suppressWarnings(as.integer(readline(al("enter_choice_simple")))
    )
    if (is.na(course_choice) || course_choice == (length(courses) + 1)) break
    if (course_choice >= 1 && course_choice <= length(courses)) {
      unlink(courses[course_choice], recursive = TRUE, force = TRUE)
      cat(al("deleted"), basename(courses[course_choice]), "\n")
    } else cat(al("invalid"))
  }
  cat("✅ Завершено / Completed!\n")
}


course_update_interactive_en <- function(local_course_dir = "swirl-courses") {
  swirl_courses_dir <- get_swirl_courses_dir()
  if (!dir.exists(swirl_courses_dir)) {
    cat("ℹ️ swirl installed courses folder not found.\n")
    return(invisible(NULL))
  }
  installed_courses <- list.dirs(swirl_courses_dir, full.names = TRUE, recursive = FALSE)
  course_names <- basename(installed_courses)
  if (length(course_names) == 0) {
    cat("ℹ️ No installed courses found.\n")
    return(invisible(NULL))
  }
  repeat {
    cat("Select a course to update (delete and reinstall):\n")
    for (i in seq_along(course_names)) cat(sprintf("%d) %s\n", i, course_names[i]))
    cat(sprintf("%d) Return\n", length(course_names) + 1))
    choice <- suppressWarnings(as.integer(readline("Enter course number: ")))
    if (is.na(choice) || choice == (length(course_names) + 1)) break
    if (choice >= 1 && choice <= length(course_names)) {
      course_name <- course_names[choice]
      course_path <- file.path(local_course_dir, course_name)
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
        }, error = function(e) cat(sprintf("❌ Course directory '%s' does not exist! %s\n", course_path, e$message)))
      } else {
        cat(sprintf("❌ Course directory '%s' not found for installation!\n", course_path))
      }
      next_action <- readline("What next?\n1) Update another course\n2) Exit\nEnter number (1/2): ")
      if (next_action == "2") break
    } else cat("⛔ Invalid choice. Try again.\n")
  }
  cat("✅ Completed!\n")
}


update_course_interactive <- function(local_course_dir = "swirl-courses") {
  lang_code <- if (exists("lang_code", envir = .GlobalEnv)) get("lang_code", envir = .GlobalEnv) else "uk"
  if (lang_code == "en") {
    course_update_interactive_en(local_course_dir)
  } else {
    swirl_courses_dir <- get_swirl_courses_dir()
    if (!dir.exists(swirl_courses_dir)) {
      cat(al("no_courses"))
      return(invisible(NULL))
    }
    installed_courses <- list.dirs(swirl_courses_dir, full.names = TRUE, recursive = FALSE)
    course_names <- basename(installed_courses)
    if (length(course_names) == 0) { cat(al("no_courses")); return(invisible(NULL)) }
    repeat {
      cat("Оберіть курс для оновлення (видалити і встановити заново):\n")
      for (i in seq_along(course_names)) cat(sprintf("%d) %s\n", i, course_names[i]))
      cat(sprintf("%d) %s\n", length(course_names) + 1, al("continue")))
      choice <- suppressWarnings(as.integer(readline(al("enter_choice_simple")))
      )
      if (is.na(choice) || choice == (length(course_names) + 1)) break
      if (choice >= 1 && choice <= length(course_names)) {
        course_name <- course_names[choice]
        course_path <- file.path(local_course_dir, course_name)
        installed_path <- file.path(swirl_courses_dir, course_name)
        if (dir.exists(installed_path)) {
          unlink(installed_path, recursive = TRUE, force = TRUE)
          cat(sprintf("🗑️ Курс '%s' видалено.\n", course_name))
        } else {
          cat(sprintf("ℹ️ Курс '%s' не був встановлений.\n", course_name))
        }
        if (dir.exists(course_path)) {
          cat(sprintf("ℹ️ Встановлюю курс із директорії: %s\n", course_path))
          tryCatch({
            swirl::install_course_directory(course_path)
            cat(sprintf("✓ Курс '%s' успішно встановлено і завантажено!\n", course_name))
          }, error = function(e) cat(sprintf("❌ Директорія курсу '%s' не існує! %s\n", course_path, e$message)))
        } else {
          cat(sprintf("❌ Директорія курсу '%s' не знайдена для встановлення!\n", course_path))
        }
        next_action <- readline("Що далі? \n1) Оновити ще курс \n2) Вийти \nВведіть номер  (1/2): ")
        if (next_action == "2") break
      } else cat(al("invalid"))
    }
    cat("✅ Завершено / Completed!\n")
  }
}

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
  assign(".swirl_ua_session_started", FALSE, envir = .GlobalEnv)
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
  }, error = function(e) cat("❌ Помилка перевірки статусу: ", e$message, "\n"))
}

quick_activate <- function() {
  if (!requireNamespace("swirl", quietly = TRUE)) {
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
    cat("❌ Українські фрази не завантажені. Виконай activate()\n")
  }
}