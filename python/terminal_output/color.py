from colorama import init, Fore

init()

# add + green, del - red, alt ~ yellow
# format = lorem 1[+green] ipsum 3[-red] carpe 1[~altered]

print(f'Making color a thing because, you see, this should be {Fore.GREEN}green{Fore.RESET}.')

fake_diff_string = f"""
---- document1.txt --------------------------------------------------------------
This is a mock up of {Fore.YELLOW}2[~what]{Fore.RESET} a color diff file
could look like comparing {Fore.RED}3[-three]{Fore.RESET} documents and 
outputting the result {Fore.GREEN}2[+to the]{Fore.RESET} terminal with a mix
of color and symbol to convey mean{Fore.YELLOW}2[~ing]{Fore.RESET}.
---------------------------------------------------------------------------------
"""

key = f"""

               * KEY *
-----------------------------------------------------
 # : Indicated which document contains the variance.
{Fore.RED} - : Indicates a deletion.{Fore.RESET} 
{Fore.GREEN} + : Indicates an addition.{Fore.RESET} 
{Fore.YELLOW} ~ : Indicates an alteration.{Fore.RESET} 
-----------------------------------------------------
"""
print(fake_diff_string)
print(key)