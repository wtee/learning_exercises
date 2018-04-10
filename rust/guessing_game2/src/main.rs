// A simple number guessing game based closely on the tutorial in the
// Rust Book https://doc.rust-lang.org/stable/book/guessing-game.html

extern crate rand;

use std::io;
use std::io::Write;
use std::cmp::Ordering;
use rand::Rng;

fn main() {
    let answer = rand::thread_rng().gen_range(1,101);

    print!("Guess a number between 1 and 100: ");
    io::stdout().flush().unwrap();

    loop {

        let mut guess = String::new();

        io::stdin().read_line(&mut guess)
            .expect("Failed to read your input.");

        let guess: u32 = match guess.trim().parse() {
            Ok(num) => num,
            Err(_)  => continue,
        };

        match guess.cmp(&answer) {
            Ordering::Less    => print!("Guess a larger number: "),
            Ordering::Greater => print!("Guess a smaller number: "),
            Ordering::Equal   => {
                println!("You got it!");
                break;
            },
        }

        io::stdout().flush().unwrap();
    }
}
