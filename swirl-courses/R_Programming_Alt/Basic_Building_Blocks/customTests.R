notify <- function() {
  e <- get("e", parent.frame())
  if(e$val == "No") return(TRUE)
  
  good <- FALSE
  while(!good) {
    # Get info
    name <- readline_clean("Як тебе звати повністю? ")
    address <- readline_clean("Яка електронна адреса особи, яку ти хочеш повідомити? ")
    
    # Repeat back to them
    message("\nВсе виглядає правильно?\n")
    message("Твоє ім'я: ", name, "\n", "Надіслати на: ", address)
    
    yn <- select.list(c("Так", "Ні"), graphics = FALSE)
    if(yn == "Так") good <- TRUE
  }
  
  # Get course and lesson names
  course_name <- attr(e$les, "course_name")
  lesson_name <- attr(e$les, "lesson_name")
  
  subject <- paste(name, "щойно завершила", course_name, "-", lesson_name)
  body = ""
  
  # Send email
  swirl:::email(address, subject, body)
  
  hrule()
  message("Я щойно спробувала створити новий електронний лист з наступною інформацією:\n")
  message("До: ", address)
  message("Тема: ", subject)
  message("Зміст: <порожньо>")
  
  message("\nЯкщо це не спрацювало, ти можеш надіслати той самий лист вручну.")
  hrule()
  
  # Return TRUE to satisfy swirl and return to course menu
  TRUE
}

readline_clean <- function(prompt = "") {
  wrapped <- strwrap(prompt, width = getOption("width") - 2)
  mes <- stringr::str_c("| ", wrapped, collapse = "\n")
  message(mes)
  readline()
}

hrule <- function() {
  message("\n", paste0(rep("#", getOption("width") - 2), collapse = ""), "\n")
}
