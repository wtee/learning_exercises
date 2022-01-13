<?php

declare(strict_types=1);

function reverseString(string $text): string {
    $reversed = "";
    for ($i = strlen($text) - 1; $i > -1; $i--) {
        $reversed .= $text[$i];
    }
    return $reversed;
}
