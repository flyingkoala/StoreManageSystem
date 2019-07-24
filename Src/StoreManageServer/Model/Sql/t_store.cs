using System;
using System.Collections.Generic;
using System.Text;

namespace Model.Sql
{
    public class t_store
    {
        public string store_id { get; set; }
        public string shop_id { get; set; }
        public string name { get; set; }
        public string ismain { get; set; }

        public int? state { get; set; }
        public string shopid { get; set; }
        public DateTime? createtime { get; set; }
    }
}
