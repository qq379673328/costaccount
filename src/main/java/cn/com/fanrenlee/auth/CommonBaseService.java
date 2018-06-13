/**
 *
 *
 * @author <a href="mailto:nytclizy@gmail.com">李志勇</a>
 * @date 2014-11-12
 */
package cn.com.fanrenlee.auth;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.com.fanrenlee.auth.entity.ge.TAuthMenufun;
import cn.com.fanrenlee.auth.model.base.MFTreeVO;

/**
 * 通用服务
 */
@Service
public class CommonBaseService {

	public static final String NAMESPACE_BASE_DEFAULT = "cn.com.sinosoft.common.base.";

	@Resource
	BaseDao dao;

	/**
	 * 获取用户所有具有权限的菜单功能点
	 *
	 * @param userId
	 *            用户id
	 * @param type
	 *            类型：1-菜单、2-功能点
	 * @return
	 * @author <a href="mailto:nytclizy@gmail.com">李志勇</a>
	 */
	public MFTreeVO getUserMF(String userId, String type) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("userId", userId);
		params.put("type", type);
		List<TAuthMenufun> items = dao.selectList(NAMESPACE_BASE_DEFAULT + "menu-fun-list", params);
		// 将菜单和功能点组装成一棵树
		return renderMenusAndFuns(items);
	}

	// 将菜单以及功能点融合成一棵树
	public MFTreeVO renderMenusAndFuns(List<TAuthMenufun> mfs) {
		List<TAuthMenufun> listMFVO = new ArrayList<TAuthMenufun>();
		for (TAuthMenufun mf : mfs) {
			listMFVO.add(mf);
		}
		// 获取0级菜单
		List<TAuthMenufun> firstlevelMenus = getFirstlevelMenus(mfs);
		for (TAuthMenufun mf : firstlevelMenus) {// 循环所有初级菜单
			return handleOneLevelMF(mf, mfs);
		}
		return null;
	}

	/**
	 *
	 * 获取初级菜单-父菜单为空或者level为0
	 *
	 */
	private List<TAuthMenufun> getFirstlevelMenus(List<TAuthMenufun> allMenus) {
		List<TAuthMenufun> ret = new ArrayList<TAuthMenufun>();
		for (TAuthMenufun menu : allMenus) {
			if ("0".equals(menu.getMfLevel()) || menu.getPmfId() == null) {
				ret.add(menu);
			}
		}
		return ret;
	}

	/**
	 * 递归处理某一个菜单
	 */
	private MFTreeVO handleOneLevelMF(TAuthMenufun mf, List<TAuthMenufun> mfs) {
		MFTreeVO mfTreeVO = new MFTreeVO();
		mfTreeVO.setMfVO(mf);
		for (TAuthMenufun item : mfs) {
			if (mf.getId().equals(item.getPmfId())) {
				MFTreeVO newMfTree = handleOneLevelMF(item, mfs);
				mfTreeVO.addChild(newMfTree);
			}
		}
		return mfTreeVO;
	}

}
