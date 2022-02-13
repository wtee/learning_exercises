proc raindrops {number} {
    if {$number % 3 == 0} {
        append result Pling
    }
    if {$number % 5 == 0} {
        append result Plang
    }
    if {$number % 7 == 0} {
        append result Plong
    }
    if {![info exists result]} {
        set result $number
    }
    return $result
}
