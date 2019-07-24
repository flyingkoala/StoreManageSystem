using Infrastructure.Sql;
using IRepository;
using Model.Sql;

namespace Repository
{
    public class MaterialsUnitRepository : BaseRepository<r_materials_unit>, IMaterialsUnitRepository
    {
        public MaterialsUnitRepository(DapperSqlServerHelper objSQL) : base(objSQL)
        { }
    }
 }
