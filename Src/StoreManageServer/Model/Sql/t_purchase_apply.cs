using System;
using System.Collections.Generic;
using System.Text;

namespace Model.Sql
{
    public class t_purchase_apply
    {
        public string apply_id { get; set; }
        public string materials_id { get; set; }
        public string shop_id { get; set; }
        public string store_id { get; set; }
        public int? state { get; set; }
        public decimal? num { get; set; }

        public string unit_id { get; set; }

        public DateTime? applytime { get; set; }
    }
}
