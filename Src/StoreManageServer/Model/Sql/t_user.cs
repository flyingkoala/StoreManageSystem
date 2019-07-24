using System;
using System.Collections.Generic;
using System.Text;

namespace Model.Sql
{
    public class t_user
    {
        public string user_id { get; set; }
        public string loginname { get; set; }
        public string username { get; set; }
        public int? state { get; set; }
        public string mobile { get; set; }
        public string shop_id { get; set; }
        public string role_id { get; set; }
    }
}
