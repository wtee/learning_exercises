pub fn production_rate_per_hour(speed: u8) -> f64 {
    221.0 * speed as f64 * match speed {
        0..=4 => 1.0,
        5..=8 => 0.9,
        9|10 => 0.77,
        _ => panic!("Invalid production speed!")
    }
}

pub fn working_items_per_minute(speed: u8) -> u32 {
    match speed {
        0 => 0,
        1.. => production_rate_per_hour(speed) as u32 / 60
    }
}
