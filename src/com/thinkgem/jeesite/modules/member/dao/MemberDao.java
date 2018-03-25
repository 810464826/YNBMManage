/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.member.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.member.entity.Member;

/**
 * 会员管理DAO接口
 * @author lucio
 * @version 2016-08-01
 */
@MyBatisDao
public interface MemberDao extends CrudDao<Member> {
}