proc hammingDistance {left right} {
    if {[string length $left] != [string length $right]} {
        return -code 1 "strands must be of equal length"
    }
    set distance 0
    foreach a [split $left {}] b [split $right {}] {
        if {$a != $b} {
            incr distance
        }
    }
    return $distance
}
