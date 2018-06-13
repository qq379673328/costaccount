package cn.com.fanrenlee.auth.model.base;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.com.fanrenlee.auth.entity.ge.TAuthMenufun;

/**
 * 用户所有菜单功能点
 */
public class UserMFVO implements Serializable {

	/** serialVersionUID */
	private static final long serialVersionUID = 6060998445522121643L;
	/**
	 * 所有菜单功能点
	 */
	private Map<String, MFTreeVO> mFTrees;
	private List<TAuthMenufun> mfList;

	public Map<String, MFTreeVO> getmFTrees() {
		return mFTrees;
	}

	public void setmFTrees(Map<String, MFTreeVO> mFTrees) {
		this.mFTrees = mFTrees;
	}

	public List<TAuthMenufun> getMfList() {
		return mfList;
	}

	public void setMfList(List<TAuthMenufun> mfList) {
		this.mfList = mfList;
	}

	public UserMFVO() {
		this.mFTrees = new HashMap<String, MFTreeVO>();
	}

}
