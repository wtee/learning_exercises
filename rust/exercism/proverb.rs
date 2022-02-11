pub fn build_proverb(list: &[&str]) -> String {
	if list.len() == 0 {
		String::new()
	} else {
		let enough_now = list.len() -1;
		let le_sigh = format!("And all for the want of a {}.", list[0]);
		let mut lines = <Vec<String>>::new();
		for (i, w) in list.iter().enumerate() {
			if i < enough_now {
				lines.push(format!("For want of a {} the {} was lost.\n", w, list[i+1]));
			}
		}
		format!("{}{}", lines.join(""), le_sigh)
	}
}
