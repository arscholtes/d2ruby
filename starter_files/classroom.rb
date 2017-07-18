# Given a grade_hash, student name, and assignment number, return the score
# for that student and assignment. Note that Ruby counts arrays from 0, but
# we are referring to them as 1-10.
def assignment_score(grade_hash, student, assignment_num)
  score = grade_hash[student][assignment_num - 1]
end

# Given a grade_hash and assignment number, return all scores for that
# assignment. Note that Ruby counts arrays from 0, but we are referring to
# them as 1-10.
def assignment_scores(grade_hash, assignment_num)
  array_value = assignment_num - 1
  grade_arr = []
  grade_hash.each do |name, grades|
    grade_arr << grades [array_value]
  end
  grade_arr
end

# Given a grade_hash and assignment number, return the average score for that
# assignment. Note that Ruby counts arrays from 0, but we are referring to
# them as 1-10.
def assignment_average_score(grade_hash, assignment_num)
  array_value = assignment_num - 1
  grade_arr = []
  grade_hash.each do |key, value|
    grade_arr << value[array_value]
  end
  grade_arr.reduce{|sum, num| sum + num} / grade_arr.length
end

# Return a hash of students and their average score.
# TIP: To convert an array like [[:indiana, 90], [:nevada, 80]] to a hash,
# use .to_h. Also look at Hash#transform_values.
def averages(grade_hash)
  new_hash = {}
  grade_hash.each do |key, value|
    new_hash[key] = (value.reduce{|sum, num| sum + num} / value.length)
end
new_hash
end

# Return a letter grade for a numerical score.
# 90+ => A
# 80-89 => B
# 70-79 => C
# 60-69 => D
# < 60 => F
def letter_grade(score)
  if score >= 90
    letter = 'A'
  elsif score < 90 && score >= 80
    letter = 'B'
  elsif score < 80 && score >= 70
    letter = 'C'
  elsif score < 70 && score >= 60
    letter = 'D'
  else
    letter = 'F'
  end
  letter
end

# Return a hash of students and their final letter grade, as determined
# by their average.
def final_letter_grades(grade_hash)
  new_hash = {}
  grade_hash.each do |key, value|
    new_hash[key] = letter_grade((value.reduce{|sum, num| sum + num} / value.length))
  end
  new_hash
end

# Return the average for the entire class.
def class_average(grade_hash)
  average_arr = []
  averages(grade_hash).each do |key, value|
    average_arr << value
  end
  (average_arr.reduce{|num, sum| num + sum } / average_arr.length)
end

# Return an array of the top `number_of_students` students.
def top_students(grade_hash, number_of_students)
  sorted_hash = averages(grade_hash).sort_by {|name, grade|  grade}
  sorted_hash.reverse!
  top_array = []
  sorted_hash.each do |key, value|
    top_array << key
  end
  top_array.take(number_of_students)
end
