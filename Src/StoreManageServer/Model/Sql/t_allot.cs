using System;
using System.Collections.Generic;
using System.Text;

namespace Model.Sql
{
    public class t_allot
    {
        public string allot_id { get; set; }
        public string materials_id { get; set; }
        public int? state { get; set; }
        public string from_shop_id { get; set; }
        public string from_store_id { get; set; }
        public string to_shop_id { get; set; }
        public string to_store_id { get; set; }
        public string unit_id { get; set; }
        public decimal? allot_num { get; set; }
        public decimal? allot_singleprice { get; set; }
        public DateTime? createtime { get; set; }
        public DateTime? allotedtime { get; set; }
    }
}
