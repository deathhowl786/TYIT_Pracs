from pyDatalog import pyDatalog
# Clear previous knowledge
pyDatalog.clear()

pyDatalog.create_terms('Book, Member, Librarian, Borrowed, IssuedBy, Overdue, Reserved, ActiveBorrower, OverLoaded, Available, Flagged')
pyDatalog.create_terms('X, Y, Z, BorrowedCount, IssuedCount, S')

# Facts

+Book('genesis')
+Book('exodus')
+Book('leviticus')
+Book('numbers')
+Book('deuteronomy')

+Member('alice')
+Member('bob')
+Member('carol')

+Librarian('melvil')
+Librarian('ada')

+Borrowed('alice', 'genesis')
+Borrowed('bob', 'exodus')
+Borrowed('carol', 'leviticus')
+Borrowed('alice', 'numbers')

+IssuedBy('genesis', 'melvil')
+IssuedBy('exodus', 'melvil')
+IssuedBy('leviticus', 'melvil')
+IssuedBy('numbers', 'melvil')

+Reserved('bob', 'genesis')
+Reserved('carol', 'exodus')
+Reserved('alice', 'leviticus')
+Reserved('alice', 'numbers')

+Overdue('genesis')

#Rules
# A member is an ActiveBorrower if they have borrowed more than 1 book.
(BorrowedCount[X] == len_(Y)) <= Borrowed(X, Y)
ActiveBorrower(X) <= (BorrowedCount[X] > 1)


# A librarian is Overloaded if they issued more than 3 books.
(IssuedCount[X] == len_(Y)) <= IssuedBy(Y,X)
OverLoaded(X) <= (IssuedCount[X] > 3)

# A book is Available if it is not borrowed and not reserved.
Available(X) <= Book(X) & ~Borrowed(Y,X) & ~Reserved(Y,X)


# A book is Flagged if it's borrowed and overdue.
Flagged(X) <= Overdue(X) & Borrowed(Y,X)
print("\nActive Borrowers (borrowed > 1 book):")
print(ActiveBorrower(X))

print("\nOverloaded Librarians (issued > 3 books):")
print(OverLoaded(X))

print("\nAvailable books (not borrowed or reserved):")
print(Available(X))

print("\nFlagged books (borrowed and overdue):")
print(Flagged(X))

