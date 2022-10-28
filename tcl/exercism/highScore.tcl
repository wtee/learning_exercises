oo::class create HighScores {
    variable scoreList

    method addScores {args} {
        lappend scoreList {*}$args
    }

    method scores {} {
        return [lappend scoreList]
    }

    method latest {} {
        return [lindex [my scores] end]
    }
    
    method personalBest {} {
        return [lindex [my topThree] 0]
    }

    method topThree {} {
        set sortedScores [lsort -integer -decreasing [my scores]]
        return [lrange $sortedScores 0 2]
    }
}