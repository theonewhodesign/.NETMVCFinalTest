//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace AppraisalTracker.Models
{
    using System.ComponentModel.DataAnnotations;

    public partial class Admin
    {
        public int ID { get; set; }

        //Admin username
        [Required]
        public string Username { get; set; }

        //admin password
        [Required]
        public string Password { get; set; }
    }
}