using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MatrixDemo
{
    class A2
    {
        public virtual void display()
        {
            Console.WriteLine("In A2 Display");
        }
    }

    class B2 : A2
    {
        public new virtual void display()
        {
            Console.WriteLine("In B2 Display");
        }
    }

    class C2 : B2
    {
        public override void display()
        {
            Console.WriteLine("In B2 Display");
        }
    }



    internal class Demo1
    {
        public static void Main(string[] args)
        {
            A a = new C();
            a.display();
        }
    }
}
