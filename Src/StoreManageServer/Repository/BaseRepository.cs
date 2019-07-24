using Infrastructure.Sql;
using IRepository;
using System;
using System.Collections.Generic;
using System.Text;

namespace Repository
{
    public class BaseRepository<T> : IBaseRepository<T> where T : class
    {
        protected readonly DapperSqlServerHelper _objSQL;
        public BaseRepository(DapperSqlServerHelper objSQL)
        {
            _objSQL = objSQL;
        }

        public string Insert(T entity)
        {
            return _objSQL.Insert(entity);
        }
        public int Insert(T entity, out string result)
        {
            return _objSQL.Insert(entity, out result);
        }
        public string BatchInsert(List<T> entitys)
        {
            return _objSQL.BatchInsert(entitys);
        }

        public string Update(T entityToUpdate)
        {
            return _objSQL.Update(entityToUpdate);
        }

        public string Update(T entityToUpdate, T entityOfWhere, bool LoptIsAnd)
        {
            return _objSQL.Update(entityToUpdate, entityOfWhere, LoptIsAnd);
        }

        public string Delete(T entityOfWhere, bool LoptIsAnd)
        {
            return _objSQL.Delete(entityOfWhere, LoptIsAnd);
        }


    }
}

