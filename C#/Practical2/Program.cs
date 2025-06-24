namespace MatrixDemo
{
    class A
    {
        public virtual void display() {
            Console.WriteLine("In A Display");
        }
    }

    class B:A
    {
        public override void display()
        {
            Console.WriteLine("In B Display");
        }
    }
    class C:B
    {
        public override void display()
        {
            Console.WriteLine("In C Display");
        }
    }

    class Program : C
    {
        public override void display()
        {
            Console.WriteLine("In Program Display");
        }
        static void Main(string[] args)
        {
            A a = new Program();
            a.display();
        }
    }
}