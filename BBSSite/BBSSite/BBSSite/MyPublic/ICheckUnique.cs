﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BBSSite.MyPublic
{
    /// <summary>
    /// 验证数据接口
    /// </summary>
    public interface ICheckUnique
    {
        bool CheckUnique(string value, int MyType, int KeyID);
    }
}