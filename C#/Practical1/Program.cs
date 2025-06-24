// See https://aka.ms/new-console-template for more information

namespace FirstProject
{
    internal class Program
    {
        static void Main(string[] args)
        {
            /*            Console.WriteLine("Hello, World!");
                        Console.Write("Enter Your Name : ");
                        string s = Console.ReadLine();
                        Console.WriteLine("Hello, " + s);
                        Console.Write("Please Enter Your Age : ");
                        int age = Convert.ToInt32(Console.ReadLine());
                        Console.WriteLine("Your Age is " + age);*/
            Console.Write("Enter Table Number : ");
            int t = Convert.ToInt32(Console.ReadLine());
            Console.Write("Enter Start Number : ");
            int s = Convert.ToInt32(Console.ReadLine());
            Console.Write("Enter End Number : ");
            int e = Convert.ToInt32(Console.ReadLine());
            multiplicationTable(t, s, e);

        }

        static void multiplicationTable(int tableOf, int startNumber, int endNumber) {
            Console.WriteLine("Table of {0} from {1} to {2}", tableOf, startNumber, endNumber);
            for (int i = startNumber; i <= endNumber; i++)
            {
                Console.WriteLine("{0} x {1} = {2}", tableOf, i, tableOf*i);
            }
        }
    }
}