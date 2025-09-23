#!/bin/bash

# 1. Number of words excluding numbers and punctuation
echo "1. Number of words (excluding numbers and punctuation):"
grep -o '[a-zA-Z]\+' words.txt | wc -l
echo

# 2. List all numbers in ascending order
echo "2. All numbers in ascending order:"
grep -o '[0-9]\+' words.txt | sort -n
echo

# 3. Top five most repeated words (case-sensitive)
echo "3. Top 5 most repeated words:"
grep -o '[a-zA-Z]\+' words.txt | sort | uniq -c | sort -nr | head -n 5
echo

# 4. All single-digit numbers without repetition
echo "4. Single-digit numbers (no repetition):"
grep -o '\b[0-9]\b' words.txt | sort -u
echo

# 5. Separate numbers and words into num.txt and words.txt (unique only)
echo "5. Saving unique numbers to nums_uniq.txt and unique words to words_uniq.txt..."
grep -o '[0-9]\+' words.txt | sort -u | sort -n > nums_uniq.txt
grep -o '[a-zA-Z]\+' words.txt | sort -u > words_uniq.txt
echo "The End"

