package com.irs.service;

import com.irs.pojo.TbRepairs;
import com.irs.util.ResultUtil;

public interface RepairsService {

    /*
    添加报修单
    */
    public void addRepairs(TbRepairs repairs);

    /*
    获取所有报修单
     */
    public ResultUtil getAllRepairs(Integer page, Integer limit);

    /*
    根据ID获取单个实例
     */
    public TbRepairs selectById(Long id);

    /*
    根据提交人获取所有报修单
     */
    public ResultUtil selectByAdminId(Integer page, Integer limit,Long id,Long roleId);

    /*
    根据处理人获取所有报修单
     */
    public ResultUtil selectByHandelId(Integer page, Integer limit,Long id);

    /*
    根据报修单类型获取所有报修单
     */
    public ResultUtil selectByFormType(Integer page, Integer limit,Integer formType);

    /*
    删除指定报修单
     */
    public void deleteById(Long id);

    /*
    更新报修单
     */
    public void updRepair(TbRepairs repairs);
}
