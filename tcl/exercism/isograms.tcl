proc isIsogram {input} {
    set linput [split [string tolower $input] {}]
    set repeatables [lsearch -all -inline -regexp $linput {[[:space:][:punct:]]}]
    set uniques [lsort -unique [lsearch -all -inline -regexp $linput {[[:alpha:]]}]]
    if {[llength $repeatables] + [llength $uniques] < [string length $input]} {
        return 0
    }
    return 1
}

