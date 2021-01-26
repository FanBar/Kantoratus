using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Kantoratus.Persistence.Entities
{
    public class Piece : Entity
    {
        [Required]
        public string Composer { get; set; }

        [Required]
        public string Title { get; set; }
    }
}
