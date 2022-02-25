use std::fmt;

#[derive(Debug, PartialEq)]
pub struct Clock {
    minutes: i32
}

impl Clock {
    pub fn new(hours: i32, minutes: i32) -> Self {
        Clock {
            minutes: (hours * 60 + minutes).rem_euclid(1440)
        }
    }

    pub fn add_minutes(&self, minutes: i32) -> Self {
        Clock::new(0, self.minutes + minutes)
    }

    pub fn to_24_hour_clock(&self, minutes: i32) -> (i32, i32) {
        (minutes.div_euclid(60).rem_euclid(24), minutes.rem_euclid(60))
    }
}

impl fmt::Display for Clock {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        let time = self.to_24_hour_clock(self.minutes);
        write!(f, "{:02}:{:02}", time.0, time.1)
    }
}