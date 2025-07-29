using System.ComponentModel.DataAnnotations;

namespace ERP.Models
{
    public class Student
    {
        public int Id { get; set; }

        [Required]
        [RegularExpression(@"^[A-Za-z\s]{2,50}$", ErrorMessage = "Use letters only")]
        public string Name { get; set; }

        [Required]
        [EmailAddress]
        public string Email { get; set; }

        [Required]
        [RegularExpression(@"^\d{10}$", ErrorMessage = "Phone must be 10 digits")]
        public string Phone { get; set; }

        [Range(1, 100)]
        public int Age { get; set; }
    }
}
