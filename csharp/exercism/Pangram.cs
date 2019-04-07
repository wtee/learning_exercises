using System;
using System.Collections.Generic;
using System.Text.RegularExpressions;

public static class Pangram
{
    public static bool IsPangram(string input)
    {
        HashSet<char> uniqueLetters = new HashSet<char>();

        foreach (char c in input.ToLower())
        {
            if (Pangram.IsAlpha(c))
            {
                uniqueLetters.Add(c);
            }
        }
        
        if (uniqueLetters.Count == 26)
        {
            return true;
        }

        return false;
    }

    public static bool IsAlpha(char input)
    {
        Regex rx = new Regex("[A-Za-z]");
        
        if (rx.IsMatch(input.ToString()))
        {
            return true;
        }

        return false;
    }
}

