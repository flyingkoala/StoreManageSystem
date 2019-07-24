using System;
using System.Collections.Generic;
using System.Text;

namespace Model.Sql
{
    public class t_materials
    {
        public string materials_id { get; set; }
        public string name { get; set; }
        public string isdelete { get; set; }
        public int? state { get; set; }
    }
}
