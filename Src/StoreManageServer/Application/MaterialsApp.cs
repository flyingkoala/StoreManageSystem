using Infrastructure;
using IRepository;
using Model.Sql;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application
{
    public class MaterialsApp
    {
        private IMaterialsUnitRepository _mu;
        public MaterialsApp(IMaterialsUnitRepository mu)
        {
            _mu = mu;
        }

        public ResultModel Add()
        {
            ResultModel resResult = new ResultModel();
            string msg = "";
            r_materials_unit obj = new r_materials_unit();
            obj.id = "111";
            obj.materials_id = "222";
            obj.unit_id = "333";
            obj.multiple = 2;
            msg = _mu.Insert(obj);
            if (msg == "0")
            {
                resResult.Success(msg,"");
            }
            else
            {
                resResult.Failure(msg);
            }
            return resResult;
        }
    }
}
