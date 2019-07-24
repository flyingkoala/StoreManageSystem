using System;
using System.Collections.Generic;
using System.Text;

namespace Model.Sql
{
    public class t_operation_log
    {
        public string log_id { get; set; }

        public string userid { get; set; }

        public int? operation { get; set; }
        public string success { get; set; }

        public DateTime? createtime { get; set; }
    }
}
