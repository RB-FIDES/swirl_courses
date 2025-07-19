# Put custom tests in this file.

# Uncommenting the following line of code will disable
# auto-detection of new variables and thus prevent swirl from
# repeating execution of printing and plotting commands.

# AUTO_DETECT_NEWVAR <- FALSE

match_call <- function(correct_call = NULL) {
  e <- get("e", parent.frame())
  # Trivial case
  if(is.null(correct_call)) return(TRUE)
  # Get full correct call
  full_correct_call <- expand_call(correct_call)  
  # Expand user's expression
  expr <- deparse(e$expr)
  full_user_expr <- expand_call(expr)
  # Compare function calls with full arg names
  identical(full_correct_call, full_user_expr)
}

# Utility function for match_call answer test
# Fills out a function call with full argument names
expand_call <- function(call_string) {
  # Quote expression
  qcall <- parse(text=call_string)[[1]]
  # If expression is not greater than length 1...
  if(length(qcall) <= 1) return(qcall)
  # See if it's an assignment
  is_assign <- is(qcall, "<-")
  # If assignment, process righthandside
  if(is_assign) {
    # Get righthand side
    rhs <- qcall[[3]]
    # Get function from function name
    fun <- match.fun(rhs[[1]])
    # match.call() does not support primitive functions
    if(is.primitive(fun)) return(qcall)
    # Get expanded call
    full_rhs <- match.call(fun, rhs)
    # Full call
    qcall[[3]] <- full_rhs
  } else { # If not assignment, process whole thing
    # Get function from function name
    fun <- match.fun(qcall[[1]])
    # match.call() does not support primitive functions
    if(is.primitive(fun)) return(qcall)
    # Full call
    qcall <- match.call(fun, qcall)
  } 
  # Return expanded function call
  qcall
}

notify <- function() {
  e <- get("e", parent.frame())
  if(e$val == "No") return(TRUE)
  
  good <- FALSE
  while(!good) {
    # Get info
    name <- readline_clean("Як тебе звати повністю? ")
    address <- readline_clean("Яка email адреса особи, яку ти хочеш повідомити? ")
    
    # Repeat back to them
    message("\nВсе виглядає правильно?\n")
    message("Твоє ім'я: ", name, "\n", "Надіслати до: ", address)
    
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
  message("Я щойно спробувала створити новий email з наступною інформацією:\n")
  message("До: ", address)
  message("Тема: ", subject)
  message("Текст: <порожньо>")
  
  message("\nЯкщо це не спрацювало, ти можеш надіслати той самий email вручну.")
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
