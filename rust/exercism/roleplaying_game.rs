pub struct Player {
    pub health: u32,
    pub mana: Option<u32>,
    pub level: u32,
}

impl Player {
    pub fn revive(&self) -> Option<Player> {
        match &self.health {
            0 => Some(Player {
                health: 100,
                mana: if self.level > 9 { Some(100) } else { None },
                level: self.level,
            }),
            _ => None,
        }
    }

    pub fn cast_spell(&mut self, mana_cost: u32) -> u32 {
        match &self.mana {
            Some(mana) => {
                if mana_cost <= *mana {
                    self.mana = Some(*mana - mana_cost);
                    return mana_cost * 2;
                }
                0
            }
            None => {
                self.health = if mana_cost <= self.health {
                    self.health - mana_cost
                } else {
                    0
                };
                0
            }
        }
    }
}
