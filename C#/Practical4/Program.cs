using System.Xml.Linq;

namespace Practical3
{
    class Program
    {
        static void Main(string[] args)
        {
            XDocument doc = XDocument.Load("C:\\TYIT_014\\C#\\Practical3\\products.xml");
            var products = doc.Elements();
            displayLaptopUnder40k(products);
            displayAllNamePrice(products);
            displayLaptopNameDom(products);
            displayProductWithDom(products, "2024-07-01");
            displaySpecificDescProducts(products, "amd");
            displaySpecificDescProducts(products, "intel");
        }

        static void displayResult(IEnumerable<dynamic> result)
        {
            foreach (var item in result)
                Console.WriteLine(item);
            Console.WriteLine(); 
            
        }

        static void displayLaptopUnder40k(IEnumerable<XElement> data)
        {
            Console.WriteLine("<=== Products Worth more than 40k ===>");

            var result = data.Elements("Product")
              .Where(x => (int)x.Element("price") > 40000 && ((string)x.Element("category")).Equals("Laptop")).Select(x => new
              {
                  name = x.Element("pname").Value,
                  price = x.Element("price").Value,
                  dom = x.Element("dom").Value,
                  category = x.Element("category").Value,
              });

            displayResult(result);
        }
        static void displayAllNamePrice(IEnumerable<XElement> data)
        {
            Console.WriteLine("<=== Name and Price of all Products ===>");
            var result = data.Elements("Product").Select(x => new
            {
                name = x.Element("pname").Value,
                price = x.Element("price").Value,
            });

            displayResult(result);
        }

        static void displayLaptopNameDom(IEnumerable<XElement> data)
        {
            Console.WriteLine("<=== Name and DOM of all Laptops ===>");
            var result = data.Elements("Product").Where(x => ((string)x.Element("category")).Equals("Laptop")).Select(x => new
            {
                name = x.Element("pname").Value,
                dom = x.Element("dom").Value,
            });

            displayResult(result);
        }

        static void displayProductWithDom(IEnumerable<XElement> data, String dom)
        {
            Console.WriteLine("<=== Name and DOM of all Products manufactured on or after {0} ===>", dom);
            var result = data.Elements("Product").Where(x => 
                    DateTime.ParseExact((string)x.Element("dom").Value, "yyyy-MM-dd", null) >= DateTime.ParseExact(dom, "yyyy-MM-dd", null)
            ).Select(x => new
            {
                name = x.Element("pname").Value,
                dom = DateTime.ParseExact((string)x.Element("dom").Value, "yyyy-MM-dd", null),
            });

            displayResult(result);
        }

        static void displaySpecificDescProducts(IEnumerable<XElement> data, String filter)
        {
            Console.WriteLine("<=== Products With {0} ===>", filter);
            var result = data.Elements("Product").Where(x =>
                    ((string)x.Element("description").Value).ToLower().Contains(filter.ToLower())
            ).Select(x => new
            {
                name = x.Element("pname").Value,
                description = x.Element("description").Value
            });

            displayResult(result);
        }
    }
}