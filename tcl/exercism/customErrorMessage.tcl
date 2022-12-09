proc custom_error_message {message} {
    error $message
}

proc handle_error {script} {
    try {
        eval $script
    } trap {ARITH DIVZERO} {} {
        return "division by zero"
    } trap {POSIX ENOENT} {} {
        return "file does not exist"
    } trap {TCL LOOKUP COMMAND} {} {
        return "proc does not exist"
    }
    return success
}
