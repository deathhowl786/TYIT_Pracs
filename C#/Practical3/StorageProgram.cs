namespace Practical2
{
    class Student
    {
        public int uid;
        public string name;
        public int age;
        public string course;
        public int marks;

        public Student(int uid, string name, int age, string course, int marks)
        {
            this.uid = uid;
            this.name = name;
            this.age = age;
            this.course = course;
            this.marks = marks;
        }


    }

    internal class StorageProgram
    {
        static void Main(string[] args)
        {
            int n = 2;
            int search = 1;
            Student[] students = new Student[n];

            for (int i = 0; i < n; i++) {
                Console.WriteLine((i+1)+" Enter Details of Student: ");
                students[i] = takeInput();
                Console.WriteLine();
            }
            Console.Write("Enter UID to Search = ");
            search = int.Parse(Console.ReadLine());
            Console.WriteLine();

            for (int i = 0; i < students.Length; i++) {
                if (search == students[i].uid) {
                    Console.WriteLine(string.Format("Hi My Name is {0}, My UID is {1}, I am {2} years old, I study {3} in SXC and I scored {4} in it.", students[i].name, students[i].uid, students[i].age, students[i].course, students[i].marks));
                }
            }



           





        }

        static public Student takeInput()
        {
            Console.Write("Enter UID : ");
            int uid = int.Parse(Console.ReadLine());

            Console.Write("Enter Name : ");
            string name = Console.ReadLine(); 

            Console.Write("Enter Age : ");
            int age = int.Parse(Console.ReadLine());

            Console.Write("Enter Course : ");
            string course = Console.ReadLine();

            Console.Write("Enter Marks : ");
            int marks = int.Parse(Console.ReadLine());

            return new Student(uid, name, age, course, marks);

        }
    }
}
