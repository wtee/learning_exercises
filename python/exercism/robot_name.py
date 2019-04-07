import random
import string
class Robot():
    used_names = []
    
    def __init__(self):
        self.name = self._set_name()

    def _set_name(self):
        name_list = random.choices(string.ascii_uppercase, k=2)
        name_list.extend(random.choices(string.digits, k=3))
        name = "".join(name_list)
        if name not in Robot.used_names:
            Robot.used_names.append(name)
            return name
        else:
            return self._set_name()

    def reset(self):
        self.name = self._set_name()
