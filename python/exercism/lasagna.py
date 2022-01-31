"""
Calculate times related to preparing and baking lasagna.

Functions:

    bake_time_remaining(elapsed_bake_time: int) -> int
        Calculate the bake time remaining.

    preparation_time_in_minutes(layers: int) -> int
        Calculate the preparation time.

    elapsed_time_in_minutes(layers: int, elapsed_bake_time: int) -> int
        Calculate the total time elapsed for preparation and baking.

Constants:

    EXPECTED_BAKE_TIME
        Expected time to bake lasagna.
    PREPARATION_TIME
        Time it takes to prepare one layer of lasagna.
"""
EXPECTED_BAKE_TIME = 40
PREPARATION_TIME = 2


def bake_time_remaining(elapsed_bake_time: int) -> int:
    """Calculate the bake time remaining.

    :param elapsed_bake_time: int baking time already elapsed.
    :return: int remaining bake time derived from 'EXPECTED_BAKE_TIME'.

    Function that takes the actual minutes the lasagna has been in the oven as
    an argument and returns how many minutes the lasagna still needs to bake
    based on the `EXPECTED_BAKE_TIME`.
    """
    return EXPECTED_BAKE_TIME - elapsed_bake_time

def preparation_time_in_minutes(layers: int) -> int:
    """Calculate the preparation time.

    :param layers: int number of layers used in the lasagna.
    :return: int time elapsed preparing lasagna for baking.

    Function that takes the number of layers in the lasagna as an
    argument and returns how many minutes it took to prepare the lasagna
    based on the `PREPARATION_TIME`.
    """
    return PREPARATION_TIME * layers


def elapsed_time_in_minutes(layers: int, elapsed_bake_time: int) -> int:
    """Calculate the total time elapsed for preparation and baking.

    :param layers: int number of layers used in the lasagna.
    :param elapsed_bake_time: int baking time already elapsed.
    :return: int elapsed derived from preparation_time_in_minutes and
    elapsed_bake_time.

    Function that takes the number of layers in the the lasagna  and the
    actual minutes the lasagna has been in the oven as arguments and returns
    how many minutes have elapsed in the preparation and baking of the lasagna.
    """
    return preparation_time_in_minutes(layers) + elapsed_bake_time
