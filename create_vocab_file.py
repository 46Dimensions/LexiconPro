#!/usr/bin/env python3
import json
import os

dir = os.path.abspath(os.path.dirname(__file__))
JSON_DIR = os.path.join(dir, "JSON")
os.makedirs(JSON_DIR, exist_ok=True)

def load_json(filename) -> dict:
    """
    Return the contents of the JSON file `filename` as a dictionary
    """
    if os.path.exists(filename):
        with open(filename, 'r', encoding='utf-8') as f:
            try:
                return dict(json.load(f))
            except json.JSONDecodeError:
                return {}
    return {}

def save_json(filename: str, data: dict) -> None:
    """Write the dictionary `data` to the JSON file `filename`"""
    with open(filename, 'w', encoding='utf-8') as f:
        json.dump(data, f, indent=4, ensure_ascii=False)

def check_input(message) -> str:
    answer = input(message).strip()
    while answer == "":
        print("Please enter something.")
        answer = input(message)

    return answer

def main() -> None:
    """
    The main function which asks the user about the vocabulary file they are trying to create. \n
    Gets data such as the languages of the vocab, the number of words and the words and meanings themselves.
    """

    # The empty `data` dict
    data = {
        "languages": {},
        "words": {}
    }

    # Get the languages of the vocabulary
    learning = check_input("What language are you learning? ")
    spoken = check_input("What language do you speak? ")
    # Save the language data in `data["languages"]`
    data["languages"] = {
        "learning": learning,
        "spoken": spoken
    }

    def ask_num_words() -> str | bool:
        """ Get the number of words in the vocabulary file """
        valid = True
        
        def check():
            """ Check that the input is a number above 0 """
            # Set the `valid` variables
            nonlocal valid
            valid = True
            # Get the number of words from the user
            user_input = check_input("How many words are in the vocab list? ")

            # If it is not a digit, set `valid` to False
            if not user_input.isdigit():
                valid = False

            # If it is a digit, check if it is positive
            if valid == True:
                if int(user_input) <= 0:
                    valid = False

            return user_input # Return the number of words

        num_words = check()

        # If `num_words` is not valid, ask again
        while valid == False:
            print("Please enter a positive integer.")
            num_words = check()

        return num_words # Return the valid number of words
        
    num_words = ask_num_words()
    words = []

    # Get the first word and its meaning then add it to `words`
    lang1_word = check_input(f"What is the first {learning} word in the vocab list? ")
    translated = check_input(f"What is {lang1_word} in {spoken}? ")
    words.append([lang1_word, translated])

    # Get the other word/meaning pairs
    for i in range(int(num_words) - 1):
        lang1_word = check_input(f"What is the next {learning} word in the vocab list? ")
        translated = check_input(f"What is {lang1_word} in {spoken}? ")
        words.append([lang1_word, translated])

    # Append the items in `words` to `data`
    for i in range(len(words)):
        item1 = words[i][0] # The word in the foreign language
        item2 = words[i][1] # The word in the other language
        data["words"][item1] = item2 # `item1: item2`

    filename = check_input("What would you like the vocab file to be called? ") # The name the user desires for the JSON file

    has_file_extension = False

    # Check if it ends in `.json`
    if len(filename) >= 5:
        last_5_letters = ""
        for i in range(5):
            j = 5 - i
            letter = filename[len(filename) - j]
            last_5_letters = last_5_letters + letter

        if last_5_letters == ".json":
            has_file_extension = True
        else:
            has_file_extension = False
    else:
        has_file_extension = False

    # Set the absolute path of the file
    if has_file_extension == True:
        abs_path = os.path.join(JSON_DIR, filename)
    else:
        abs_path = os.path.join(JSON_DIR, f"{filename}.json")

    # Save the data into the JSON file
    save_json(abs_path, data)
    print(f"Saved as {abs_path}")

# Run the main loop
if __name__ == "__main__":
    main()