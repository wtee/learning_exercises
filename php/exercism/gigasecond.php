<?php

declare(strict_types=1);

function from(DateTimeImmutable $date): DateTimeImmutable {
    $gigasecond = 10 ** 9;
    return $date->add(new DateInterval("PT{$gigasecond}S"));
}