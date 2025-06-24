using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

// A -> D .. display C
namespace MatrixDemo
{
    class A3
    {
        public virtual void display()
        {
            Console.WriteLine("In A3 Display");
        }
    }

    class B3 : A3
    {
        public override void display()
        {
            Console.WriteLine("In B3 Display");
        }
    }

    class C3 : B3
    {
        public override void display()
        {
            Console.WriteLine("In C3 Display");
        }
    }
    class D3 : C3
    {
        public new virtual void display()
        {
            Console.WriteLine("In C3 Display");
        }
    }
    internal class Demo2
    {

        public static void Main(string[] args)
        {
            A3 a3 = new D3();
            a3.display();       
        }
    }
}
