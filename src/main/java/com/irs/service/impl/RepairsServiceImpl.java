package com.irs.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.irs.mapper.TbRepairsMapper;
import com.irs.pojo.TbRepairs;
import com.irs.pojo.TbRoles;
import com.irs.pojo.TbRolesExample;
import com.irs.service.RepairsService;
import com.irs.util.ResultUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RepairsServiceImpl implements RepairsService {

    @Autowired
    private TbRepairsMapper tbRepairsMapper;

    @Override
    public void addRepairs(TbRepairs repairs) {
         tbRepairsMapper.addRepair(repairs);
    }

    @Override
    public ResultUtil getAllRepairs(Integer page, Integer limit) {
        PageHelper.startPage(page, limit);
        List<TbRepairs> list = tbRepairsMapper.getAllRepairs();
        PageInfo<TbRepairs> pageInfo = new PageInfo<>(list);
        ResultUtil resultUtil = new ResultUtil();
        resultUtil.setCode(0);
        resultUtil.setCount(pageInfo.getTotal());
        resultUtil.setData(pageInfo.getList());
        return resultUtil;
    }

    @Override
    public TbRepairs selectById(Long id) {
        return tbRepairsMapper.selectById(id);
    }

    @Override
    public ResultUtil selectByAdminId(Integer page, Integer limit, Long id,Long roleId) {
        PageHelper.startPage(page, limit);
        List<TbRepairs> list = tbRepairsMapper.selectByAdminId(id,roleId);
        PageInfo<TbRepairs> pageInfo = new PageInfo<>(list);
        ResultUtil resultUtil = new ResultUtil();
        resultUtil.setCode(0);
        resultUtil.setCount(pageInfo.getTotal());
        resultUtil.setData(pageInfo.getList());
        return resultUtil;
    }

    @Override
    public ResultUtil selectByHandelId(Integer page, Integer limit, Long id) {
        PageHelper.startPage(page, limit);
        List<TbRepairs> list = tbRepairsMapper.selectByHandelId(id);
        PageInfo<TbRepairs> pageInfo = new PageInfo<>(list);
        ResultUtil resultUtil = new ResultUtil();
        resultUtil.setCode(0);
        resultUtil.setCount(pageInfo.getTotal());
        resultUtil.setData(pageInfo.getList());
        return resultUtil;
    }

    @Override
    public ResultUtil selectByFormType(Integer page, Integer limit, Integer formType) {
        PageHelper.startPage(page, limit);
        List<TbRepairs> list = tbRepairsMapper.selectByFormType(formType);
        PageInfo<TbRepairs> pageInfo = new PageInfo<>(list);
        ResultUtil resultUtil = new ResultUtil();
        resultUtil.setCode(0);
        resultUtil.setCount(pageInfo.getTotal());
        resultUtil.setData(pageInfo.getList());
        return resultUtil;
    }

    @Override
    public void deleteById(Long id) {
        tbRepairsMapper.deleteById(id);
    }

    @Override
    public void updRepair(TbRepairs repairs) {
        tbRepairsMapper.updateRepair(repairs);
    }
}
