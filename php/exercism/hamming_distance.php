<?php

declare(strict_types=1);

function distance(string $strandA, string $strandB): int {
    $distance = 0;
    if (strlen($strandA) != strlen($strandB)) {
        throw new InvalidArgumentException("DNA strands must be of equal length.");
    } else {
        for ($i = 0; $i < strlen($strandA); $i++) {
            if ($strandA[$i] != $strandB[$i]) {
                $distance++;
            }
        }
    }
    return $distance;
}
