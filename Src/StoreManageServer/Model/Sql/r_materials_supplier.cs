using System;
using System.Collections.Generic;
using System.Text;

namespace Model.Sql
{
    public class r_materials_supplier
    {
        public string id { get; set; }

        public string materials_id { get; set; }

        public string supplier_id { get; set; }

        public string unit_id { get; set; }
        public decimal? supplier_singleprice { get; set; }
    }
}
