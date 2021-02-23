class Bootcamp
  
    def initialize(name, slogan, student_capacity)
        @name = name
        @slogan = slogan
        @student_capacity = student_capacity
        @teachers = []
        @students = []
        @grades = Hash.new { |h, k| h[k] = [] }
    end

    def name
        @name 
    end

    def slogan
       @slogan 
    end

    def teachers
        @teachers
    end

    def students
        @students
    end

    def hire(teacher)
        teachers.push(teacher)
    end

    def enroll(student)
        if @students.length < @student_capacity
            @students.push(student)
            return true
        end

        false
    end

    def enrolled?(student)
        @students.include?(student)
    end

    def student_to_teacher_ratio
        @students.length / @teachers.length
    end

    def add_grade(student, grade)
        if enrolled?(student)
            @grades[student].push(grade)
            return true
        else
            return false
        end
    end

    def num_grades(student)
        @grades[student].length
    end

    def average_grade(student)
        if enrolled?(student) && num_grades(student) >= 1
            grades = @grades[student]
            sum = 0
            grades.each{ | grade |
                sum += grade
            }
            return sum / grades.length 
        end
        
        nil
    end
end
