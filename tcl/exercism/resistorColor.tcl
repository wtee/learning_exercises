namespace eval resistorColor {
    proc colorCode {codeMe} {
        set i [lsearch -exact [colors] $codeMe]
            if { $i == -1 } {
                error "Invalid color: $codeMe"
            }
        return $i
    }

    proc colors {args} {
        return {black brown red orange yellow green blue violet grey white}
    }
}