pub fn reply(message: &str) -> &str {
	let trimmed = message.trim();
    if trimmed.is_empty() {
        "Fine. Be that way!"
    } else {
        match (is_shouted(trimmed), is_question(trimmed)) {
            (true, true) => "Calm down, I know what I'm doing!",
            (true, false) => "Whoa, chill out!",
            (false, true) => "Sure.",
            _ => "Whatever.",
        }
    }
}

fn is_shouted(message: &str) -> bool {
    message == message.to_uppercase()
        && !message
            .chars()
            .filter(|c| c.is_alphabetic())
            .collect::<String>()
            .is_empty()
}

fn is_question(message: &str) -> bool {
    //message.chars().last().unwrap().to_string() == "?"
	message.ends_with("?")
}
