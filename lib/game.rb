class Game
  attr_reader :status, :bad_letters, :good_letters, :errors, :letters

  def initialize(slovo)
    @letters = get_letters(slovo)
    @good_letters = []
    @bad_letters = []
    @errors = 0
    @status = 0
  end

  def get_letters(slovo)
    if slovo == nil || slovo == ""
      abort "Enter argument"
    else
      slovo.split("")
    end
  end

  def ask_next_letter
    puts "\nEnter a letter"
    letter = ""
    while letter == ""
      letter = STDIN.gets.encode("UTF-8").chomp
    end
    check_input(UnicodeUtils.upcase(letter))
  end

  def check_input(letter)
    if @status == 1 || @status == 1
      return
    end

    if bad_letters.include?(letter) || good_letters.include?(letter)
      return
    end

    if letters.include?(letter) ||
      letter == "е" && letters.include?("ё") ||
      letter == "ё" && letters.include?("е") ||
      letter == "и" && letters.include?("й") ||
      letter == "й" && letters.include?("и")
      good_letters << letter
      if letter == "е"
        good_letters << "ё"
      elsif letter == "ё"
        good_letters << "е"
      elsif letter == "и"
        good_letters << "й"
      elsif letter == "й"
        good_letters << "и"
      end

      if (letters - good_letters).empty?
        @status = 1
      end

    else
      bad_letters << letter
      @errors += 1
    end

    if @errors >= 7
      @status = -1
    end
  end
end