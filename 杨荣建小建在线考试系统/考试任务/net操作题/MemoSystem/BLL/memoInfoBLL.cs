using Model.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

namespace BLL
{
    public class memoInfoBLL
    {
        public DataTable GetList()
        {
            return new memoInfoDal().GetList("");
        }

        public void Delete(int id)
        {
            new memoInfoDal().Delete(id);
        }
    }
}
