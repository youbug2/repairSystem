package com.irs.mapper;

import com.irs.pojo.TbRepairs;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TbRepairsMapper {

    int addRepair(TbRepairs repairs);

    List<TbRepairs> getAllRepairs();

    TbRepairs selectById(Long id);

    List<TbRepairs> selectByAdminId(@Param("id")Long id,@Param("roleId")Long roleId);

    List<TbRepairs> selectByHandelId(Long id);

    List<TbRepairs> selectByFormType(Integer formType);

    int deleteById(Long id);

    int updateRepair(TbRepairs repairs);
}
