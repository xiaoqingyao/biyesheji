using Model.DAL;
using System;
using System.Collections.Generic;
using System.Text;

namespace BLL
{
    public class userInfoBLL
    {
        public bool IsExit(string uname,string pwd) {
            return new userInfoDal().GetModel(uname, pwd) != null;
        }
    }
}
