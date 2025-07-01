using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Practical2
{
    public class Employee
    {
        public int eno;
        public string name;
        public string dept;
        public int salary;

        public Employee(int eno, string name, string dept, int salary) {
            this.eno = eno;
            this.name = name;
            this.dept = dept;
            this.salary = salary;
        }
    }
    internal class EmployeeStorage
    {

        public static void Main(string[] args)
        {
            int n = 2;
            int search = 0;
            Employee[] employees = new Employee[n];

            for (int i = 0; i < n; i++)
            {
                Console.WriteLine((i + 1) + " Enter Details of Employee: ");
                employees[i] = takeInput();
                Console.WriteLine();

                if(employees[i].salary > search) search = employees[i].salary;
            }

            for (int i = 0; i < employees.Length; i++)
            {
                if (search == employees[i].salary)
                {
                    Console.WriteLine(string.Format("Hi My Name is {0}, My Eno is {1},I work in {2} with highest salary of {3}.", employees[i].name, employees[i].eno, employees[i].dept, employees[i].salary));
                }
            }

        }

        static public Employee takeInput()
        {
            Console.Write("Enter Empoyee No. : ");
            int eno = int.Parse(Console.ReadLine());

            Console.Write("Enter Name : ");
            string name = Console.ReadLine();

            Console.Write("Enter Department : ");
            string dept = Console.ReadLine();

            Console.Write("Enter Salary : ");
            int salary = int.Parse(Console.ReadLine());

            return new Employee(eno, name, dept, salary);

        }


    }
}
