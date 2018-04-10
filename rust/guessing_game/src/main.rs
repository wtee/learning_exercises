// A naive implementation of a number guessing game, partially based on
// the example in the Rust Book tutorial:
// https://doc.rust-lang.org/stable/book/guessing-game.html

extern crate rand;

use std::io;
use std::io::Write;
use rand::Rng;

fn main() {
    let answer = rand::thread_rng().gen_range(1,101);

    print!("Guess a number between 1 and 100: ");
    io::stdout().flush().unwrap();

    loop {
        let mut guess = String::new();

        io::stdin().read_line(&mut guess)
            .expect("Failed to read your input.");

        let test_guess: i32 = guess.trim().parse().unwrap();

        if test_guess > answer {
            print!("Guess lower: ");
        } else if test_guess < answer {
            print!("Guess higher: ");
        } else {
            println!("You got it!");
            break;
        }
        io::stdout().flush().unwrap();
    }
}
