using System;
using System.Collections.Generic;
using System.Text;

namespace Model.Sql
{
    public class r_materials_unit
    {
        public string id { get; set; }
        public string unit_id { get; set; }
        public string materials_id { get; set; }
        public decimal? multiple { get; set; }
    }
}
