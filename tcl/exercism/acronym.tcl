proc abbreviate {phrase} {
    foreach {word} [string map {_ " " - " "} $phrase] {
        lappend acronym [string toupper [string index $word 0]]
    }
    return [join $acronym ""]
}