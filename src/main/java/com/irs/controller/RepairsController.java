package com.irs.controller;

import com.irs.annotation.SysLog;
import com.irs.pojo.TbAdmin;
import com.irs.pojo.TbRepairs;
import com.irs.service.RepairsService;
import com.irs.util.ResultUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.sql.Timestamp;
import java.util.Date;

@Controller
@RequestMapping("repairs")
public class RepairsController {
    @Autowired
    private RepairsService repairsServiceImpl;

    @RequestMapping("repairAdd")
    @RequiresPermissions("repairs:repairs:save")
    public String repairAdd(){
        return "page/repairs/addRepair";
    }
    /**
     * 更新报修单
     * @param repairs
     * @return
     */
    @SysLog(value="添加报修单信息")
    @RequestMapping("addRepair")
    @RequiresPermissions("repairs:repairs:save")
    @ResponseBody
    public ResultUtil addRepair(TbRepairs repairs){
        try {
            TbAdmin admin = (TbAdmin) SecurityUtils.getSubject().getPrincipal();
            repairs.setStatus(0);
            repairs.setAdminId(admin.getId());
            repairs.setAdminName(admin.getUsername());
            repairs.setCreateDate(new Timestamp(System.currentTimeMillis()));
            repairsServiceImpl.addRepairs(repairs);
            return ResultUtil.ok();
        } catch (Exception e) {
            e.printStackTrace();
            return ResultUtil.error();
        }
    }

    @RequestMapping("repairsList")
    @RequiresPermissions("repairs:repairs:list")
    public String repairsList(){
        return "page/repairs/repairsList";
    }

    @RequestMapping("getRepairsList")
    @RequiresPermissions("repairs:repairs:list")
    @ResponseBody
    public ResultUtil getRepairsList(Integer page, Integer limit){
        TbAdmin admin = (TbAdmin) SecurityUtils.getSubject().getPrincipal();
        Long id=admin.getId();
        Long roleId=admin.getRoleId();
        if(roleId==1||roleId==7){//如果为管理员或者维修部门主管则查看所有报修单
            roleId=0L;
        }
        return repairsServiceImpl.selectByAdminId(page,limit,id,roleId);
    }

    @RequestMapping("updateRepair/{id}")
    @RequiresPermissions("repairs:repairs:edit")
    public String editRepair(@PathVariable("id")String id, Model model){
        TbRepairs repairs=repairsServiceImpl.selectById(Long.parseLong(id));
        model.addAttribute("repair", repairs);
        return "page/repairs/editRepair";
    }
    /**
     * 更新报修单
     * @param repairs
     * @return
     */
    @SysLog(value="更新报修单信息")
    @RequestMapping("updateRepair")
    @RequiresPermissions("repairs:repairs:edit")
    @ResponseBody
    public ResultUtil updateRepair(TbRepairs repairs){
        try {
            repairs.setModifyDate(new Timestamp(System.currentTimeMillis()));
            if(repairs.getStatus()==1){//处理报修单
                TbAdmin admin = (TbAdmin) SecurityUtils.getSubject().getPrincipal();
                repairs.setHandlerId(admin.getId());
                repairs.setHandlerName(admin.getUsername());
            }
            repairsServiceImpl.updRepair(repairs);
            return ResultUtil.ok();
        } catch (Exception e) {
            e.printStackTrace();
            return ResultUtil.error();
        }
    }

    /**
     * 根据ID删除
     * @param id
     * @return
     */
    @SysLog(value="根据ID删除用户")
    @RequestMapping("/deleteById/{id}")
    @RequiresPermissions("repairs:repairs:delete")
    @ResponseBody
    public ResultUtil deleteById(@PathVariable("id")Long id){
        try {
            repairsServiceImpl.deleteById(id);;
            return ResultUtil.ok();
        } catch (Exception e) {
            e.printStackTrace();
            return ResultUtil.error();
        }
    }


    /**
     * 更新报修单
     * @param repairs
     * @return
     */
    @SysLog(value="转交报修单")
    @RequestMapping("deliverRepair")
    @RequiresPermissions("repairs:repairs:deliver")
    @ResponseBody
    public ResultUtil deliverRepair(TbRepairs repairs){//转交只需写入应该处理人：handlerId,handlerName即可
        try {
            repairs.setModifyDate(new Timestamp(System.currentTimeMillis()));
            repairsServiceImpl.updRepair(repairs);
            return ResultUtil.ok();
        } catch (Exception e) {
            e.printStackTrace();
            return ResultUtil.error();
        }
    }

    /**
     * 评价报修单
     * @param repairs
     * @return
     */
    @SysLog(value="评价报修单")
    @RequestMapping("evaluateRepair")
    @RequiresPermissions("repairs:repairs:evaluate")
    @ResponseBody
    public ResultUtil evaluateRepair(TbRepairs repairs){
        try {
            repairs.setModifyDate(new Timestamp(System.currentTimeMillis()));
            repairs.setEvaluateFlag(1);//设置已评价标识，已评价之后不可重复评价
            repairsServiceImpl.updRepair(repairs);
            return ResultUtil.ok();
        } catch (Exception e) {
            e.printStackTrace();
            return ResultUtil.error();
        }
    }

}
