using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MatrixDemo
{   
    class A1
    {
        public virtual void display()
        {
            Console.WriteLine("In A1 Display");
        }
    }
    
    class B1 : A1{
        public new void display()
        {
            Console.WriteLine("In B1 Display");
        }
    }

    internal class Demo
    {
        static void Main(string[] args)
        {
            A1 a1 = new B1();
            a1.display();
        }
    }
}
