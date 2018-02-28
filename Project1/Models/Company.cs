//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Project1.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public partial class Company
    {
        [Key]
        public int CompId { get; set; }
        [Required(ErrorMessage = "Please upload an image")]
        public byte[] CompImg { get; set; }
        [Required(ErrorMessage = "Company name is required")]
        [Display(Name = "Name")]
        public string CompName { get; set; }
        [Required(ErrorMessage = "Company representative is required")]
        [Display(Name = "Representative")]
        public string CompRep { get; set; }
        [Required(ErrorMessage = "Date of established is required")]
        [Display(Name = "Date of Established")]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:dd-MM-yyyy}", ApplyFormatInEditMode = true)]
        public Nullable<System.DateTime> CompDOE { get; set; }
        [Required(ErrorMessage = "Company address is required")]
        [Display(Name = "Address")]
        public string CompAddr { get; set; }
        [Required(ErrorMessage = "Company category is required")]
        [Display(Name = "Category")]
        public string CompCat { get; set; }
        [Required(ErrorMessage = "Company email is required")]
        [Display(Name = "Email")]
        [RegularExpression(@"^([\w-\.]+)@((\[[0-9]{1,3]\.)|(([\w-]+\.)+))([a-zA-Z{2,4}|[0-9]{1,3})(\]?)$", ErrorMessage = "Please enter valid email.")]
        public string CompEmail { get; set; }
        [Display(Name = "Contact")]
        [Required(ErrorMessage = "Company contact is required")]
        public string CompCont { get; set; }
        [Display(Name ="Description")]
        [Required(ErrorMessage = "Company description is required")]
        public string CompDesc { get; set; }        
    }
}
