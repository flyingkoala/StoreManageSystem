using System;
using System.Collections.Generic;
using System.Text;

namespace Model.Sql
{
    public class t_shop
    {
        public string shop_id { get; set; }

        public string user_id { get; set; }
        public string name { get; set; }
        public string address { get; set; }
        public string tel { get; set; }
        public int? state { get; set; }
        public DateTime? createtime { get; set; }
        public string pid { get; set; }
    }
}
