class Exercise

  # Assume that "str" is a sequence of words separated by spaces.
  # Return a string in which every word in "str" that exceeds 4 characters is replaced with "marklar".
  # If the word being replaced has a capital first letter, it should instead be replaced with "Marklar".
  def self.marklar(str)
    # TODO: Implement this method
    # idea : modify argument to save space and require no additional space by using index pointers
    # idea : only modify str when its size has changed (to save on costly resizing)
    # future : could optimize code further by leaving end_marks in replace


    marklar_threshold = 5
    marklar_word = "marklar"
    marklar_capital_word = "Marklar"
    end_marks = ["?",",",".","!"]
    end_mark = ""
    index = 0
    index_start = 0
    index_difference = 0
    curr_word = ""


    while index < str.length
        if str[index] == " "
            # here we find the length of current word we want to check
            curr_word_length = index - index_start
            # check if the word ends in any of our pre-defined end_marks
            end_marks.each do |end_index|
                if str[index-1] == end_index
                    end_mark = end_index
                    curr_word_length = index - index_start - 1
                    break
                end
            end
            # if the word - end mark is longer than our threshold we will modify the str string
            if curr_word_length >= marklar_threshold
                index_difference = marklar_word.length - curr_word_length
                if index_difference != 0
                    # here we have expensive array resizing of main str to fit our new str
                    if index_difference > 0
                        str = str[0..index-1] + (" "*index_difference) + str[index..-1]
                    else
                        str = str[0..index_start] + str[(index+ index_difference -1)..-1]
                    end
                end
                index = index + index_difference
                # case word starts with capital
                if str[index_start].match(/[A-Z]/) != nil
                    str[index_start...index] = marklar_capital_word + end_mark
                # case word does not start with capital
                else
                    str[index_start...index] = marklar_word + end_mark
                end
                index_difference = 0
                end_mark = ""
            end
            index_start = index+1
        end
        index += 1
    end
    # here is where the program gets ugly but for the sake of having the operation use n+1 rather than 2n computations we will manually perform the last case
    index -= 1
    curr_word_length = index - index_start + 1
    # check if the word ends in any of our pre-defined end_marks
    end_marks.each do |end_index|
        if str[index] == end_index
            end_mark = end_index
            curr_word_length = index - index_start
            break
        end
    end
    # if the word - end mark is longer than our threshold we will modify the str string
    if curr_word_length >= marklar_threshold
        index_difference = marklar_word.length - curr_word_length
        if index_difference != 0
            # here we have expensive array resizing of main str to fit our new str
            if index_difference > 0
                str = str[0..index-1]+ str[index..-1]+ (" "*index_difference)
            else
                str = str[0..index_start] + str[(index+ index_difference)..-1]
            end
        end
        index = index + index_difference
        # case word starts with capital
        if str[index_start].match(/[A-Z]/) != nil
            str[index_start...index+1] = marklar_capital_word+end_mark
        # case word does not start with capital
        else
            str[index_start...index+1] = marklar_word+end_mark
        end
    end
    return str
  end

  # Return the sum of all even numbers in the Fibonacci sequence, up to
  # the "nth" term in the sequence
  # eg. the Fibonacci sequence up to 6 terms is (1, 1, 2, 3, 5, 8),
  # and the sum of its even numbers is (2 + 8) = 10
  def self.even_fibonacci(nth)
    # TODO: Implement this method
    # idea: keep space to 3 variables reducing cost of space to O(1), keep fibonacci linear O(n)
    # future: use ALU logic to bypass integer max & min by adding strings
    nth_position = 0
    nthplusone_position = 1
    sum = 0
    placeholder = 0
    if nth < 2
        return sum
    else
        for i in 1..nth
            placeholder = nthplusone_position
            nthplusone_position = nth_position + nthplusone_position
            nth_position = placeholder
            if nth_position % 2 == 0
               sum += nth_position
            end
        end
        return sum
    end
  end
end
