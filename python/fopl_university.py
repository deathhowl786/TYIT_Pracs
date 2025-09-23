from pyDatalog import pyDatalog
# Clear previous knowledge
pyDatalog.clear()
pyDatalog.create_terms('Student, Course, Professor, EnrolledIn, Teaches, HasPhD, Teacher,HonorsStudent, Overloaded, NotEnrolled')
pyDatalog.create_terms('X, Y, Z, Count, S')
+Student('alice')
+Student('bob')
+Student('carol')
+Student('dan')

+Course('AI')
+Course('DataScience')
+Course('Math')

+Professor('dr_smith')
+Professor('dr_lee')

+HasPhD('dr_smith')
+HasPhD('dr_lee')

+Teaches('dr_smith', 'AI')
+Teaches('dr_smith', 'Math')
+Teaches('dr_smith', 'DataScience')
+Teaches('dr_lee', 'Math')

+EnrolledIn('alice', 'AI')
+EnrolledIn('alice', 'Math')
+EnrolledIn('bob', 'AI')
+EnrolledIn('carol', 'DataScience')


# 1. Rule 1: Identify teachers -- A person is a teacher if they teach at least one course
# (Anyone who teaches any course is a teacher.)
Teacher(X) <= Teaches(X, Y)

# 2. Rule 2: Students NOT enrolled in any course -- Negation: Students not enrolled in any course
# (Use of ~ (negation): If a student is not enrolled in any course, return them. Returns 'dan' in this case.)
NotEnrolled(X) <= Student(X) & ~(EnrolledIn(X, Y))

# 3. Rule 3: Honors students -- Honors student rule: student enrolled in AI and Math is honors
# ( A student is honors if they are enrolled in both AI and Math. Only 'alice' matches.)
HonorsStudent(X) <= EnrolledIn(X, 'AI') & EnrolledIn(X, 'Math')

# 4. Rule 4: Count courses each professor teaches -- Count number of courses a professor teaches (complex rule)
# (Use len_() to count how many times a professor appears in the Teaches predicate.)
pyDatalog.create_terms('N')
(Count[X] == len_(Y)) <= Teaches(X, Y)

# 5. Rule 5: Overloaded professors -- A professor is overloaded if they teach more than 2 courses
# (A professor is overloaded if they teach more than 2 courses. Only 'dr_smith' teaches 3 → overloaded.)
Overloaded(X) <= (Count[X] > 2)


# --- OUTPUTS ---
print("\n Who is a teacher?")
print(Teacher(X))

print("\n Students not enrolled in any course:")
print(NotEnrolled(X)) # Expected: dan

print("\n Honors students (enrolled in both AI and Math):")
print(HonorsStudent(X)) # Expected: alice

print("\n Number of courses each professor teaches:")
print(Count[X] == N)

print("\n Overloaded professors (teaching &gt;2 courses):")
print(Overloaded(X)) # Expected: dr_smith
