<?php

declare(strict_types=1);

class Tournament {
    public function tally($scores) {
        $score_board = array("Team                           | MP |  W |  D |  L |  P");
        $line_length = strlen($score_board[0]);
        $lines = explode("\n", $scores);
        $tally = array();

        foreach ($lines as $line) {
            if (!empty($line)) {
                list($team1, $team2, $outcome) = explode(";", $line);

                switch ($outcome) {
                    case "win":
                        $home = array(1, 1, 0, 0, 3);
                        $away = array(1, 0, 0, 1, 0);
                        break;
                    case "loss":
                        $home = array(1, 0, 0, 1, 0);
                        $away = array(1, 1, 0, 0, 3);
                        break;
                    case "draw":
                        $home = array(1, 0, 1, 0, 1);
                        $away = $home;
                        break;
                }

                if (array_key_exists($team1, $tally)) {
                    for ($i = 0; $i < 5; $i++) {
                        $tally[$team1][$i] += $home[$i];
                    }
                } else {
                    $tally[$team1] = $home;
                }

                if (array_key_exists($team2, $tally)) {
                    for ($i = 0; $i < 5; $i++) {
                        $tally[$team2][$i] += $away[$i];
                    }
                } else {
                    $tally[$team2] = $away;
                }
            }
        }

        if (count($tally) > 0) {
            ksort($tally);
            arsort($tally);
            foreach ($tally as $key => $v) {
                $tally_row = "|  {$v[0]} |  {$v[1]} |  {$v[2]} |  {$v[3]} |  {$v[4]}";
                $padding = str_repeat(" ", $line_length - (strlen($key) + strlen($tally_row)));
                array_push($score_board, $key . $padding . $tally_row);
            }            
        }
        return implode("\n", $score_board);
    }
}