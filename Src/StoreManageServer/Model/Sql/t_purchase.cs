using System;
using System.Collections.Generic;
using System.Text;

namespace Model.Sql
{
    public class t_purchase
    {
        public string purchase_id { get; set; }
        public string materials_id { get; set; }
        public string shop_id { get; set; }
        public string store_id { get; set; }
        public int? state { get; set; }
        public decimal? num { get; set; }

        public int? realnum { get; set; }

        public string unit_id { get; set; }

        public string supplier_id { get; set; }
        public DateTime? createtime { get; set; }
        public DateTime? purchasetime { get; set; }
        public DateTime? arrivetime { get; set; }
        public string apply_id { get; set; }
        public decimal? purchase_singleprice { get; set; }
    }
}
