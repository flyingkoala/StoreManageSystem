using System;
using System.Collections.Generic;

namespace IRepository
{
    public interface IBaseRepository<T> where T : class
    {
        string Insert(T entity);
        int Insert(T entity, out string result);
        string BatchInsert(List<T> entitys);
        string Update(T entityToUpdate);
        string Update(T entityToUpdate, T entityOfWhere, bool LoptIsAnd);
        string Delete(T entityOfWhere, bool LoptIsAnd);
        //IEnumerable<T> GetList(string sql, object parameters, out string result);
        //(IEnumerable<T1>, IEnumerable<T2>) GetMultipleList<T1, T2>(string sql, object parameters, out string result);
        //(IEnumerable<T1>, IEnumerable<T2>, IEnumerable<T3>) GetMultipleList<T1, T2, T3>(string sql, object parameters, out string result);

    }
}
