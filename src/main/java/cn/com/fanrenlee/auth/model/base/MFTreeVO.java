package cn.com.fanrenlee.auth.model.base;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import cn.com.fanrenlee.auth.entity.ge.TAuthMenufun;

/**
 * 单个系统树状菜单功能点
 */
public class MFTreeVO implements Cloneable, Serializable {

	/** serialVersionUID */
	private static final long serialVersionUID = -1128605302396538549L;
	private TAuthMenufun mfVO;
	private List<MFTreeVO> children;

	public TAuthMenufun getMfVO() {
		return mfVO;
	}

	public void setMfVO(TAuthMenufun mfVO) {
		this.mfVO = mfVO;
	}

	public List<MFTreeVO> getChildren() {
		return children;
	}

	public void setChildren(List<MFTreeVO> children) {
		this.children = children;
	}

	public void addChild(MFTreeVO mfTreeVO) {
		if (this.children == null) {
			this.children = new ArrayList<MFTreeVO>();
		}
		this.children.add(mfTreeVO);
	}

	@Override
	public MFTreeVO clone() {
		MFTreeVO o = null;
		try {
			o = (MFTreeVO) super.clone();
		} catch (CloneNotSupportedException ex) {
			ex.printStackTrace();
		}
		return o;
	}
}
