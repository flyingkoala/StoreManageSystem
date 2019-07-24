using System;
using System.Collections.Generic;
using System.Text;

namespace Model.Sql
{
    public class t__store_materialsnum_record
    {
        public string id { get; set; }
        public string store_id { get; set; }
        public string shop_id { get; set; }
        public string materials_id { get; set; }
        public string unit_id { get; set; }
        public decimal? change_num { get; set; }
        public string change_type { get; set; }
        public int? change_reason { get; set; }
        public string purchase_id { get; set; }
    }
}
